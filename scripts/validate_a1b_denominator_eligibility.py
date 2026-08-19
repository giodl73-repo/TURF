#!/usr/bin/env python3
"""Validate A.1b denominator eligibility rows and summary consistency."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


ELIGIBILITY_FIELDS = [
    "stratum",
    "state",
    "run_slug",
    "target_id",
    "primary_city",
    "settlement_size_proxy",
    "seed_facility_id",
    "seed_facility_name",
    "local_minimum_stack_class",
    "depth_review_status",
    "anchor_review_status",
    "postal_semantics_status",
    "settlement_repair_status",
    "final_denominator_class",
    "final_class_source",
    "denominator_eligibility",
    "postal_only_numerator_eligibility",
    "claim_boundary",
]

SUMMARY_FIELDS = [
    "summary_scope",
    "sampled_target_rows",
    "eligible_clean_sample_denominator_rows",
    "eligible_postal_only_candidate_numerator_rows",
    "postal_only_candidate_share_of_eligible_denominator",
    "denominator_eligibility_counts",
    "postal_only_numerator_eligibility_counts",
    "eligible_final_class_counts",
    "claim_boundary",
]

ALLOWED_DENOMINATOR_ELIGIBILITY = {
    "eligible_clean_sample_denominator",
    "excluded_current_anchor_not_confirmed",
    "excluded_private_shipping_semantics",
    "excluded_seed_state_mismatch",
    "excluded_unresolved_settlement_proxy",
    "gated_current_anchor_not_reviewed",
    "gated_depth_not_reviewed",
}

ALLOWED_NUMERATOR_ELIGIBILITY = {
    "eligible_postal_only_candidate_numerator",
    "gated_missing_current_anchor_review",
    "gated_missing_depth_review",
    "not_eligible_anchor_not_confirmed",
    "not_eligible_denominator_excluded",
    "not_postal_only_after_sidecar_or_depth",
}

ALLOWED_FINAL_CLASSES = {
    "postal_anchor_current_status_gated",
    "postal_everyday_service_minimum",
    "postal_everyday_service_minimum_candidate",
    "postal_food_service_minimum",
    "postal_food_service_minimum_candidate",
    "postal_only_depth_survivor",
    "postal_trade_service_gated_candidate",
    "postal_trade_service_minimum_candidate",
}


def read_csv(path: Path) -> tuple[list[dict[str, str]], list[str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        return list(reader), list(reader.fieldnames or [])


def require_fields(fields: list[str], required: list[str], label: str) -> list[str]:
    missing = [field for field in required if field not in fields]
    return [f"{label}: missing fields {', '.join(missing)}"] if missing else []


def parse_counts(value: str, label: str) -> Counter[str]:
    counts: Counter[str] = Counter()
    if not value:
        return counts
    for part in value.split("; "):
        if "=" not in part:
            raise ValueError(f"{label}: invalid count token {part!r}")
        key, raw_count = part.rsplit("=", 1)
        try:
            counts[key] = int(raw_count)
        except ValueError as exc:
            raise ValueError(f"{label}: invalid count value {part!r}") from exc
    return counts


def sorted_counts(counter: Counter[str]) -> str:
    return "; ".join(f"{key}={value}" for key, value in sorted(counter.items()))


def matching_summary_group(
    eligibility_rows: list[dict[str, str]],
    scope: str,
) -> list[dict[str, str]]:
    if scope == "ALL":
        return eligibility_rows
    return [row for row in eligibility_rows if row["stratum"] == scope]


def validate_eligibility(rows: list[dict[str, str]], fields: list[str]) -> list[str]:
    errors = require_fields(fields, ELIGIBILITY_FIELDS, "eligibility")
    if errors:
        return errors
    if not rows:
        return ["eligibility: no rows found"]

    target_ids: Counter[str] = Counter()
    for index, row in enumerate(rows, start=2):
        label = row.get("target_id") or f"eligibility row {index}"
        for field in [
            "stratum",
            "state",
            "run_slug",
            "target_id",
            "primary_city",
            "final_denominator_class",
            "denominator_eligibility",
            "postal_only_numerator_eligibility",
            "claim_boundary",
        ]:
            if not (row.get(field) or "").strip():
                errors.append(f"{label}: missing {field}")

        target_ids[row.get("target_id", "").strip()] += 1

        denominator = row.get("denominator_eligibility", "")
        if denominator not in ALLOWED_DENOMINATOR_ELIGIBILITY:
            errors.append(f"{label}: invalid denominator_eligibility {denominator!r}")

        numerator = row.get("postal_only_numerator_eligibility", "")
        if numerator not in ALLOWED_NUMERATOR_ELIGIBILITY:
            errors.append(f"{label}: invalid postal_only_numerator_eligibility {numerator!r}")

        final_class = row.get("final_denominator_class", "")
        if final_class not in ALLOWED_FINAL_CLASSES:
            errors.append(f"{label}: invalid final_denominator_class {final_class!r}")

        if numerator == "eligible_postal_only_candidate_numerator":
            if denominator != "eligible_clean_sample_denominator":
                errors.append(f"{label}: postal-only numerator row must be denominator eligible")
            if final_class != "postal_only_depth_survivor":
                errors.append(f"{label}: postal-only numerator row must be depth survivor")
            if row.get("anchor_review_status") != "current_anchor_confirmed_inside_box":
                errors.append(f"{label}: postal-only numerator row needs inside-box anchor")

        if denominator == "excluded_private_shipping_semantics" and row.get(
            "postal_semantics_status"
        ) != "private_shipping_semantic_gate":
            errors.append(f"{label}: private-shipping exclusion needs semantic gate")
        if denominator == "excluded_seed_state_mismatch" and row.get(
            "settlement_repair_status"
        ) != "seed_state_mismatch_confirmed":
            errors.append(f"{label}: seed-state exclusion needs repair status")

    for target_id, count in sorted(target_ids.items()):
        if target_id and count > 1:
            errors.append(f"eligibility: duplicate target_id {target_id}")
    return errors


def validate_summary(
    eligibility_rows: list[dict[str, str]],
    summary_rows: list[dict[str, str]],
    summary_fields: list[str],
) -> list[str]:
    errors = require_fields(summary_fields, SUMMARY_FIELDS, "summary")
    if errors:
        return errors
    if not summary_rows:
        return ["summary: no rows found"]
    scopes = [row.get("summary_scope", "") for row in summary_rows]
    if scopes[0] != "ALL":
        errors.append("summary: first row must be summary_scope=ALL")
    if len(scopes) != len(set(scopes)):
        errors.append("summary: duplicate summary_scope values")

    for row in summary_rows:
        scope = row.get("summary_scope", "")
        group = matching_summary_group(eligibility_rows, scope)
        if scope != "ALL" and not group:
            errors.append(f"summary {scope}: no matching eligibility rows")
            continue

        denominator_counts = Counter(r["denominator_eligibility"] for r in group)
        numerator_counts = Counter(r["postal_only_numerator_eligibility"] for r in group)
        final_counts = Counter(
            r["final_denominator_class"]
            for r in group
            if r["denominator_eligibility"] == "eligible_clean_sample_denominator"
        )
        expected = {
            "sampled_target_rows": len(group),
            "eligible_clean_sample_denominator_rows": denominator_counts[
                "eligible_clean_sample_denominator"
            ],
            "eligible_postal_only_candidate_numerator_rows": numerator_counts[
                "eligible_postal_only_candidate_numerator"
            ],
        }
        for field, expected_value in expected.items():
            try:
                observed_value = int(row.get(field, ""))
            except ValueError:
                errors.append(f"summary {scope}: {field} is not an integer")
                continue
            if observed_value != expected_value:
                errors.append(
                    f"summary {scope}: {field} expected {expected_value}, "
                    f"observed {observed_value}"
                )

        share = row.get("postal_only_candidate_share_of_eligible_denominator", "")
        expected_share = (
            f"{expected['eligible_postal_only_candidate_numerator_rows']}/"
            f"{expected['eligible_clean_sample_denominator_rows']}"
            if expected["eligible_clean_sample_denominator_rows"]
            else "0/0"
        )
        if share != expected_share:
            errors.append(f"summary {scope}: share expected {expected_share}, observed {share}")

        for field, counter in [
            ("denominator_eligibility_counts", denominator_counts),
            ("postal_only_numerator_eligibility_counts", numerator_counts),
            ("eligible_final_class_counts", final_counts),
        ]:
            try:
                observed_counts = parse_counts(row.get(field, ""), f"summary {scope} {field}")
            except ValueError as exc:
                errors.append(str(exc))
                continue
            if observed_counts != counter:
                errors.append(
                    f"summary {scope}: {field} expected {sorted_counts(counter)}, "
                    f"observed {sorted_counts(observed_counts)}"
                )
    return errors


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--eligibility", required=True, help="Denominator eligibility rows CSV")
    parser.add_argument("--summary", required=True, help="Denominator summary CSV")
    args = parser.parse_args()

    eligibility_rows, eligibility_fields = read_csv(Path(args.eligibility))
    summary_rows, summary_fields = read_csv(Path(args.summary))
    errors = validate_eligibility(eligibility_rows, eligibility_fields)
    errors.extend(validate_summary(eligibility_rows, summary_rows, summary_fields))
    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        raise SystemExit(1)

    all_row = summary_rows[0]
    print(f"eligibility_rows={len(eligibility_rows)}")
    print(f"summary_rows={len(summary_rows)}")
    print(
        "overall="
        f"{all_row['eligible_postal_only_candidate_numerator_rows']}/"
        f"{all_row['eligible_clean_sample_denominator_rows']}"
    )


if __name__ == "__main__":
    main()
