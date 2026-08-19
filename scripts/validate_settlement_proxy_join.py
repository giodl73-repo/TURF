#!/usr/bin/env python3
"""Validate settlement-size proxy join tables for post-office samples."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


BUCKETS = {
    "under_2500",
    "2500_to_9999",
    "10000_to_49999",
    "50000_plus",
    "unknown",
}

REQUIRED_FIELDS = [
    "target_id",
    "primary_city",
    "state",
    "postal_code_hint",
    "settlement_size_proxy",
    "settlement_proxy_source",
    "settlement_proxy_source_date",
    "settlement_proxy_note",
]


def normalize(value: str) -> str:
    return (value or "").strip().casefold()


def nonblank(row: dict[str, str], field: str) -> bool:
    return bool((row.get(field) or "").strip())


def duplicate_values(values: list[str]) -> list[str]:
    counts = Counter(values)
    return sorted(value for value, count in counts.items() if value and count > 1)


def validate_rows(rows: list[dict[str, str]], fields: list[str]) -> list[str]:
    errors: list[str] = []
    missing = [field for field in REQUIRED_FIELDS if field not in fields]
    if missing:
        errors.append(f"Missing required fields: {', '.join(missing)}")
        return errors

    target_ids: list[str] = []
    for index, row in enumerate(rows, start=2):
        label = row.get("target_id") or row.get("primary_city") or f"row {index}"
        bucket = row.get("settlement_size_proxy", "")
        if bucket not in BUCKETS:
            errors.append(f"{label}: invalid settlement_size_proxy {bucket!r}")
        if not nonblank(row, "target_id"):
            has_city_key = nonblank(row, "primary_city") and nonblank(row, "state")
            if not has_city_key:
                errors.append(f"{label}: needs target_id or primary_city+state")
        if nonblank(row, "target_id"):
            target_ids.append(row["target_id"].strip())
        if not nonblank(row, "settlement_proxy_source"):
            errors.append(f"{label}: missing settlement_proxy_source")
        if not nonblank(row, "settlement_proxy_source_date"):
            errors.append(f"{label}: missing settlement_proxy_source_date")

    for target_id in duplicate_values(target_ids):
        errors.append(f"Duplicate target_id: {target_id}")
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--join", required=True, help="Settlement-size proxy join CSV")
    args = parser.parse_args()

    join_path = Path(args.join)
    with join_path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        rows = list(reader)
        fields = list(reader.fieldnames or [])

    errors = validate_rows(rows, fields)
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)

    buckets = Counter(row["settlement_size_proxy"] for row in rows)
    sources = Counter(row["settlement_proxy_source"] for row in rows)
    print(f"rows={len(rows)}")
    print(f"settlement_size_proxy={dict(sorted(buckets.items()))}")
    print(f"settlement_proxy_source={dict(sorted(sources.items()))}")


if __name__ == "__main__":
    main()
