# Pulse 235: Minimum Postal Parish Denominator Repair Pass

## Summary

Resolved the immediate denominator repair queue: Clayville RI and Artesian SD
now pass current-anchor review, while Addison WV is excluded as a seed-state
mismatch rather than repaired into a settlement proxy.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/59-denominator-repair-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-current-postal-anchor-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-current-postal-anchor-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/addison-settlement-proxy-repair-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-eligibility-rows-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-recomputed-summary-2026-08-16.csv`

## Evidence

The repaired denominator has 61 eligible clean rows out of 72 sampled target
boxes. Five rows are eligible postal-only candidate numerator rows: Clayville
RI, Artesian SD, Alum Bridge WV, Carpenter WY, and Amistad NM.

## Boundary

The pulse reports a bounded gated sample repair only. It does not support
regional, stratum, or national frequency claims.

## Validation

```powershell
python scripts\validate_current_postal_anchor_review.py --review research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-current-postal-anchor-review-2026-08-16.csv
python scripts\validate_current_postal_anchor_review.py --review research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\south-dakota-current-postal-anchor-review-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
