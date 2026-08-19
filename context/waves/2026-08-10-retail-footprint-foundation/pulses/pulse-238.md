# Pulse 238: Minimum Postal Parish Denominator Validator

## Summary

Added a denominator eligibility validator to check row-level labels, duplicate
targets, postal-only numerator prerequisites, exclusion gates, and summary
counts against the manifest-driven denominator output.

## Files

- `scripts/validate_a1b_denominator_eligibility.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/61-denominator-validator.md`

## Evidence

The validator reports `eligibility_rows=72`, `summary_rows=7`, and
`overall=5/61` for the current denominator output.

## Boundary

The pulse adds output-contract validation only. It does not support regional,
stratum, or national frequency claims.

## Validation

```powershell
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py
git diff --check
cargo fmt --check
cargo test --workspace
```
