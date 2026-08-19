# Pulse 191: Minimum Postal Parish Washington Laundromat Sidecar

## Summary

Added an OSM laundromat sidecar for the Washington A.1b target boxes. The
completed pass returned no named `shop=laundry` rows: zero observed targets and
20 checked-absent targets.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/13-washington-minimum-stack-classification.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/16-washington-laundromat-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/minimum-stack-typology.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-laundromat-washington-minimum-postal-parish-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-laundromat-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

All 20 target-box fetches completed after endpoint retry. The reviewed
laundromat table is header-only, and the status table records 20 checked-absent
targets. The classifier now carries `laundromat_status`, but the top-level
class split remains 15 `postal_everyday_service_minimum`, three
`postal_food_service_minimum`, and two `postal_signal_absent_or_source_gated`
targets.

## Boundary

This pulse may say named OSM laundromat rows are checked absent in bounded
target boxes. It may not infer housing tenure, income, appliance ownership,
service adequacy, customer behavior, spending, or complete household-service
inventory.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
