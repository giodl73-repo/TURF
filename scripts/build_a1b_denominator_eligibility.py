#!/usr/bin/env python3
"""Build A.1b denominator eligibility rows and summary from review artifacts."""

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

RUN_MANIFEST_FIELDS = [
    "stratum",
    "state",
    "run_slug",
    "targets",
    "classification",
    "depth",
    "anchor",
    "semantics",
]


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def load_run_manifest(path: Path) -> list[dict[str, str]]:
    rows = read_csv(path)
    missing_fields = [field for field in RUN_MANIFEST_FIELDS if rows and field not in rows[0]]
    if missing_fields:
        raise ValueError(f"Run manifest missing fields: {', '.join(missing_fields)}")
    if not rows:
        raise ValueError("Run manifest has no rows")
    for row in rows:
        label = row.get("run_slug") or row.get("stratum") or "manifest row"
        for field in ["stratum", "state", "run_slug", "targets", "classification"]:
            if not (row.get(field) or "").strip():
                raise ValueError(f"{label}: run manifest missing {field}")
    return rows


def optional_by_target(base: Path, filename: str) -> dict[str, dict[str, str]]:
    if not filename:
        return {}
    path = base / filename
    if not path.exists():
        return {}
    return {row["target_id"]: row for row in read_csv(path)}


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def final_from_depth(local_class: str, depth: dict[str, str]) -> tuple[str, str]:
    if not depth:
        return local_class, "local_sidecar_only"

    status = depth.get("depth_review_status") or depth.get("candidate_status") or ""
    decision = depth.get("decision", "")
    if status == "postal_only_depth_candidate_survives" or (
        status.startswith("postal_only_depth_candidate_survives_with_")
        and "trade_service_gate" not in status
    ):
        return "postal_only_depth_survivor", "depth_survives"
    if status == "postal_only_depth_candidate_survives_with_trade_service_gate":
        return "postal_trade_service_gated_candidate", "depth_trade_service_gate"
    if "trade_service_not_food" in status or "postal_trade_service" in decision:
        return "postal_trade_service_minimum_candidate", "depth_trade_service_reclassification"
    if "rejected" in status and "postal_food_service" in decision:
        return "postal_food_service_minimum_candidate", "depth_food_service_reclassification"
    if "rejected" in status and "postal_everyday_service" in decision:
        return "postal_everyday_service_minimum_candidate", "depth_everyday_reclassification"
    if "postal_anchor_current_status_gated" in status:
        return "postal_anchor_current_status_gated", "depth_current_anchor_gate"
    return local_class, "depth_reviewed_no_final_override"


def denominator_status(
    *,
    settlement_size_proxy: str,
    local_class: str,
    final_class: str,
    anchor_status: str,
    semantic_status: str,
    repair_status: str,
    has_depth: bool,
) -> tuple[str, str]:
    if repair_status == "seed_state_mismatch_confirmed":
        return "excluded_seed_state_mismatch", "not_eligible_denominator_excluded"
    if settlement_size_proxy in {"", "unknown"}:
        return "excluded_unresolved_settlement_proxy", "not_eligible_denominator_excluded"
    if semantic_status == "private_shipping_semantic_gate":
        return "excluded_private_shipping_semantics", "not_eligible_denominator_excluded"
    if final_class == "postal_anchor_current_status_gated" or anchor_status in {
        "current_anchor_status_gated",
        "current_anchor_confirmed_outside_box",
        "current_anchor_contradicted",
    }:
        return "excluded_current_anchor_not_confirmed", "not_eligible_denominator_excluded"
    if final_class == "postal_only_depth_survivor":
        if anchor_status == "current_anchor_confirmed_inside_box":
            return (
                "eligible_clean_sample_denominator",
                "eligible_postal_only_candidate_numerator",
            )
        if not anchor_status:
            return "gated_current_anchor_not_reviewed", "gated_missing_current_anchor_review"
        return "excluded_current_anchor_not_confirmed", "not_eligible_anchor_not_confirmed"
    if local_class == "postal_only_candidate" and not has_depth:
        return "gated_depth_not_reviewed", "gated_missing_depth_review"
    return "eligible_clean_sample_denominator", "not_postal_only_after_sidecar_or_depth"


def build_eligibility_rows(base: Path, runs: list[dict[str, str]]) -> list[dict[str, str]]:
    repair_rows = optional_by_target(base, "addison-settlement-proxy-repair-2026-08-16.csv")
    output: list[dict[str, str]] = []
    for run in runs:
        targets = read_csv(base / run["targets"])
        classifications = optional_by_target(base, run["classification"])
        depth_rows = optional_by_target(base, run["depth"])
        anchor_rows = optional_by_target(base, run["anchor"])
        semantic_rows = optional_by_target(base, run["semantics"])

        for target in targets:
            target_id = target["target_id"]
            local_class = classifications.get(target_id, {}).get(
                "minimum_stack_class",
                "missing_classification",
            )
            depth = depth_rows.get(target_id, {})
            anchor = anchor_rows.get(target_id, {})
            semantic = semantic_rows.get(target_id, {})
            repair = repair_rows.get(target_id, {})

            final_class, final_source = final_from_depth(local_class, depth)
            anchor_status = anchor.get("anchor_review_status", "")
            if anchor_status in {
                "current_anchor_status_gated",
                "current_anchor_confirmed_outside_box",
                "current_anchor_contradicted",
            }:
                final_class = "postal_anchor_current_status_gated"
                final_source = "current_anchor_gate"
            denominator, numerator = denominator_status(
                settlement_size_proxy=target.get("settlement_size_proxy", ""),
                local_class=local_class,
                final_class=final_class,
                anchor_status=anchor_status,
                semantic_status=semantic.get("semantic_review_status", ""),
                repair_status=repair.get("repair_status", ""),
                has_depth=bool(depth),
            )
            output.append(
                {
                    "stratum": run["stratum"],
                    "state": run["state"],
                    "run_slug": run["run_slug"],
                    "target_id": target_id,
                    "primary_city": target.get("primary_city", ""),
                    "settlement_size_proxy": target.get("settlement_size_proxy", ""),
                    "seed_facility_id": target.get("seed_facility_id", ""),
                    "seed_facility_name": target.get("seed_facility_name", ""),
                    "local_minimum_stack_class": local_class,
                    "depth_review_status": depth.get("depth_review_status")
                    or depth.get("candidate_status", ""),
                    "anchor_review_status": anchor.get("anchor_review_status", ""),
                    "postal_semantics_status": semantic.get("semantic_review_status", ""),
                    "settlement_repair_status": repair.get("repair_status", ""),
                    "final_denominator_class": final_class,
                    "final_class_source": final_source,
                    "denominator_eligibility": denominator,
                    "postal_only_numerator_eligibility": numerator,
                    "claim_boundary": (
                        "Eligibility for bounded sampled denominator only; "
                        "not regional or national frequency."
                    ),
                }
            )
    return output


def build_summary_rows(
    eligibility_rows: list[dict[str, str]],
    runs: list[dict[str, str]],
) -> list[dict[str, str]]:
    scopes: list[tuple[str, list[dict[str, str]]]] = [("ALL", eligibility_rows)]
    seen_strata: set[str] = set()
    for run in runs:
        if run["stratum"] in seen_strata:
            continue
        seen_strata.add(run["stratum"])
        scopes.append(
            (
                run["stratum"],
                [row for row in eligibility_rows if row["stratum"] == run["stratum"]],
            )
        )

    rows = []
    for scope, group in scopes:
        denominator_counts = Counter(row["denominator_eligibility"] for row in group)
        numerator_counts = Counter(row["postal_only_numerator_eligibility"] for row in group)
        final_counts = Counter(
            row["final_denominator_class"]
            for row in group
            if row["denominator_eligibility"] == "eligible_clean_sample_denominator"
        )
        eligible = denominator_counts["eligible_clean_sample_denominator"]
        numerator = numerator_counts["eligible_postal_only_candidate_numerator"]
        rows.append(
            {
                "summary_scope": scope,
                "sampled_target_rows": str(len(group)),
                "eligible_clean_sample_denominator_rows": str(eligible),
                "eligible_postal_only_candidate_numerator_rows": str(numerator),
                "postal_only_candidate_share_of_eligible_denominator": (
                    f"{numerator}/{eligible}" if eligible else "0/0"
                ),
                "denominator_eligibility_counts": "; ".join(
                    f"{key}={value}" for key, value in sorted(denominator_counts.items())
                ),
                "postal_only_numerator_eligibility_counts": "; ".join(
                    f"{key}={value}" for key, value in sorted(numerator_counts.items())
                ),
                "eligible_final_class_counts": "; ".join(
                    f"{key}={value}" for key, value in sorted(final_counts.items())
                ),
                "claim_boundary": (
                    "Bounded sampled denominator after gates; not a regional or "
                    "national frequency claim."
                ),
            }
        )
    return rows


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
        help="CSV manifest describing denominator input runs",
    )
    parser.add_argument(
        "--eligibility-output",
        required=True,
        help="Row-level denominator eligibility CSV output",
    )
    parser.add_argument(
        "--summary-output",
        required=True,
        help="Recomputed denominator summary CSV output",
    )
    args = parser.parse_args()

    tables_dir = Path(args.tables_dir)
    runs = load_run_manifest(Path(args.run_manifest))
    eligibility_rows = build_eligibility_rows(tables_dir, runs)
    summary_rows = build_summary_rows(eligibility_rows, runs)

    write_csv(Path(args.eligibility_output), eligibility_rows, ELIGIBILITY_FIELDS)
    write_csv(Path(args.summary_output), summary_rows, SUMMARY_FIELDS)
    all_summary = summary_rows[0]
    print(f"manifest_rows={len(runs)}")
    print(f"eligibility_rows={len(eligibility_rows)}")
    print(
        "overall="
        f"{all_summary['eligible_postal_only_candidate_numerator_rows']}/"
        f"{all_summary['eligible_clean_sample_denominator_rows']}"
    )


if __name__ == "__main__":
    main()
