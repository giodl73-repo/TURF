#!/usr/bin/env python3
"""Validate reviewed post-office seed CSVs before sample target building."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


REQUIRED_FIELDS = [
    "facility_type",
    "facility_id",
    "facility_name",
    "city",
    "state",
    "postal_code",
    "latitude",
    "longitude",
    "source",
    "source_date",
    "license_status",
    "rights_status",
    "review_status",
    "review_reason",
]

OPEN_LICENSE_STATUSES = {"open"}
PACKET_READY_STATUS = "packet_ready"
POST_OFFICE_TYPE = "post_office"


def nonblank(row: dict[str, str], field: str) -> bool:
    return bool((row.get(field) or "").strip())


def parse_coordinate(value: str, field: str, label: str) -> float:
    try:
        coordinate = float(value)
    except ValueError as exc:
        raise ValueError(f"{label}: invalid {field} {value!r}") from exc
    if field == "latitude" and not -90 <= coordinate <= 90:
        raise ValueError(f"{label}: latitude out of range {coordinate!r}")
    if field == "longitude" and not -180 <= coordinate <= 180:
        raise ValueError(f"{label}: longitude out of range {coordinate!r}")
    return coordinate


def validate_rows(rows: list[dict[str, str]], fields: list[str]) -> list[str]:
    errors: list[str] = []
    missing = [field for field in REQUIRED_FIELDS if field not in fields]
    if missing:
        errors.append(f"Missing required fields: {', '.join(missing)}")
        return errors

    packet_ready_ids: list[str] = []
    for index, row in enumerate(rows, start=2):
        label = row.get("facility_id") or row.get("facility_name") or f"row {index}"
        if row.get("facility_type") != POST_OFFICE_TYPE:
            continue
        if row.get("review_status") != PACKET_READY_STATUS:
            continue

        packet_ready_ids.append((row.get("facility_id") or "").strip())
        for field in [
            "facility_id",
            "facility_name",
            "city",
            "state",
            "latitude",
            "longitude",
            "source",
            "source_date",
            "license_status",
            "rights_status",
            "review_reason",
        ]:
            if not nonblank(row, field):
                errors.append(f"{label}: missing {field}")

        if row.get("license_status") not in OPEN_LICENSE_STATUSES:
            errors.append(f"{label}: license_status must be open for packet-ready seeds")
        if nonblank(row, "latitude"):
            try:
                parse_coordinate(row["latitude"], "latitude", label)
            except ValueError as exc:
                errors.append(str(exc))
        if nonblank(row, "longitude"):
            try:
                parse_coordinate(row["longitude"], "longitude", label)
            except ValueError as exc:
                errors.append(str(exc))

    id_counts = Counter(packet_ready_ids)
    for facility_id, count in sorted(id_counts.items()):
        if facility_id and count > 1:
            errors.append(f"Duplicate packet-ready post-office facility_id: {facility_id}")
    if not packet_ready_ids:
        errors.append("No packet-ready post-office seed rows found")
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", required=True, help="Reviewed post-office seed CSV")
    args = parser.parse_args()

    seeds_path = Path(args.seeds)
    with seeds_path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        rows = list(reader)
        fields = list(reader.fieldnames or [])

    errors = validate_rows(rows, fields)
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)

    ready_rows = [
        row
        for row in rows
        if row.get("facility_type") == POST_OFFICE_TYPE
        and row.get("review_status") == PACKET_READY_STATUS
    ]
    states = Counter(row["state"] for row in ready_rows)
    sources = Counter(row["source"] for row in ready_rows)
    print(f"packet_ready_post_office_rows={len(ready_rows)}")
    print(f"states={dict(sorted(states.items()))}")
    print(f"sources={dict(sorted(sources.items()))}")


if __name__ == "__main__":
    main()
