#!/usr/bin/env python3
"""Build A.1b denominator exclusion ledger rows and summary."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


LEDGER_FIELDS = [
    "exclusion_id",
    "stratum",
    "state",
    "run_slug",
    "target_id",
    "primary_city",
    "seed_facility_id",
    "seed_facility_name",
    "denominator_eligibility",
    "exclusion_category",
    "exclusion_status",
    "repair_or_exclusion_decision",
    "source_status",
    "evidence_summary",
    "next_action",
    "claim_boundary",
]

SUMMARY_FIELDS = [
    "exclusion_category",
    "denominator_eligibility",
    "row_count",
    "repair_or_exclusion_decision",
    "claim_boundary",
]


EXCLUSION_RULES = {
    "excluded_current_anchor_not_confirmed": {
        "category": "current_anchor_failure",
        "decision": "exclude_from_clean_denominator",
        "evidence": (
            "Current-anchor review did not confirm a current inside-box postal anchor."
        ),
        "next_action": (
            "Keep excluded unless a later current-anchor source confirms the postal "
            "anchor inside the sampled target box."
        ),
    },
    "excluded_private_shipping_semantics": {
        "category": "private_shipping_semantics",
        "decision": "exclude_from_clean_public_post_office_denominator",
        "evidence": (
            "Postal-semantics review gates private-shipping or FedEx seed labels."
        ),
        "next_action": (
            "Keep excluded from public post-office denominator unless a future seed "
            "extract separates public post offices from private shipping facilities."
        ),
    },
    "excluded_seed_state_mismatch": {
        "category": "seed_state_mismatch",
        "decision": "exclude_from_clean_state_denominator",
        "evidence": (
            "Settlement repair confirms the seed point resolves outside the stated "
            "sample state."
        ),
        "next_action": (
            "Keep excluded from this state-stratum denominator; handle only through a "
            "future corrected-state sample if needed."
        ),
    },
}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def source_status(row: dict[str, str]) -> str:
    for field in [
        "anchor_review_status",
        "postal_semantics_status",
        "settlement_repair_status",
        "depth_review_status",
    ]:
        value = row.get(field, "")
        if value:
            return value
    return row.get("final_class_source", "")


def build_ledger_rows(eligibility_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    excluded_rows = [
        row
        for row in eligibility_rows
        if row.get("denominator_eligibility") != "eligible_clean_sample_denominator"
    ]
    ledger_rows: list[dict[str, str]] = []
    for index, row in enumerate(excluded_rows, start=1):
        eligibility = row.get("denominator_eligibility", "")
        rule = EXCLUSION_RULES.get(eligibility)
        if rule is None:
            raise ValueError(f"Unsupported denominator exclusion: {eligibility}")
        ledger_rows.append(
            {
                "exclusion_id": f"a1b-exclusion-{index:03d}",
                "stratum": row.get("stratum", ""),
                "state": row.get("state", ""),
                "run_slug": row.get("run_slug", ""),
                "target_id": row.get("target_id", ""),
                "primary_city": row.get("primary_city", ""),
                "seed_facility_id": row.get("seed_facility_id", ""),
                "seed_facility_name": row.get("seed_facility_name", ""),
                "denominator_eligibility": eligibility,
                "exclusion_category": rule["category"],
                "exclusion_status": "active_exclusion",
                "repair_or_exclusion_decision": rule["decision"],
                "source_status": source_status(row),
                "evidence_summary": rule["evidence"],
                "next_action": rule["next_action"],
                "claim_boundary": (
                    "Exclusion ledger for bounded sampled denominator only; not a "
                    "regional or national frequency claim."
                ),
            }
        )
    return ledger_rows


def build_summary_rows(ledger_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    grouped = Counter(
        (
            row["exclusion_category"],
            row["denominator_eligibility"],
            row["repair_or_exclusion_decision"],
        )
        for row in ledger_rows
    )
    return [
        {
            "exclusion_category": category,
            "denominator_eligibility": eligibility,
            "row_count": str(count),
            "repair_or_exclusion_decision": decision,
            "claim_boundary": (
                "Bounded sampled denominator exclusions only; not regional or "
                "national frequency."
            ),
        }
        for (category, eligibility, decision), count in sorted(grouped.items())
    ]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--eligibility",
        default=(
            "research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/"
            "a1b-denominator-eligibility-rows-2026-08-16.csv"
        ),
        help="Row-level denominator eligibility CSV input",
    )
    parser.add_argument(
        "--ledger-output",
        required=True,
        help="Row-level denominator exclusion ledger CSV output",
    )
    parser.add_argument(
        "--summary-output",
        required=True,
        help="Denominator exclusion summary CSV output",
    )
    args = parser.parse_args()

    eligibility_rows = read_csv(Path(args.eligibility))
    ledger_rows = build_ledger_rows(eligibility_rows)
    summary_rows = build_summary_rows(ledger_rows)

    write_csv(Path(args.ledger_output), ledger_rows, LEDGER_FIELDS)
    write_csv(Path(args.summary_output), summary_rows, SUMMARY_FIELDS)

    counts = Counter(row["exclusion_category"] for row in ledger_rows)
    print(f"exclusion_rows={len(ledger_rows)}")
    for category, count in sorted(counts.items()):
        print(f"{category}={count}")


if __name__ == "__main__":
    main()
