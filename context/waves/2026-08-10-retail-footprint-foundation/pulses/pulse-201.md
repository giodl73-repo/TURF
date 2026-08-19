# Pulse 201: Minimum Postal Parish Illinois Everyday-Service Gate

## Summary

Ran everyday-service sidecars for the eight post-office-observed Illinois
third-pilot targets. Food-service is observed in all eight, gas/convenience in
five, dollar store in three, and hardware and laundromat are checked absent in
all eight. The Illinois classifier has three `postal_food_service_minimum`,
five `postal_everyday_service_minimum`, and zero postal-only candidates among
the eligible targets.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/25-illinois-everyday-service-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-gas-convenience-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-dollar-store-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-hardware-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-laundromat-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-food-service-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-gas-convenience-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-dollar-store-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-hardware-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-laundromat-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Mount Carmel, Virden, and Albion classify as `postal_food_service_minimum`.
Fairbury, Greenup, Winthrop Harbor, Altamont, and Arcola classify as
`postal_everyday_service_minimum`. The remaining 12 Illinois target boxes are
not classified as postal stacks because post-office evidence is checked absent
or source-gated.

## Boundary

This pulse may classify the eight post-office-observed Illinois target boxes.
It may not claim Illinois-wide frequency, citywide service absence, complete
food-service inventory, ZIP/ZCTA/CDP/county coverage, trade areas, catchments,
or service adequacy.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
