# Pulse 202: Minimum Postal Parish Three-State Synthesis

## Summary

Synthesized the Washington, Georgia, and Illinois A.1b pilots. Across 60
bounded target boxes, 28 have observed post-office evidence and completed
classification. Among those 28 classified postal-observed boxes, every target
has observed food-service: eight are `postal_food_service_minimum`, twenty are
`postal_everyday_service_minimum`, and zero are postal-only candidates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/26-three-state-pilot-synthesis.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/three-state-minimum-postal-parish-synthesis-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Washington contributes 18 classified postal-observed targets, Georgia
contributes two, and Illinois contributes eight. Illinois also contributes ten
post-office source gates, which preserve the distinction between unresolved
source access and checked absence.

## Boundary

This pulse may compare the three bounded pilots. It may not claim national
frequency, smallest postal parish, complete food-service inventory, ZIP/ZCTA/
CDP/county coverage, trade areas, catchments, or service adequacy.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
