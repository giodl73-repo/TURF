# Pulse 236: Minimum Postal Parish Denominator Builder

## Summary

Added a reusable denominator eligibility builder so the repaired `5/61`
cross-stratum sample result can be regenerated from the current review
artifacts.

## Files

- `scripts/build_a1b_denominator_eligibility.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/60-denominator-builder.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-eligibility-rows-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-recomputed-summary-2026-08-16.csv`

## Evidence

The script reads the six next-wave breadth runs plus depth, current-anchor,
postal-semantics, and settlement-repair artifacts. Running it produces
`eligibility_rows=72` and `overall=5/61`.

## Boundary

The pulse adds reproducibility only. It does not support regional, stratum, or
national frequency claims.

## Validation

```powershell
python scripts\build_a1b_denominator_eligibility.py --eligibility-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py
git diff --check
cargo fmt --check
cargo test --workspace
```
