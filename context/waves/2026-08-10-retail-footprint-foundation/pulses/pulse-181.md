# Pulse 181: Minimum Postal Parish Washington Pizza Retry

## Summary

Retried the source-gated Washington pizza-delivery targets one at a time. The
checked pizza-delivery subset increased from nine to 15 targets, with five
targets still source-gated after gateway or connection timeouts.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-pizza-delivery-washington-minimum-postal-parish-partial-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-pizza-delivery-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/10-washington-pizza-delivery-partial-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The consolidated partial review layer now has 114 OSM candidate rows across 15
completed target boxes. No target-brand pizza delivery/carryout rows were
packet-ready. The review results are:

- 15 checked-absent targets,
- five source-gated targets,
- 111 non-target food-service exclusions,
- three explicit out-of-state exclusions.

## Boundary

This pulse may say 15 targets are checked absent for target-brand pizza
delivery/carryout in the OSM sidecar pass. It may not treat Connell, Dayton,
Forks, Mattawa, or Mesa as absent.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
