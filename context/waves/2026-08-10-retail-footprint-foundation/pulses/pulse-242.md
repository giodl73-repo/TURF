# Pulse 242: Minimum Postal Parish Artesian Truth Dossier

## Summary

Added the Artesian SD truth dossier and connected its decision back into the
five-candidate dossier index.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/65-artesian-truth-dossier.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/artesian-truth-dossier-source-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/artesian-truth-dossier-decision-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-postal-only-candidate-truth-dossier-decisions-2026-08-16.csv`

## Evidence

The updated dossier index reports
`not_yet_truth_dossier_reviewed=3`,
`provisional_target_box_survivor_with_operations_gate=1`, and
`strict_target_box_survivor_with_nearby_service_constraint=1`.

Artesian remains a strict sampled target-box survivor, but Sinclair/Country
Pumper is an Artesian-addressed outside-box nearby service and must be carried
as a constraint on any narrative use.

## Boundary

The pulse reviews Artesian only. It does not change the bounded denominator,
support catchment-isolation language, or support regional, stratum, or national
frequency claims.

## Validation

```powershell
python scripts\build_a1b_candidate_truth_dossiers.py --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py
git diff --check
cargo fmt --check
cargo test --workspace
```
