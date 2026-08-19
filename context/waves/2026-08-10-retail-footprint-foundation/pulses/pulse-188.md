# Pulse 188: Minimum Postal Parish Food Service Gate Resolution

## Summary

Resolved the Clinton and Colfax broad food-service source gates with smaller
one-selector Overpass retries. Both targets returned named food-service rows,
so the food-service sidecar is now complete for the bounded Washington pass.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/13-washington-minimum-stack-classification.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/14-washington-food-service-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-washington-minimum-postal-parish-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-food-service-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The narrow retry returned seven packet-ready Clinton rows and two packet-ready
Colfax rows. The food-service status table is now 19 observed targets and one
checked-absent target. The classifier is now 15
`postal_everyday_service_minimum`, three `postal_food_service_minimum`, and two
`postal_signal_absent_or_source_gated` targets.

## Boundary

This pulse resolves a bounded OSM source gate. It may not claim complete
restaurant inventory, service adequacy, delivery range, spending, customer
behavior, or national coverage.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
