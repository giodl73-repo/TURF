# Pulse 203: Minimum Postal Parish National Sample Frame Design

## Summary

Converted the three-state A.1b synthesis into a reproducible national sampling
design. The next national method should start from open post-office points,
not sparse chain labels alone, and should use explicit fallback rules for OSM,
Overpass, API limits, contradictory zero-row results, and food-service gates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/27-national-sample-frame-design.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-frame-contract-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-api-fallback-rules-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The design responds to two pilot findings: food-service appears in every
classified postal-observed target across Washington, Georgia, and Illinois, and
Illinois showed that single-path OSM zeroes can be unreliable in dense target
boxes.

## Boundary

This pulse may define the next sampling method. It may not claim national
frequency, smallest postal parish, complete service inventory, ZIP/ZCTA/CDP/
county coverage, trade areas, catchments, service adequacy, income, spending,
or customer behavior.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
