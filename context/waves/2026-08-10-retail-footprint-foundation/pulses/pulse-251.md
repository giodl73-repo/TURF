# Pulse 251: Minimum Postal Parish Mississippi Delta Sidecar Pass

## Summary

Ran local Geofabrik sidecar extraction and classification for the 12
Mississippi / Deep South Delta target boxes.

## Files

- `scripts/build_a1b_sidecar_classification.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/74-mississippi-delta-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-minimum-stack-classification-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-sidecar-synthesis-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-depth-candidates-2026-08-16.csv`

## Evidence

The classifier reports `classification_rows=12` and
`minimum_stack_class_counts=postal_everyday_service_minimum=5;
postal_only_candidate=7`. The seven local depth candidates are Tutwiler,
Bigbee Valley, Union Church, Phillip, Crowder, Nitta Yuma, and Valley Park.

## Boundary

The pulse completes local sidecar classification only. The seven postal-only
candidates require current-anchor and alternate-source depth review before any
denominator numerator or postal-only claim.

## Validation

```powershell
python scripts\build_a1b_sidecar_classification.py --targets research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-preflight-enriched-targets-2026-08-16.csv --food-service research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-food-service-mississippi-delta-review-2026-08-16.csv --gas-convenience research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-gas-convenience-mississippi-delta-review-2026-08-16.csv --dollar-store research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-dollar-store-mississippi-delta-review-2026-08-16.csv --hardware research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-hardware-mississippi-delta-review-2026-08-16.csv --laundromat research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-laundromat-mississippi-delta-review-2026-08-16.csv --status-output-dir research\tracks\A-lineage\A.1b+minimum-postal-parish\tables --status-prefix mississippi-delta --classification-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-minimum-stack-classification-2026-08-16.csv --synthesis-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-sidecar-synthesis-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\filter_post_office_seed_semantics.py scripts\build_a1b_sidecar_classification.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
