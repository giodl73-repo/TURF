#!/usr/bin/env python3
"""Validate current-postal-anchor review CSVs for A.1b sampled targets."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


REQUIRED_FIELDS = [
    "target_id",
    "primary_city",
    "seed_facility_id",
    "seed_facility_name",
    "anchor_review_status",
    "current_anchor_source_name",
    "current_anchor_source_url",
    "current_anchor_source_date",
    "observed_current_facility_name",
    "observed_current_facility_address",
    "observed_current_facility_latitude",
    "observed_current_facility_longitude",
    "inside_target_box",
    "evidence_summary",
    "claim_boundary",
    "next_action",
]

ALLOWED_STATUSES = {
    "current_anchor_confirmed_inside_box",
    "current_anchor_confirmed_outside_box",
    "current_anchor_status_gated",
    "current_anchor_contradicted",
    "source_gated",
}

ALLOWED_INSIDE_VALUES = {"yes", "no", "unknown", "not_applicable"}

STATUSES_REQUIRING_SOURCE = {
    "current_anchor_confirmed_inside_box",
    "current_anchor_confirmed_outside_box",
    "current_anchor_status_gated",
    "current_anchor_contradicted",
}

STATUSES_REQUIRING_COORDINATES = {
    "current_anchor_confirmed_inside_box",
    "current_anchor_confirmed_outside_box",
}


def nonblank(row: dict[str, str], field: str) -> bool:
    return bool((row.get(field) or "").strip())


def parse_coordinate(value: str, field: str, label: str) -> float:
    try:
        coordinate = float(value)
    except ValueError as exc:
        raise ValueError(f"{label}: invalid {field} {value!r}") from exc
    if field == "observed_current_facility_latitude" and not -90 <= coordinate <= 90:
        raise ValueError(f"{label}: latitude out of range {coordinate!r}")
    if field == "observed_current_facility_longitude" and not -180 <= coordinate <= 180:
        raise ValueError(f"{label}: longitude out of range {coordinate!r}")
    return coordinate


def validate_rows(rows: list[dict[str, str]], fields: list[str]) -> list[str]:
    errors: list[str] = []
    missing = [field for field in REQUIRED_FIELDS if field not in fields]
    if missing:
        errors.append(f"Missing required fields: {', '.join(missing)}")
        return errors

    seen_target_ids: Counter[str] = Counter()
    for index, row in enumerate(rows, start=2):
        label = row.get("target_id") or f"row {index}"
        if not nonblank(row, "target_id"):
            errors.append(f"{label}: missing target_id")
        else:
            seen_target_ids[row["target_id"].strip()] += 1

        for field in [
            "primary_city",
            "seed_facility_id",
            "seed_facility_name",
            "anchor_review_status",
            "inside_target_box",
            "evidence_summary",
            "claim_boundary",
            "next_action",
        ]:
            if not nonblank(row, field):
                errors.append(f"{label}: missing {field}")

        status = (row.get("anchor_review_status") or "").strip()
        if status and status not in ALLOWED_STATUSES:
            errors.append(
                f"{label}: anchor_review_status must be one of "
                f"{', '.join(sorted(ALLOWED_STATUSES))}"
            )

        inside = (row.get("inside_target_box") or "").strip()
        if inside and inside not in ALLOWED_INSIDE_VALUES:
            errors.append(
                f"{label}: inside_target_box must be one of "
                f"{', '.join(sorted(ALLOWED_INSIDE_VALUES))}"
            )

        if status in STATUSES_REQUIRING_SOURCE:
            for field in [
                "current_anchor_source_name",
                "current_anchor_source_url",
                "current_anchor_source_date",
            ]:
                if not nonblank(row, field):
                    errors.append(f"{label}: {status} requires {field}")

        if status in STATUSES_REQUIRING_COORDINATES:
            for field in [
                "observed_current_facility_name",
                "observed_current_facility_address",
                "observed_current_facility_latitude",
                "observed_current_facility_longitude",
            ]:
                if not nonblank(row, field):
                    errors.append(f"{label}: {status} requires {field}")
            for field in [
                "observed_current_facility_latitude",
                "observed_current_facility_longitude",
            ]:
                if nonblank(row, field):
                    try:
                        parse_coordinate(row[field], field, label)
                    except ValueError as exc:
                        errors.append(str(exc))

        if status == "current_anchor_confirmed_inside_box" and inside != "yes":
            errors.append(
                f"{label}: current_anchor_confirmed_inside_box requires "
                "inside_target_box=yes"
            )
        if status == "current_anchor_confirmed_outside_box" and inside != "no":
            errors.append(
                f"{label}: current_anchor_confirmed_outside_box requires "
                "inside_target_box=no"
            )
        if status in {"current_anchor_status_gated", "source_gated"} and inside not in {
            "unknown",
            "not_applicable",
        }:
            errors.append(
                f"{label}: {status} should use inside_target_box=unknown or "
                "not_applicable"
            )

    for target_id, count in sorted(seen_target_ids.items()):
        if target_id and count > 1:
            errors.append(f"Duplicate target_id: {target_id}")
    if not rows:
        errors.append("No current-postal-anchor review rows found")
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--review",
        required=True,
        help="Current-postal-anchor review CSV",
    )
    args = parser.parse_args()

    review_path = Path(args.review)
    with review_path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        rows = list(reader)
        fields = list(reader.fieldnames or [])

    errors = validate_rows(rows, fields)
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)

    statuses = Counter(row["anchor_review_status"] for row in rows)
    inside_values = Counter(row["inside_target_box"] for row in rows)
    print(f"review_rows={len(rows)}")
    print(f"anchor_review_statuses={dict(sorted(statuses.items()))}")
    print(f"inside_target_box={dict(sorted(inside_values.items()))}")


if __name__ == "__main__":
    main()
