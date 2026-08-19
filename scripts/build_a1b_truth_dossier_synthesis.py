#!/usr/bin/env python3
"""Build A.1b truth-dossier synthesis tables from the dossier index."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


SYNTHESIS_FIELDS = [
    "candidate_class",
    "candidate_count",
    "candidate_names",
    "allowed_language",
    "blocked_language",
    "next_gate",
    "claim_boundary",
]

DECISION_GATE_FIELDS = [
    "decision_area",
    "status",
    "evidence_basis",
    "next_action",
    "claim_boundary",
]


CLASS_RULES = {
    "provisional_target_box_survivor_with_operations_gate": {
        "candidate_class": "provisional_target_box_survivor_with_operations_gate",
        "allowed_language": (
            "May be described as a bounded target-box candidate only."
        ),
        "blocked_language": (
            "Blocked from confirmed-exemplar, catchment-isolation, complete-service-"
            "absence, regional-frequency, and national-frequency language."
        ),
        "next_gate": "Resolve current postal operations status before exemplar use.",
    },
    "strict_target_box_survivor_no_nearby_service_observed": {
        "candidate_class": "strict_target_box_survivor_no_nearby_service_observed",
        "allowed_language": (
            "May be described as a strict sampled target-box survivor."
        ),
        "blocked_language": (
            "Blocked from complete-service-absence, catchment-isolation, regional-"
            "frequency, and national-frequency language."
        ),
        "next_gate": (
            "Use as the cleanest exemplar candidate, but keep sampled-box boundary "
            "attached."
        ),
    },
    "strict_target_box_survivor_with_nearby_service_constraint": {
        "candidate_class": "strict_target_box_survivor_with_nearby_service_constraint",
        "allowed_language": (
            "May be described as strict sampled target-box survivors with outside-box "
            "nearby consumer-service context."
        ),
        "blocked_language": (
            "Blocked from catchment-isolation, complete-service-absence, regional-"
            "frequency, and national-frequency language."
        ),
        "next_gate": "Carry nearby-service context in every narrative use.",
    },
    "strict_target_box_survivor_with_nearby_trade_service_constraint": {
        "candidate_class": (
            "strict_target_box_survivor_with_nearby_trade_service_constraint"
        ),
        "allowed_language": (
            "May be described as a strict sampled target-box survivor with outside-"
            "box trade-service context."
        ),
        "blocked_language": (
            "Blocked from catchment-isolation, complete-service-absence, regional-"
            "frequency, and national-frequency language."
        ),
        "next_gate": "Carry nearby trade-service context in every narrative use.",
    },
    "strict_target_box_survivor_with_outside_service_constraint": {
        "candidate_class": "strict_target_box_survivor_with_outside_service_constraint",
        "allowed_language": (
            "May be described as a strict sampled target-box survivor with outside-"
            "box consumer-service context."
        ),
        "blocked_language": (
            "Blocked from catchment-isolation, complete-service-absence, regional-"
            "frequency, and national-frequency language."
        ),
        "next_gate": "Carry outside-box service context in every narrative use.",
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


def build_synthesis_rows(index_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    grouped: dict[str, list[dict[str, str]]] = {}
    for row in index_rows:
        grouped.setdefault(row["truth_dossier_status"], []).append(row)

    output = []
    for status, rows in sorted(grouped.items()):
        rule = CLASS_RULES.get(status)
        if rule is None:
            raise ValueError(f"Unsupported truth dossier status: {status}")
        output.append(
            {
                "candidate_class": rule["candidate_class"],
                "candidate_count": str(len(rows)),
                "candidate_names": "; ".join(candidate_name(row) for row in rows),
                "allowed_language": rule["allowed_language"],
                "blocked_language": rule["blocked_language"],
                "next_gate": rule["next_gate"],
                "claim_boundary": (
                    "Truth-dossier synthesis for bounded sampled target boxes only; "
                    "not regional or national frequency."
                ),
            }
        )
    return output


def candidate_name(row: dict[str, str]) -> str:
    city = row["primary_city"]
    state = row["state"]
    if city.endswith(f" {state}"):
        return city
    return f"{city} {state}"


def build_decision_gate_rows(index_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    status_counts = Counter(row["truth_dossier_status"] for row in index_rows)
    unreviewed = status_counts.get("not_yet_truth_dossier_reviewed", 0)
    strict_count = sum(
        count for status, count in status_counts.items() if status.startswith("strict_")
    )
    provisional = status_counts.get(
        "provisional_target_box_survivor_with_operations_gate", 0
    )
    return [
        {
            "decision_area": "truth_dossier_queue",
            "status": "complete" if unreviewed == 0 else "incomplete",
            "evidence_basis": (
                f"{len(index_rows)} candidate rows; {unreviewed} unreviewed rows."
            ),
            "next_action": "Synthesize classes before adding breadth.",
            "claim_boundary": "Queue completeness only; not a frequency claim.",
        },
        {
            "decision_area": "target_box_exemplar_language",
            "status": "allowed_with_boundary",
            "evidence_basis": (
                f"{strict_count} strict target-box survivors and {provisional} "
                "provisional survivor."
            ),
            "next_action": (
                "Use only target-box language and attach operations, nearby-service, "
                "or trade-service constraints as applicable."
            ),
            "claim_boundary": (
                "Does not authorize complete service absence or catchment isolation."
            ),
        },
        {
            "decision_area": "frequency_language",
            "status": "blocked",
            "evidence_basis": (
                "Bounded sample remains descriptive after denominator gates and "
                "dossiers."
            ),
            "next_action": (
                "Add another breadth wave or a formal sampled-frequency design before "
                "regional or national claims."
            ),
            "claim_boundary": "No regional, stratum, or national frequency claim.",
        },
    ]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--index",
        default=(
            "research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/"
            "a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv"
        ),
    )
    parser.add_argument("--synthesis-output", required=True)
    parser.add_argument("--decision-gate-output", required=True)
    args = parser.parse_args()

    index_rows = read_csv(Path(args.index))
    synthesis_rows = build_synthesis_rows(index_rows)
    decision_gate_rows = build_decision_gate_rows(index_rows)

    write_csv(Path(args.synthesis_output), synthesis_rows, SYNTHESIS_FIELDS)
    write_csv(Path(args.decision_gate_output), decision_gate_rows, DECISION_GATE_FIELDS)

    counts = Counter(row["truth_dossier_status"] for row in index_rows)
    print(f"synthesis_rows={len(synthesis_rows)}")
    print(f"decision_gate_rows={len(decision_gate_rows)}")
    print(
        "truth_dossier_status_counts="
        + "; ".join(f"{key}={value}" for key, value in sorted(counts.items()))
    )


if __name__ == "__main__":
    main()
