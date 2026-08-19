# Pulse 237: Minimum Postal Parish Denominator Manifest

## Summary

Moved the denominator builder run list from Python constants into a versioned
CSV manifest and updated the builder to read that manifest by default.

## Files

- `scripts/build_a1b_denominator_eligibility.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/60-denominator-builder.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-run-manifest-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-eligibility-rows-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-recomputed-summary-2026-08-16.csv`

## Evidence

The manifest-driven builder reports `manifest_rows=6`,
`eligibility_rows=72`, and `overall=5/61`, matching the repaired denominator
result.

## Boundary

The pulse improves reproducibility and future extension only. It does not
support regional, stratum, or national frequency claims.

## Validation

```powershell
python scripts\build_a1b_denominator_eligibility.py --eligibility-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py
git diff --check
cargo fmt --check
cargo test --workspace
```
