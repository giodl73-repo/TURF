# Pulse 245: Minimum Postal Parish Amistad Truth Dossier

## Summary

Added the Amistad NM truth dossier and connected its decision back into the
five-candidate dossier index, completing the first truth-dossier queue.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/68-amistad-truth-dossier.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/amistad-truth-dossier-source-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/amistad-truth-dossier-decision-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-postal-only-candidate-truth-dossier-decisions-2026-08-16.csv`

## Evidence

The updated dossier index reports no `not_yet_truth_dossier_reviewed` rows:
`provisional_target_box_survivor_with_operations_gate=1`,
`strict_target_box_survivor_no_nearby_service_observed=1`,
`strict_target_box_survivor_with_nearby_service_constraint=2`, and
`strict_target_box_survivor_with_nearby_trade_service_constraint=1`.

Amistad remains a strict sampled target-box survivor, but nearby water and
ag/trade services must be carried as context on any narrative use.

## Boundary

The pulse reviews Amistad only and completes the five-row dossier queue. It
does not prove complete service absence, catchment isolation, or regional,
stratum, or national frequency.

## Validation

```powershell
python scripts\build_a1b_candidate_truth_dossiers.py --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py
git diff --check
cargo fmt --check
cargo test --workspace
```
