# Pulse 218: Minimum Postal Parish Great Plains South Dakota Sidecar Pass

## Summary

Ran the South Dakota/Great Plains local Geofabrik sidecar pass. The result is
much sparser than Rhode Island: seven of twelve targets are postal-only
candidates under the local sidecar method and now require depth review.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/42-great-plains-south-dakota-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-great-plains-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-great-plains-sidecar-synthesis-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-great-plains-depth-candidates-2026-08-15.csv`

## Evidence

The 12-target classification has 4 postal everyday-service minimums, 1 postal
food-service minimum, and 7 postal-only candidates: Alcester, Alexandria, Allen,
Artesian, Astoria, Avon, and Badger.

## Boundary

The seven targets are candidates, not confirmed postal-only minimum stacks. The
pass does not support South Dakota, Great Plains, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
