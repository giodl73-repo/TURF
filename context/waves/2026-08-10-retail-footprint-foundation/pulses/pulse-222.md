# Pulse 222: Minimum Postal Parish Appalachia West Virginia Sidecar Pass

## Summary

Ran the West Virginia/Appalachia local Geofabrik sidecar pass. The result is
sparse: three of twelve targets have everyday-service signal and nine remain
postal-only candidates under the local sidecar method.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/46-appalachia-west-virginia-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-minimum-stack-classification-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-sidecar-synthesis-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-depth-candidates-2026-08-16.csv`

## Evidence

The 12-target classification has three postal everyday-service minimums and
nine postal-only candidates: Advent, Alkol, Alum Bridge, Alvy, Ameagle,
Amherstdale, Amma, Annamoriah, and Anthony.

## Boundary

The nine targets are candidates, not confirmed postal-only minimum stacks. The
pass does not support West Virginia, Appalachia, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
