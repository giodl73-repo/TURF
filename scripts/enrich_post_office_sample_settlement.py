#!/usr/bin/env python3
"""Enrich post-office sample targets with versioned settlement-size proxies."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path


BUCKETS = {
    "under_2500",
    "2500_to_9999",
    "10000_to_49999",
    "50000_plus",
    "unknown",
}


def normalize(value: str) -> str:
    return (value or "").strip().casefold()


def build_join_indexes(
    rows: list[dict[str, str]],
) -> tuple[
    dict[str, dict[str, str]],
    dict[tuple[str, str, str], dict[str, str]],
    dict[tuple[str, str], dict[str, str]],
]:
    by_target_id: dict[str, dict[str, str]] = {}
    by_postal_city_state: dict[tuple[str, str, str], dict[str, str]] = {}
    by_city_state: dict[tuple[str, str], dict[str, str]] = {}
    for row in rows:
        if row.get("target_id"):
            by_target_id[row["target_id"]] = row
        postal_key = (
            normalize(row.get("postal_code_hint")),
            normalize(row.get("primary_city")),
            normalize(row.get("state")),
        )
        if all(postal_key):
            by_postal_city_state.setdefault(postal_key, row)
        city_key = (normalize(row.get("primary_city")), normalize(row.get("state")))
        if all(city_key):
            by_city_state.setdefault(city_key, row)
    return by_target_id, by_postal_city_state, by_city_state


def find_join_row(
    target: dict[str, str],
    by_target_id: dict[str, dict[str, str]],
    by_postal_city_state: dict[tuple[str, str, str], dict[str, str]],
    by_city_state: dict[tuple[str, str], dict[str, str]],
) -> tuple[dict[str, str] | None, str]:
    if target.get("target_id") in by_target_id:
        return by_target_id[target["target_id"]], "target_id"
    postal_key = (
        normalize(target.get("postal_code_hint")),
        normalize(target.get("primary_city")),
        normalize(target.get("state")),
    )
    if all(postal_key) and postal_key in by_postal_city_state:
        return by_postal_city_state[postal_key], "postal_city_state"
    city_key = (normalize(target.get("primary_city")), normalize(target.get("state")))
    if all(city_key) and city_key in by_city_state:
        return by_city_state[city_key], "city_state"
    return None, "unjoined"


def validate_bucket(bucket: str, row: dict[str, str]) -> str:
    value = bucket or "unknown"
    if value not in BUCKETS:
        raise ValueError(
            f"Invalid settlement_size_proxy {value!r} for "
            f"{row.get('target_id') or row.get('primary_city') or 'join row'}"
        )
    return value


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--targets", required=True, help="Post-office sample target CSV")
    parser.add_argument("--settlement-join", required=True, help="Versioned settlement-size join CSV")
    parser.add_argument("--output", required=True, help="Enriched target CSV")
    args = parser.parse_args()

    targets_path = Path(args.targets)
    join_path = Path(args.settlement_join)
    output_path = Path(args.output)

    with targets_path.open(newline="", encoding="utf-8") as handle:
        targets = list(csv.DictReader(handle))
        target_fields = list(targets[0].keys()) if targets else []
    with join_path.open(newline="", encoding="utf-8") as handle:
        join_rows = list(csv.DictReader(handle))

    by_target_id, by_postal_city_state, by_city_state = build_join_indexes(join_rows)

    extra_fields = [
        "settlement_proxy_source",
        "settlement_proxy_source_date",
        "settlement_proxy_join_key",
        "settlement_proxy_note",
    ]
    output_fields = list(target_fields)
    for field in extra_fields:
        if field not in output_fields:
            output_fields.append(field)

    enriched = []
    for target in targets:
        row = dict(target)
        join_row, join_key = find_join_row(
            target,
            by_target_id,
            by_postal_city_state,
            by_city_state,
        )
        if join_row is None:
            row["settlement_size_proxy"] = "unknown"
            row["settlement_proxy_source"] = ""
            row["settlement_proxy_source_date"] = ""
            row["settlement_proxy_join_key"] = "unjoined"
            row["settlement_proxy_note"] = "No settlement-size join row matched this target."
        else:
            row["settlement_size_proxy"] = validate_bucket(
                join_row.get("settlement_size_proxy", "unknown"), join_row
            )
            row["settlement_proxy_source"] = join_row.get("settlement_proxy_source", "")
            row["settlement_proxy_source_date"] = join_row.get("settlement_proxy_source_date", "")
            row["settlement_proxy_join_key"] = join_key
            row["settlement_proxy_note"] = join_row.get("settlement_proxy_note", "")
        enriched.append(row)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=output_fields)
        writer.writeheader()
        writer.writerows(enriched)


if __name__ == "__main__":
    main()
