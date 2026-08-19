#!/usr/bin/env python3
"""Build bounded A.1b target boxes from reviewed post-office seed rows."""

from __future__ import annotations

import argparse
import csv
import hashlib
import re
from pathlib import Path


FIELDNAMES = [
    "target_id",
    "label",
    "anchor_field",
    "state",
    "primary_city",
    "target_kind",
    "postal_code_hint",
    "min_lat",
    "max_lat",
    "min_lon",
    "max_lon",
    "pilot_role",
    "target_note",
    "seed_facility_id",
    "seed_facility_name",
    "seed_source",
    "seed_source_date",
    "sample_stratum",
    "settlement_size_proxy",
]


def slug(value: str) -> str:
    normalized = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return normalized or "unknown"


def stable_hash(row: dict[str, str]) -> str:
    parts = [
        row.get("facility_id", ""),
        row.get("facility_name", ""),
        row.get("city", ""),
        row.get("state", ""),
        row.get("latitude", ""),
        row.get("longitude", ""),
    ]
    return hashlib.sha1("|".join(parts).encode("utf-8")).hexdigest()[:10]


def seeded_sample_hash(sample_seed: str, target: dict[str, str]) -> str:
    return hashlib.sha256(
        f"{sample_seed}|{target['target_id']}".encode("utf-8")
    ).hexdigest()


def require_float(row: dict[str, str], field: str) -> float:
    value = row.get(field, "")
    if not value:
        raise ValueError(f"Missing {field} for seed row {row.get('facility_id', '')}")
    return float(value)


def packet_ready_post_office(row: dict[str, str]) -> bool:
    return (
        row.get("facility_type") == "post_office"
        and row.get("review_status") == "packet_ready"
        and bool(row.get("latitude"))
        and bool(row.get("longitude"))
    )


def target_from_seed(
    row: dict[str, str],
    *,
    lat_delta: float,
    lon_delta: float,
    stratum_field: str,
    settlement_size_proxy: str,
) -> dict[str, str]:
    lat = require_float(row, "latitude")
    lon = require_float(row, "longitude")
    city = row.get("city", "").strip() or "Unknown"
    state = row.get("state", "").strip() or "US"
    name = row.get("facility_name", "").strip() or "Post Office"
    row_hash = stable_hash(row)
    target_id = f"national-post-office-{slug(state)}-{slug(city)}-{row_hash}"
    stratum = row.get(stratum_field, "").strip() if stratum_field in row else ""
    if not stratum:
        stratum = state
    return {
        "target_id": target_id,
        "label": f"{city} post-office-centered national sample candidate",
        "anchor_field": "national_post_office_sample_candidate",
        "state": state,
        "primary_city": city,
        "target_kind": "post_office_point_probe",
        "postal_code_hint": row.get("postal_code", ""),
        "min_lat": f"{lat - lat_delta:.4f}",
        "max_lat": f"{lat + lat_delta:.4f}",
        "min_lon": f"{lon - lon_delta:.4f}",
        "max_lon": f"{lon + lon_delta:.4f}",
        "pilot_role": "national_sample_contract_probe",
        "target_note": (
            "Bounded around reviewed open post-office seed; target box is a "
            "sample probe, not a city, ZIP, ZCTA, CDP, county, trade-area, "
            "or catchment boundary."
        ),
        "seed_facility_id": row.get("facility_id", ""),
        "seed_facility_name": name,
        "seed_source": row.get("source", ""),
        "seed_source_date": row.get("source_date", ""),
        "sample_stratum": stratum,
        "settlement_size_proxy": settlement_size_proxy,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", required=True, help="Reviewed post-office seed CSV")
    parser.add_argument("--output", required=True, help="Output target-box CSV")
    parser.add_argument("--stratum-field", default="state")
    parser.add_argument("--sample-per-stratum", type=int, default=0)
    parser.add_argument(
        "--sample-seed",
        default="",
        help=(
            "Optional deterministic seed for SHA256 within-stratum sample ordering; "
            "default preserves target_id ordering."
        ),
    )
    parser.add_argument("--max-total", type=int, default=0)
    parser.add_argument("--lat-delta", type=float, default=0.035)
    parser.add_argument("--lon-delta", type=float, default=0.045)
    parser.add_argument("--settlement-size-proxy", default="not_joined")
    args = parser.parse_args()

    seeds_path = Path(args.seeds)
    output_path = Path(args.output)
    with seeds_path.open(newline="", encoding="utf-8") as handle:
        seeds = [row for row in csv.DictReader(handle) if packet_ready_post_office(row)]

    targets = [
        target_from_seed(
            row,
            lat_delta=args.lat_delta,
            lon_delta=args.lon_delta,
            stratum_field=args.stratum_field,
            settlement_size_proxy=args.settlement_size_proxy,
        )
        for row in seeds
    ]
    if args.sample_seed:
        targets.sort(
            key=lambda row: (
                row["sample_stratum"],
                seeded_sample_hash(args.sample_seed, row),
                row["target_id"],
            )
        )
    else:
        targets.sort(key=lambda row: (row["sample_stratum"], row["target_id"]))

    if args.sample_per_stratum > 0:
        sampled: list[dict[str, str]] = []
        current_stratum = None
        current_count = 0
        for target in targets:
            if target["sample_stratum"] != current_stratum:
                current_stratum = target["sample_stratum"]
                current_count = 0
            if current_count < args.sample_per_stratum:
                sampled.append(target)
                current_count += 1
        targets = sampled

    if args.max_total > 0:
        targets = targets[: args.max_total]

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(targets)


if __name__ == "__main__":
    main()
