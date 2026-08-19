#!/usr/bin/env python3
"""Build settlement-size proxy joins from Census geocoder and PL geography."""

from __future__ import annotations

import argparse
import csv
import json
import time
import urllib.parse
import urllib.request
from pathlib import Path


FIELDNAMES = [
    "target_id",
    "primary_city",
    "state",
    "postal_code_hint",
    "settlement_size_proxy",
    "settlement_proxy_source",
    "settlement_proxy_source_date",
    "settlement_proxy_note",
    "census_geography_level",
    "census_geoid",
    "census_name",
    "census_population",
]


def bucket(population: int | None) -> str:
    if population is None:
        return "unknown"
    if population < 2500:
        return "under_2500"
    if population < 10000:
        return "2500_to_9999"
    if population < 50000:
        return "10000_to_49999"
    return "50000_plus"


def load_pl_geo_populations(path: Path) -> dict[str, dict[str, str]]:
    populations: dict[str, dict[str, str]] = {}
    with path.open(encoding="utf-8", errors="replace") as handle:
        for line in handle:
            parts = line.rstrip("\n").split("|")
            if len(parts) < 15:
                continue
            sumlev = parts[2]
            if sumlev not in {"060", "160"}:
                continue
            geoid = parts[9]
            if not geoid:
                continue
            try:
                population = int(parts[-7])
            except (ValueError, IndexError):
                continue
            populations[geoid] = {
                "sumlev": sumlev,
                "population": str(population),
                "name": parts[-10],
                "full_name": parts[-9],
            }
    return populations


def target_centroid(target: dict[str, str]) -> tuple[float, float]:
    lat = (float(target["min_lat"]) + float(target["max_lat"])) / 2
    lon = (float(target["min_lon"]) + float(target["max_lon"])) / 2
    return lat, lon


def census_geographies(lat: float, lon: float, user_agent: str) -> dict:
    params = urllib.parse.urlencode(
        {
            "x": f"{lon:.7f}",
            "y": f"{lat:.7f}",
            "benchmark": "Public_AR_Current",
            "vintage": "Current_Current",
            "format": "json",
        }
    )
    url = f"https://geocoding.geo.census.gov/geocoder/geographies/coordinates?{params}"
    request = urllib.request.Request(url, headers={"User-Agent": user_agent})
    with urllib.request.urlopen(request, timeout=60) as response:
        return json.loads(response.read().decode("utf-8"))


def choose_settlement(geographies: dict, populations: dict[str, dict[str, str]]) -> tuple[str, str, str]:
    layers = geographies.get("result", {}).get("geographies", {})
    for layer_name in ["Incorporated Places", "County Subdivisions"]:
        for candidate in layers.get(layer_name, []):
            geoid = candidate.get("GEOID", "")
            if geoid in populations:
                return layer_name, geoid, candidate.get("NAME", "")
    return "", "", ""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--targets", required=True, help="Post-office sample targets CSV")
    parser.add_argument("--pl-geo", required=True, help="2020 PL rigeo2020.pl-style geography file")
    parser.add_argument("--output", required=True, help="Settlement proxy join CSV output")
    parser.add_argument("--source-date", required=True, help="Source date/provenance date")
    parser.add_argument(
        "--source-label",
        default="U.S. Census Bureau 2020 PL 94-171 geography and Census Geocoder",
    )
    parser.add_argument("--user-agent", default="turf-a1b-census-settlement-join/0.1")
    parser.add_argument("--sleep-seconds", type=float, default=0.2)
    args = parser.parse_args()

    populations = load_pl_geo_populations(Path(args.pl_geo))
    with Path(args.targets).open(newline="", encoding="utf-8") as handle:
        targets = list(csv.DictReader(handle))

    rows = []
    for index, target in enumerate(targets):
        lat, lon = target_centroid(target)
        geographies = census_geographies(lat, lon, args.user_agent)
        level, geoid, census_name = choose_settlement(geographies, populations)
        population = int(populations[geoid]["population"]) if geoid else None
        rows.append(
            {
                "target_id": target["target_id"],
                "primary_city": target["primary_city"],
                "state": target["state"],
                "postal_code_hint": target.get("postal_code_hint", ""),
                "settlement_size_proxy": bucket(population),
                "settlement_proxy_source": args.source_label,
                "settlement_proxy_source_date": args.source_date,
                "settlement_proxy_note": (
                    "Coordinate join to Census incorporated place when available; "
                    "otherwise county subdivision as settlement proxy."
                    if geoid
                    else "No Census incorporated place or county subdivision match found."
                ),
                "census_geography_level": level,
                "census_geoid": geoid,
                "census_name": census_name,
                "census_population": str(population) if population is not None else "",
            }
        )
        if index + 1 < len(targets):
            time.sleep(args.sleep_seconds)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    print(f"settlement_join_rows={len(rows)}")


if __name__ == "__main__":
    main()
