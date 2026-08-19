# Pulse 233: Minimum Postal Parish Cross-Stratum Denominator Readiness

## Summary

Aggregated the six completed next-wave breadth strata into a denominator
readiness table and wrote the gate policy needed before any sampled frequency
claim.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/57-cross-stratum-denominator-readiness.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-cross-stratum-denominator-readiness-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-gate-policy-2026-08-16.csv`

## Evidence

The summary covers 72 next-wave sampled target boxes across Rhode Island, South
Dakota, West Virginia, Wyoming, New Mexico, and Hawaii. It carries strict
postal-only survivors as candidates only and records current-anchor,
trade-service, and private-shipping semantic gates before frequency use.

## Boundary

The pulse supports denominator design only. It does not support regional,
stratum, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
