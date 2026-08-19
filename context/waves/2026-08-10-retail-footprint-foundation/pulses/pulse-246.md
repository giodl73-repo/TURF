# Pulse 246: Minimum Postal Parish Truth Dossier Synthesis

## Summary

Added a reproducible synthesis over the five completed postal-only candidate
truth dossiers, defining allowed target-box language, blocked claim language,
and the next breadth/frequency decision gate.

## Files

- `scripts/build_a1b_truth_dossier_synthesis.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/69-truth-dossier-synthesis.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-truth-dossier-synthesis-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-truth-dossier-decision-gate-2026-08-16.csv`

## Evidence

The synthesis builder reports `synthesis_rows=4`, `decision_gate_rows=3`, and
status counts of one provisional operations-gated survivor, one strict survivor
with no nearby-service observed, two strict survivors with nearby-service
constraints, and one strict survivor with a nearby trade-service constraint.

## Boundary

The pulse synthesizes completed candidate dossiers only. It does not authorize
complete service absence, catchment isolation, regional frequency, or national
frequency claims.

## Validation

```powershell
python scripts\build_a1b_truth_dossier_synthesis.py --synthesis-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-synthesis-2026-08-16.csv --decision-gate-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-decision-gate-2026-08-16.csv
python scripts\build_a1b_candidate_truth_dossiers.py --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
