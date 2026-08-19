# Pulse 184: Minimum Postal Parish Washington Gas Convenience Pass

## Summary

Added the Washington A.1b gas/convenience sidecar from the existing reviewed
Overture gas/convenience profile. Fifteen of 20 target boxes have observed
packet-ready gas/convenience rows and five are checked absent.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/11-washington-gas-convenience-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/overture-gas-convenience-washington-minimum-postal-parish-review-2026-07-22.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-gas-convenience-status-2026-07-22.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The target-assigned layer has 30 packet-ready Overture gas/convenience rows
across 15 Washington A.1b target boxes. Five target boxes have no packet-ready
gas/convenience rows in the reviewed layer: Cathlamet, Clallam Bay, La Conner,
Loon Lake, and Lopez Island.

## Boundary

This pulse may say that gas/convenience is observed or checked absent in the
bounded target boxes. It may not infer traffic volume, car ownership, highway
dependence, service adequacy, customer behavior, or absence of all local fuel
or convenience service.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
