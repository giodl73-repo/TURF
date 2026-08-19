# Pulse 234: Minimum Postal Parish Denominator Recomputation

## Summary

Applied the denominator gates row by row across the six completed next-wave
breadth strata, producing a clean sampled denominator and a gated postal-only
candidate numerator.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/58-denominator-recomputation.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-eligibility-rows-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-recomputed-summary-2026-08-16.csv`

## Evidence

The recomputed clean sampled denominator has 59 eligible rows out of 72 sampled
target boxes. Three rows are eligible postal-only candidate numerator rows:
Alum Bridge WV, Carpenter WY, and Amistad NM.

## Boundary

The pulse reports a bounded gated sample result only. It does not support
regional, stratum, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
