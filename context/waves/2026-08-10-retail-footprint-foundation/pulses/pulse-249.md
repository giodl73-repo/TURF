# Pulse 249: Minimum Postal Parish Mississippi Delta Seed And Targets

## Summary

Started execution of the selected next breadth wave with the Mississippi / Deep
South Delta manifest row. Downloaded and expanded the Geofabrik GeoPackage,
extracted post-office seed rows, filtered seed semantics, and produced a
deterministic 12-target public-post-office sample.

## Files

- `scripts/filter_post_office_seed_semantics.py`
- `scripts/build_post_office_sample_targets.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/72-mississippi-delta-seed-and-targets.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-post-office-seed-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-seed-semantics-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-public-post-office-seed-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-post-office-sample-targets-2026-08-16.csv`

## Evidence

The raw Mississippi seed extract produced 243 rows. The seed-semantics filter
kept 184 public postal-anchor rows and gated 59 rows. The filtered seed
validator reports `packet_ready_post_office_rows=184`, and the deterministic
target sample contains 12 rows with zero selected private-shipping or
generic-locality labels.

## Boundary

The pulse completes seed and target sampling only. Mississippi still needs
settlement join, preflight, sidecars, classification, denominator rebuild, and
candidate review before it can enter denominator evidence.

## Validation

```powershell
python scripts\validate_post_office_seed.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-public-post-office-seed-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\filter_post_office_seed_semantics.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
