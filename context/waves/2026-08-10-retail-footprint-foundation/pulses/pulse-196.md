# Pulse 196: Minimum Postal Parish Georgia Everyday-Service Gate

## Summary

Ran the Georgia everyday-service sidecars for the two post-office-observed
second-pilot targets, Ball Ground and Cohutta. Gas/convenience, dollar store,
hardware, and laundromat are checked absent inside the bounded target boxes;
food-service remains source-gated, so no Georgia postal-only candidate is
claimed.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/21-georgia-everyday-service-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-gas-convenience-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-dollar-store-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-hardware-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-laundromat-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-food-service-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-gas-convenience-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-dollar-store-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-hardware-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-laundromat-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Only Ball Ground and Cohutta were eligible because they were the Georgia
post-office-observed targets. Both classify as
`postal_signal_absent_or_source_gated`: food-service is source-gated after
main/narrow Overpass timeouts, while gas/convenience, dollar store, hardware,
and laundromat are checked absent in the bounded pass.

## Boundary

This pulse may say the Georgia second pilot has two postal-observed targets
blocked by food-service source gates. It may not claim Georgia postal-only
minimum parishes or citywide, ZIP, ZCTA, CDP, county, postal-locality,
trade-area, or catchment service absence.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
