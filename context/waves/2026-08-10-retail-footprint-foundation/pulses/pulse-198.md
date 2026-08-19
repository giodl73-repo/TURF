# Pulse 198: Minimum Postal Parish Two-State Synthesis

## Summary

Synthesized the Washington and Georgia A.1b pilots after Georgia food-service
resolution. Across 40 bounded target boxes, 20 have observed post-office
evidence. Among those 20 postal-observed boxes, none classify as postal-only:
five are `postal_food_service_minimum`, and fifteen are
`postal_everyday_service_minimum`.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/22-two-state-pilot-synthesis.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/two-state-minimum-postal-parish-synthesis-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Washington contributes 18 postal-observed classified targets: three
food-service minimums and 15 everyday-service minimums. Georgia contributes two
postal-observed classified targets, both food-service minimums. The combined
pilot therefore supports food-service as the current minimum confirmed sidecar,
not a post-office-only class.

## Boundary

This pulse may compare the two bounded pilots. It may not claim national
frequency, smallest postal parish, service adequacy, complete food-service
inventory, ZIP/ZCTA/CDP/county coverage, trade areas, or catchments.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
