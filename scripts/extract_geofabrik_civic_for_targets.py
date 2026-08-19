#!/usr/bin/env python3
"""Extract Geofabrik POI sidecars for bounded TURF target boxes."""

from __future__ import annotations

import argparse
import csv
import sqlite3
from pathlib import Path

from extract_geofabrik_post_office_seed import geometry_point
from fetch_osm_civic import FIELDNAMES


FACILITY_FCLASSES = {
    "dollar_store": set(),
    "food_service": {"restaurant", "fast_food", "cafe"},
    "gas_convenience": {"fuel", "convenience", "kiosk"},
    "hardware": {"doityourself"},
    "laundromat": {"laundry"},
}

TABLES = [
    ("gis_osm_pois_free", "node"),
    ("gis_osm_pois_a_free", "way"),
]


def in_box(lat: float, lon: float, target: dict[str, str]) -> bool:
    return (
        float(target["min_lat"]) <= lat <= float(target["max_lat"])
        and float(target["min_lon"]) <= lon <= float(target["max_lon"])
    )


def review_status(name: str, facility_type: str) -> tuple[str, str]:
    lower_name = name.lower()
    if facility_type == "dollar_store":
        target_names = ("dollar general", "dollar tree", "family dollar")
        if not any(target in lower_name for target in target_names):
            return "exclude", "non_target_variety_store"
    if facility_type == "food_service" and not name:
        return "exclude", "unnamed_food_service_anchor"
    if facility_type == "gas_convenience" and not name:
        return "exclude", "unnamed_trip_anchor"
    if facility_type == "hardware" and not name:
        return "exclude", "unnamed_trade_anchor"
    if facility_type == "laundromat" and not name:
        return "exclude", "unnamed_household_service_anchor"
    return "packet_ready", f"geofabrik_named_{facility_type}"


def extract_features(args: argparse.Namespace) -> list[dict[str, str]]:
    fclasses = FACILITY_FCLASSES[args.facility_type]
    connection = sqlite3.connect(args.gpkg)
    features = []
    for table_name, osm_kind in TABLES:
        if args.facility_type == "dollar_store":
            query = f"select geom, osm_id, fclass, name from {table_name} where name is not null"
            params = []
        else:
            placeholders = ",".join("?" for _ in fclasses)
            query = (
                f"select geom, osm_id, fclass, name from {table_name} "
                f"where fclass in ({placeholders})"
            )
            params = sorted(fclasses)
        for geom, osm_id, fclass, name in connection.execute(query, params):
            if args.facility_type == "dollar_store":
                lower_name = (name or "").lower()
                if not any(
                    target in lower_name
                    for target in ["dollar general", "dollar tree", "family dollar"]
                ):
                    continue
            lat, lon = geometry_point(geom)
            features.append(
                {
                    "facility_id": f"osm:{osm_kind}:{osm_id}",
                    "facility_name": name or "",
                    "fclass": fclass,
                    "latitude": lat,
                    "longitude": lon,
                }
            )
    return features


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--facility-type", required=True, choices=sorted(FACILITY_FCLASSES))
    parser.add_argument("--gpkg", required=True, help="Geofabrik .gpkg file")
    parser.add_argument("--targets", required=True, help="Target boxes CSV")
    parser.add_argument("--output", required=True, help="Reviewed sidecar CSV")
    parser.add_argument("--source-date", required=True)
    args = parser.parse_args()

    with Path(args.targets).open(newline="", encoding="utf-8") as handle:
        targets = list(csv.DictReader(handle))
    features = extract_features(args)

    rows = []
    for target in targets:
        for feature in features:
            lat = feature["latitude"]
            lon = feature["longitude"]
            if not in_box(lat, lon, target):
                continue
            status, reason = review_status(feature["facility_name"], args.facility_type)
            rows.append(
                {
                    "target_id": target["target_id"],
                    "target_label": target["label"],
                    "anchor_field": target["anchor_field"],
                    "facility_type": args.facility_type,
                    "facility_id": feature["facility_id"],
                    "facility_name": feature["facility_name"],
                    "operator": "",
                    "street_address": "",
                    "city": target["primary_city"],
                    "state": target["state"],
                    "postal_code": target.get("postal_code_hint", ""),
                    "latitude": f"{lat:.7f}",
                    "longitude": f"{lon:.7f}",
                    "source": "Geofabrik OpenStreetMap GeoPackage extract",
                    "source_date": args.source_date,
                    "license_status": "open",
                    "rights_status": "ODbL; attribution and share-alike required",
                    "review_status": status,
                    "review_reason": reason,
                }
            )

    rows.sort(key=lambda row: (row["target_id"], row["facility_name"], row["facility_id"]))
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    print(f"review_rows={len(rows)}")


if __name__ == "__main__":
    main()
