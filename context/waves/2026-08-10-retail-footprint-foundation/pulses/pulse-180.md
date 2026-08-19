# Pulse 180: Minimum Postal Parish Washington Pizza Partial Pass

## Summary

Added `pizza_delivery` support to the OSM civic fetcher and ran the first
partial Washington A.1b target-box pass. Nine targets are checked absent for
target-brand pizza delivery/carryout in this OSM pass; 11 remain source-gated
after Overpass rate limits and gateway timeouts.

## Files

- `scripts/fetch_osm_civic.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/10-washington-pizza-delivery-partial-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-pizza-delivery-washington-minimum-postal-parish-partial-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-pizza-delivery-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The completed subset covers nine target boxes and 65 OSM candidate rows. No
target-brand pizza delivery/carryout rows were packet-ready in the completed
subset. Sixty-two rows were non-target food-service rows and three rows were
outside the target state.

## Boundary

This pulse may say that nine targets are checked absent for target-brand pizza
delivery/carryout in the completed OSM pass. It may not say the full 20-target
pilot has checked pizza-delivery absence, because 11 targets remain
source-gated.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
