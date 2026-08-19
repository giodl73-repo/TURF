#!/usr/bin/env python3
"""Build A.1b postal-only candidate truth dossier index and summary."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path


INDEX_FIELDS = [
    "dossier_id",
    "stratum",
    "state",
    "run_slug",
    "target_id",
    "primary_city",
    "settlement_size_proxy",
    "min_lat",
    "max_lat",
    "min_lon",
    "max_lon",
    "seed_facility_id",
    "seed_facility_name",
    "current_anchor_status",
    "current_anchor_source_name",
    "current_anchor_source_url",
    "current_anchor_source_date",
    "observed_current_facility_name",
    "observed_current_facility_address",
    "depth_review_status",
    "inside_box_everyday_service_status",
    "nearby_outside_box_service_status",
    "depth_decision",
    "truth_dossier_stage",
    "truth_dossier_status",
    "truth_dossier_decision",
    "claim_upgrade_status",
    "required_next_evidence",
    "claim_boundary",
]

SUMMARY_FIELDS = [
    "summary_scope",
    "candidate_rows",
    "truth_dossier_status_counts",
    "current_anchor_status_counts",
    "depth_review_status_counts",
    "claim_boundary",
]

RUN_MANIFEST_FIELDS = [
    "stratum",
    "state",
    "run_slug",
    "targets",
    "depth",
    "anchor",
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


def by_target(base: Path, filename: str) -> dict[str, dict[str, str]]:
    if not filename:
        return {}
    return {row["target_id"]: row for row in read_csv(base / filename)}


def optional_by_target(path: Path) -> dict[str, dict[str, str]]:
    if not path.exists():
        return {}
    return {row["target_id"]: row for row in read_csv(path)}


def load_run_manifest(path: Path) -> list[dict[str, str]]:
    rows = read_csv(path)
    if not rows:
        raise ValueError("Run manifest has no rows")
    missing = [field for field in RUN_MANIFEST_FIELDS if field not in rows[0]]
    if missing:
        raise ValueError(f"Run manifest missing fields: {', '.join(missing)}")
    return rows


def candidate_rows(eligibility_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    return [
        row
        for row in eligibility_rows
        if row.get("postal_only_numerator_eligibility")
        == "eligible_postal_only_candidate_numerator"
    ]


def build_index_rows(
    *,
    base: Path,
    manifest_rows: list[dict[str, str]],
    eligibility_rows: list[dict[str, str]],
    truth_decisions: dict[str, dict[str, str]],
) -> list[dict[str, str]]:
    runs = {row["run_slug"]: row for row in manifest_rows}
    output: list[dict[str, str]] = []
    for index, candidate in enumerate(candidate_rows(eligibility_rows), start=1):
        run = runs.get(candidate["run_slug"])
        if run is None:
            raise ValueError(f"Candidate missing manifest run: {candidate['run_slug']}")

        target = by_target(base, run["targets"]).get(candidate["target_id"], {})
        depth = by_target(base, run["depth"]).get(candidate["target_id"], {})
        anchor = by_target(base, run["anchor"]).get(candidate["target_id"], {})
        if not target:
            raise ValueError(f"Candidate missing target row: {candidate['target_id']}")
        if not depth:
            raise ValueError(f"Candidate missing depth row: {candidate['target_id']}")
        if not anchor:
            raise ValueError(f"Candidate missing anchor row: {candidate['target_id']}")
        truth = truth_decisions.get(candidate["target_id"], {})

        output.append(
            {
                "dossier_id": f"a1b-truth-dossier-{index:03d}",
                "stratum": candidate["stratum"],
                "state": candidate["state"],
                "run_slug": candidate["run_slug"],
                "target_id": candidate["target_id"],
                "primary_city": candidate["primary_city"],
                "settlement_size_proxy": candidate["settlement_size_proxy"],
                "min_lat": target.get("min_lat", ""),
                "max_lat": target.get("max_lat", ""),
                "min_lon": target.get("min_lon", ""),
                "max_lon": target.get("max_lon", ""),
                "seed_facility_id": candidate["seed_facility_id"],
                "seed_facility_name": candidate["seed_facility_name"],
                "current_anchor_status": anchor.get("anchor_review_status", ""),
                "current_anchor_source_name": anchor.get("current_anchor_source_name", ""),
                "current_anchor_source_url": anchor.get("current_anchor_source_url", ""),
                "current_anchor_source_date": anchor.get("current_anchor_source_date", ""),
                "observed_current_facility_name": anchor.get(
                    "observed_current_facility_name", ""
                ),
                "observed_current_facility_address": anchor.get(
                    "observed_current_facility_address", ""
                ),
                "depth_review_status": depth.get("depth_review_status", "")
                or depth.get("candidate_status", ""),
                "inside_box_everyday_service_status": depth.get(
                    "inside_box_everyday_service_status", ""
                ),
                "nearby_outside_box_service_status": depth.get(
                    "nearby_outside_box_service_status", ""
                ),
                "depth_decision": depth.get("decision", ""),
                "truth_dossier_stage": truth.get(
                    "truth_dossier_stage",
                    "candidate_truth_dossier_required",
                ),
                "truth_dossier_status": truth.get(
                    "truth_dossier_status",
                    "not_yet_truth_dossier_reviewed",
                ),
                "truth_dossier_decision": truth.get("truth_dossier_decision", ""),
                "claim_upgrade_status": truth.get("claim_upgrade_status", ""),
                "required_next_evidence": truth.get(
                    "required_next_evidence",
                    "Compile a candidate-specific dossier that rechecks current "
                    "postal anchor, inside-box everyday services, nearby services, "
                    "settlement identity, and downgrade conditions."
                ),
                "claim_boundary": (
                    "Candidate truth dossier index only; not a confirmed postal-only "
                    "exemplar, regional frequency, or national frequency claim."
                ),
            }
        )
    return output


def counts_text(counter: Counter[str]) -> str:
    return "; ".join(f"{key}={value}" for key, value in sorted(counter.items()))


def build_summary_rows(index_rows: list[dict[str, str]]) -> list[dict[str, str]]:
    scopes: list[tuple[str, list[dict[str, str]]]] = [("ALL", index_rows)]
    for stratum in sorted({row["stratum"] for row in index_rows}):
        scopes.append((stratum, [row for row in index_rows if row["stratum"] == stratum]))

    output = []
    for scope, rows in scopes:
        output.append(
            {
                "summary_scope": scope,
                "candidate_rows": str(len(rows)),
                "truth_dossier_status_counts": counts_text(
                    Counter(row["truth_dossier_status"] for row in rows)
                ),
                "current_anchor_status_counts": counts_text(
                    Counter(row["current_anchor_status"] for row in rows)
                ),
                "depth_review_status_counts": counts_text(
                    Counter(row["depth_review_status"] for row in rows)
                ),
                "claim_boundary": (
                    "Candidate truth dossier planning only; not a regional or "
                    "national frequency claim."
                ),
            }
        )
    return output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--tables-dir",
        default="research/tracks/A-lineage/A.1b+minimum-postal-parish/tables",
    )
    parser.add_argument(
        "--run-manifest",
        default=(
            "research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/"
            "a1b-denominator-run-manifest-2026-08-16.csv"
        ),
    )
    parser.add_argument(
        "--eligibility",
        default=(
            "research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/"
            "a1b-denominator-eligibility-rows-2026-08-16.csv"
        ),
    )
    parser.add_argument(
        "--truth-decisions",
        default=(
            "research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/"
            "a1b-postal-only-candidate-truth-dossier-decisions-2026-08-16.csv"
        ),
    )
    parser.add_argument("--index-output", required=True)
    parser.add_argument("--summary-output", required=True)
    args = parser.parse_args()

    base = Path(args.tables_dir)
    manifest_rows = load_run_manifest(Path(args.run_manifest))
    eligibility_rows = read_csv(Path(args.eligibility))
    truth_decisions = optional_by_target(Path(args.truth_decisions))
    index_rows = build_index_rows(
        base=base,
        manifest_rows=manifest_rows,
        eligibility_rows=eligibility_rows,
        truth_decisions=truth_decisions,
    )
    summary_rows = build_summary_rows(index_rows)

    write_csv(Path(args.index_output), index_rows, INDEX_FIELDS)
    write_csv(Path(args.summary_output), summary_rows, SUMMARY_FIELDS)

    print(f"candidate_truth_dossier_rows={len(index_rows)}")
    print(
        "truth_dossier_status_counts="
        f"{counts_text(Counter(row['truth_dossier_status'] for row in index_rows))}"
    )


if __name__ == "__main__":
    main()
