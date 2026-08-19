# Pulse 189: Minimum Postal Parish Washington Hardware Sidecar

## Summary

Added an OSM hardware sidecar for the Washington A.1b target boxes. Five
targets have observed named hardware rows and 15 are checked absent after the
Colfax narrow retry.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/13-washington-minimum-stack-classification.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/15-washington-hardware-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/minimum-stack-typology.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-hardware-washington-minimum-postal-parish-partial-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-hardware-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Observed hardware rows appear in Cathlamet, Connell, Eastsound, Forks, and
Kettle Falls. The classifier now carries `hardware_status`, but the top-level
class split remains 15
`postal_everyday_service_minimum`, three `postal_food_service_minimum`, and two
`postal_signal_absent_or_source_gated` targets.

## Boundary

This pulse may use bounded OSM `shop=hardware` rows as trade-service texture.
It may not infer construction activity, contractor demand, repair demand,
trade area, service adequacy, spending, customer behavior, or complete retail
inventory.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
