#!/usr/bin/env python3
"""Build A.1b sidecar status and minimum-stack classification tables."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


STATUS_FIELDS = [
    "target_id",
    "primary_city",
    "facility_type",
    "sidecar_status",
    "packet_ready_rows",
    "observed_facility_names",
    "claim_boundary",
]

CLASSIFICATION_FIELDS = [
    "target_id",
    "primary_city",
    "settlement_size_proxy",
    "food_service_status",
    "gas_convenience_status",
    "dollar_store_status",
    "hardware_status",
    "laundromat_status",
    "minimum_stack_class",
    "candidate_next_action",
    "claim_boundary",
]

SYNTHESIS_FIELDS = [
    "metric",
    "value",
    "note",
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def packet_ready_by_target(sidecar_rows: list[dict[str, str]]) -> dict[str, list[dict[str, str]]]:
    grouped: dict[str, list[dict[str, str]]] = {}
    for row in sidecar_rows:
        if row.get("review_status") != "packet_ready":
            continue
        grouped.setdefault(row["target_id"], []).append(row)
    return grouped


def build_status_rows(
    targets: list[dict[str, str]],
    facility_type: str,
    sidecar_rows: list[dict[str, str]],
) -> list[dict[str, str]]:
    grouped = packet_ready_by_target(sidecar_rows)
    output = []
    for target in targets:
        rows = grouped.get(target["target_id"], [])
        names = sorted({row.get("facility_name", "") for row in rows if row.get("facility_name")})
        output.append(
            {
                "target_id": target["target_id"],
                "primary_city": target["primary_city"],
                "facility_type": facility_type,
                "sidecar_status": "observed" if rows else "checked_absent",
                "packet_ready_rows": str(len(rows)),
                "observed_facility_names": "; ".join(names),
                "claim_boundary": (
                    "Local Geofabrik sidecar status for bounded target boxes only; "
                    "not complete inventory or frequency."
                ),
            }
        )
    return output


def classify(row: dict[str, str]) -> tuple[str, str]:
    statuses = [
        row["food_service_status"],
        row["gas_convenience_status"],
        row["dollar_store_status"],
        row["hardware_status"],
        row["laundromat_status"],
    ]
    observed_count = sum(1 for status in statuses if status == "observed")
    if observed_count == 0:
        return (
            "postal_only_candidate",
            "Depth review required before any postal-only claim.",
        )
    if row["food_service_status"] == "observed" and observed_count == 1:
        return (
            "postal_food_service_minimum",
            "No postal-only claim; carry as food-service minimum.",
        )
    return (
        "postal_everyday_service_minimum",
        "No postal-only claim; local everyday-service sidecar observed.",
    )


def build_classification_rows(
    targets: list[dict[str, str]],
    statuses_by_type: dict[str, dict[str, dict[str, str]]],
) -> list[dict[str, str]]:
    output = []
    for target in targets:
        row = {
            "target_id": target["target_id"],
            "primary_city": target["primary_city"],
            "settlement_size_proxy": target.get("settlement_size_proxy", ""),
        }
        for facility_type in [
            "food_service",
            "gas_convenience",
            "dollar_store",
            "hardware",
            "laundromat",
        ]:
            row[f"{facility_type}_status"] = statuses_by_type[facility_type][
                target["target_id"]
            ]["sidecar_status"]
        minimum_class, next_action = classify(row)
        row["minimum_stack_class"] = minimum_class
        row["candidate_next_action"] = next_action
        row["claim_boundary"] = (
            "Local sidecar classification for bounded target boxes only; not "
            "regional or national frequency."
        )
        output.append(row)
    return output


def build_synthesis_rows(classification_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    class_counts = Counter(row["minimum_stack_class"] for row in classification_rows)
    candidates = [
        row["primary_city"]
        for row in classification_rows
        if row["minimum_stack_class"] == "postal_only_candidate"
    ]
    return [
        {
            "metric": "target_rows",
            "value": str(len(classification_rows)),
            "note": "Bounded target boxes classified.",
        },
        {
            "metric": "minimum_stack_class_counts",
            "value": "; ".join(f"{key}={value}" for key, value in sorted(class_counts.items())),
            "note": "Local Geofabrik sidecar classification counts.",
        },
        {
            "metric": "postal_only_depth_candidates",
            "value": "; ".join(candidates),
            "note": "Candidates require depth review before any postal-only claim.",
        },
    ]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--targets", required=True)
    parser.add_argument("--food-service", required=True)
    parser.add_argument("--gas-convenience", required=True)
    parser.add_argument("--dollar-store", required=True)
    parser.add_argument("--hardware", required=True)
    parser.add_argument("--laundromat", required=True)
    parser.add_argument("--status-output-dir", required=True)
    parser.add_argument("--status-prefix", required=True)
    parser.add_argument("--classification-output", required=True)
    parser.add_argument("--synthesis-output", required=True)
    args = parser.parse_args()

    targets = read_csv(Path(args.targets))
    sidecars = {
        "food_service": read_csv(Path(args.food_service)),
        "gas_convenience": read_csv(Path(args.gas_convenience)),
        "dollar_store": read_csv(Path(args.dollar_store)),
        "hardware": read_csv(Path(args.hardware)),
        "laundromat": read_csv(Path(args.laundromat)),
    }
    statuses_by_type: dict[str, dict[str, dict[str, str]]] = {}
    status_dir = Path(args.status_output_dir)
    for facility_type, rows in sidecars.items():
        status_rows = build_status_rows(targets, facility_type, rows)
        statuses_by_type[facility_type] = {row["target_id"]: row for row in status_rows}
        filename_type = facility_type.replace("_", "-")
        write_csv(
            status_dir / f"{args.status_prefix}-{filename_type}-status-2026-08-16.csv",
            status_rows,
            STATUS_FIELDS,
        )

    classification_rows = build_classification_rows(targets, statuses_by_type)
    synthesis_rows = build_synthesis_rows(classification_rows)
    write_csv(Path(args.classification_output), classification_rows, CLASSIFICATION_FIELDS)
    write_csv(Path(args.synthesis_output), synthesis_rows, SYNTHESIS_FIELDS)

    print(f"classification_rows={len(classification_rows)}")
    print(
        "minimum_stack_class_counts="
        + "; ".join(
            f"{key}={value}"
            for key, value in sorted(
                Counter(row["minimum_stack_class"] for row in classification_rows).items()
            )
        )
    )


if __name__ == "__main__":
    main()
