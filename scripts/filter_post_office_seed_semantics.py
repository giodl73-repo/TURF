#!/usr/bin/env python3
"""Filter reviewed post-office seed rows for public postal-anchor semantics."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path


PRIVATE_SHIPPING_TERMS = [
    "fedex",
    "the ups store",
    "ups store",
    "dhl",
]

GENERIC_LOCALITIES = {"", "unknown", "us", "usa", "united states"}

REVIEW_FIELDS = [
    "facility_id",
    "facility_name",
    "city",
    "state",
    "review_status",
    "semantic_review_status",
    "semantic_review_reason",
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


def semantic_status(row: dict[str, str]) -> tuple[str, str]:
    if row.get("review_status") != "packet_ready":
        return "seed_already_excluded", "input_review_status_not_packet_ready"

    name = row.get("facility_name", "").lower()
    city = row.get("city", "").strip().lower()
    if any(term in name for term in PRIVATE_SHIPPING_TERMS):
        return "private_shipping_semantic_gate", "private_shipping_facility_label"
    if city in GENERIC_LOCALITIES:
        return "generic_locality_semantic_gate", "generic_or_missing_locality"
    return "public_postal_anchor_label", "public_post_office_label"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seeds", required=True)
    parser.add_argument("--filtered-output", required=True)
    parser.add_argument("--review-output", required=True)
    args = parser.parse_args()

    rows, fields = read_csv(Path(args.seeds))
    filtered_rows = []
    review_rows = []
    for row in rows:
        status, reason = semantic_status(row)
        review_rows.append(
            {
                "facility_id": row.get("facility_id", ""),
                "facility_name": row.get("facility_name", ""),
                "city": row.get("city", ""),
                "state": row.get("state", ""),
                "review_status": row.get("review_status", ""),
                "semantic_review_status": status,
                "semantic_review_reason": reason,
            }
        )
        if status == "public_postal_anchor_label":
            filtered_rows.append(row)

    write_csv(Path(args.filtered_output), filtered_rows, fields)
    write_csv(Path(args.review_output), review_rows, REVIEW_FIELDS)
    print(f"input_rows={len(rows)}")
    print(f"public_postal_anchor_rows={len(filtered_rows)}")
    print(
        "semantic_gate_rows="
        f"{sum(1 for row in review_rows if row['semantic_review_status'] != 'public_postal_anchor_label')}"
    )


if __name__ == "__main__":
    main()
