# Pulse 220: Minimum Postal Parish Allen Resolution And Trade-Service Gate

## Summary

Resolved the Allen geocode gate and added a narrow trade-service typology gate.
Pass Creek Market, formerly Allen Store, resolves inside the Allen target box,
so Allen is rejected as a postal-only candidate. Badger remains a distinct
trade-service case rather than food, grocery, or consumer gas/convenience
evidence.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/44-allen-resolution-and-trade-service-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/43-south-dakota-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-depth-review-decision-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/minimum-stack-typology.csv`

## Evidence

The Allen resolution uses a directory map point for Pass Creek Market at 104 E
Dance Rd and an EPA Region 8 Tribal UST workbook row for Pass Creek Market
(FKA Allen Store) at the same address with a currently-in-use diesel/gasoline
tank.

## Boundary

This pulse refines candidate status and typology only. It does not support
South Dakota, Great Plains, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
