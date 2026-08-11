# Pulse 30: RET Place Spacing Readout

## Goal

Make same-place competitor spacing executable for RET place targets so
contested service grids can be supported by proximity evidence, not just brand
counts.

## Changes

- Added `RetPlaceCompetitorSpacing`.
- Added `nearest_ret_place_competitors`.
- Added `ret-place-spacing` to `turf-cli`.
- Added a unit test for same-place packet-ready competitor spacing.
- Generated Puget Sound place-spacing CSVs for auto parts and home
  improvement.
- Added `reports/ret-place-spacing-readout.md`.

## Readout

Auto parts shows the close local service-grid pattern:

| Place | Closest opposite-brand pair | Distance |
|---|---|---:|
| Bremerton WA | NAPA / O'Reilly | 0.06 mi |
| Port Orchard WA | AutoZone / O'Reilly | 0.15 mi |
| Silverdale WA | O'Reilly / NAPA | 0.20 mi |
| Poulsbo WA | O'Reilly / NAPA | 0.88 mi |

Home improvement has only one same-place opposite-brand pair among the current
targets:

| Place | Closest opposite-brand pair | Distance |
|---|---|---:|
| Silverdale WA | Lowe's / Home Depot | 0.44 mi |

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- ret-place-spacing home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
git diff --check
```
