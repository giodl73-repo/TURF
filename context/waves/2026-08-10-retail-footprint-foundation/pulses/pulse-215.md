# Pulse 215: Minimum Postal Parish Rhode Island Sidecar Pass

## Summary

Ran the first Rhode Island/New England breadth sidecar pass using the local
Geofabrik OSM GeoPackage after live Overpass failed. Food service was observed
in 11 of 12 targets, and Clayville emerged as the first postal-only depth-review
candidate.

## Files

- `scripts/extract_geofabrik_civic_for_targets.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/39-rhode-island-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-rhode-island-new-england-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-gas-convenience-rhode-island-new-england-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-dollar-store-rhode-island-new-england-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-hardware-rhode-island-new-england-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-laundromat-rhode-island-new-england-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-sidecar-synthesis-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-depth-candidates-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The local Geofabrik sidecar pass found 789 food-service review rows, 93
gas/convenience rows, 23 hardware rows, and 18 laundromat rows. The 12-target
classification has 9 postal everyday-service minimums, 2 postal food-service
minimums, and 1 postal-only depth-review candidate: Clayville.

## Boundary

Clayville is a candidate, not a confirmed postal-only minimum stack. The pass
does not support Rhode Island, New England, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
