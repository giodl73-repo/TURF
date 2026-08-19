# Pulse 182: Minimum Postal Parish Washington Pizza Final Retry

## Summary

Narrowed the OSM `pizza_delivery` query to target brand selectors and retried
the remaining source-gated Washington targets. The checked pizza-delivery subset
increased to 19 of 20 targets. Forks remains the only source-gated target after
an Overpass rate limit.

## Files

- `scripts/fetch_osm_civic.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-pizza-delivery-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/10-washington-pizza-delivery-partial-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Connell, Dayton, Mattawa, and Mesa returned completed zero-row targeted OSM
retries, so they are checked absent for the target-brand pizza sidecar in this
pass. Forks returned an Overpass rate limit and remains source-gated.

## Boundary

This pulse may say 19 targets are checked absent for target-brand pizza
delivery/carryout in the OSM sidecar pass. It may not treat Forks as absent,
and it may not infer delivery range, food access, service adequacy, or customer
behavior.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
