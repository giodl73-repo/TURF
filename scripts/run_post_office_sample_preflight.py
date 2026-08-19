#!/usr/bin/env python3
"""Run the A.1b post-office sample preflight from seeds to enrichment."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path

from build_post_office_sample_targets import (
    FIELDNAMES as TARGET_FIELDNAMES,
    packet_ready_post_office,
    seeded_sample_hash,
    target_from_seed,
)
from enrich_post_office_sample_settlement import (
    build_join_indexes,
    find_join_row,
    validate_bucket,
)
from validate_post_office_seed import validate_rows as validate_seed_rows
from validate_settlement_proxy_join import validate_rows as validate_join_rows


REPORT_FIELDS = [
    "metric",
    "value",
    "note",
]


def read_csv(path: Path) -> tuple[list[dict[str, str]], list[str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        return list(reader), list(reader.fieldnames or [])


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def build_targets(
    seeds: list[dict[str, str]],
    *,
    stratum_field: str,
    sample_per_stratum: int,
    max_total: int,
    lat_delta: float,
    lon_delta: float,
    sample_seed: str,
) -> list[dict[str, str]]:
    targets = [
        target_from_seed(
            row,
            lat_delta=lat_delta,
            lon_delta=lon_delta,
            stratum_field=stratum_field,
            settlement_size_proxy="not_joined",
        )
        for row in seeds
        if packet_ready_post_office(row)
    ]
    if sample_seed:
        targets.sort(
            key=lambda row: (
                row["sample_stratum"],
                seeded_sample_hash(sample_seed, row),
                row["target_id"],
            )
        )
    else:
        targets.sort(key=lambda row: (row["sample_stratum"], row["target_id"]))

    if sample_per_stratum > 0:
        sampled: list[dict[str, str]] = []
        current_stratum = None
        current_count = 0
        for target in targets:
            if target["sample_stratum"] != current_stratum:
                current_stratum = target["sample_stratum"]
                current_count = 0
            if current_count < sample_per_stratum:
                sampled.append(target)
                current_count += 1
        targets = sampled

    if max_total > 0:
        targets = targets[:max_total]
    return targets


def enrich_targets(
    targets: list[dict[str, str]],
    join_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    by_target_id, by_postal_city_state, by_city_state = build_join_indexes(join_rows)
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
                join_row.get("settlement_size_proxy", "unknown"),
                join_row,
            )
            row["settlement_proxy_source"] = join_row.get("settlement_proxy_source", "")
            row["settlement_proxy_source_date"] = join_row.get("settlement_proxy_source_date", "")
            row["settlement_proxy_join_key"] = join_key
            row["settlement_proxy_note"] = join_row.get("settlement_proxy_note", "")
        enriched.append(row)
    return enriched


def fail(errors: list[str]) -> None:
    for error in errors:
        print(f"ERROR: {error}")
    raise SystemExit(1)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", required=True, help="Reviewed post-office seed CSV")
    parser.add_argument("--settlement-join", required=True, help="Settlement-size join CSV")
    parser.add_argument("--targets-output", required=True, help="Built target-box CSV")
    parser.add_argument("--enriched-output", required=True, help="Enriched target-box CSV")
    parser.add_argument("--report-output", required=True, help="Preflight report CSV")
    parser.add_argument("--stratum-field", default="state")
    parser.add_argument("--sample-per-stratum", type=int, default=0)
    parser.add_argument("--sample-seed", default="")
    parser.add_argument("--max-total", type=int, default=0)
    parser.add_argument("--lat-delta", type=float, default=0.035)
    parser.add_argument("--lon-delta", type=float, default=0.045)
    args = parser.parse_args()

    seeds, seed_fields = read_csv(Path(args.seeds))
    seed_errors = validate_seed_rows(seeds, seed_fields)
    if seed_errors:
        fail(seed_errors)

    join_rows, join_fields = read_csv(Path(args.settlement_join))
    join_errors = validate_join_rows(join_rows, join_fields)
    if join_errors:
        fail(join_errors)

    targets = build_targets(
        seeds,
        stratum_field=args.stratum_field,
        sample_per_stratum=args.sample_per_stratum,
        max_total=args.max_total,
        lat_delta=args.lat_delta,
        lon_delta=args.lon_delta,
        sample_seed=args.sample_seed,
    )
    enriched = enrich_targets(targets, join_rows)

    enriched_fields = list(TARGET_FIELDNAMES)
    for field in [
        "settlement_proxy_source",
        "settlement_proxy_source_date",
        "settlement_proxy_join_key",
        "settlement_proxy_note",
    ]:
        enriched_fields.append(field)

    write_csv(Path(args.targets_output), targets, list(TARGET_FIELDNAMES))
    write_csv(Path(args.enriched_output), enriched, enriched_fields)

    join_keys = Counter(row["settlement_proxy_join_key"] for row in enriched)
    buckets = Counter(row["settlement_size_proxy"] for row in enriched)
    report = [
        {
            "metric": "packet_ready_post_office_seed_rows",
            "value": str(sum(1 for row in seeds if packet_ready_post_office(row))),
            "note": "Validated seed rows available before sampling.",
        },
        {
            "metric": "target_rows",
            "value": str(len(targets)),
            "note": "Target boxes written after sampling limits.",
        },
        {
            "metric": "enriched_rows",
            "value": str(len(enriched)),
            "note": "Enriched target rows written.",
        },
        {
            "metric": "settlement_proxy_join_keys",
            "value": "; ".join(f"{key}={value}" for key, value in sorted(join_keys.items())),
            "note": "Join-key distribution in enriched output.",
        },
        {
            "metric": "settlement_size_proxy_buckets",
            "value": "; ".join(f"{key}={value}" for key, value in sorted(buckets.items())),
            "note": "Bucket distribution in enriched output.",
        },
    ]
    write_csv(Path(args.report_output), report, REPORT_FIELDS)

    print(f"targets={len(targets)}")
    print(f"enriched={len(enriched)}")
    print(f"report={args.report_output}")


if __name__ == "__main__":
    main()
