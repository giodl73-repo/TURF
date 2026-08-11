# Pulse 31: RET Place Spacing Summary

## Goal

Aggregate same-place nearest competitor rows into place-level RET features that
can feed future candidate rules and reviews.

## Changes

- Added `RetPlaceSpacingSummary`.
- Added `summarize_ret_place_spacing`.
- Added `ret-place-spacing-summary` to `turf-cli`.
- Added a unit test for aggregate spacing features.
- Generated Puget Sound spacing summary CSVs for auto parts and home
  improvement.
- Updated the spacing readout, README, taxonomy, WAVE, and role review.

## Readout

Auto-parts spacing summary:

| Place | Stores | Brands | Nearest opposite | Median nearest opposite | Close pairs under 0.5 mi |
|---|---:|---:|---:|---:|---:|
| Bainbridge Island WA | 0 | 0 |  |  | 0 |
| Kingston WA | 2 | 1 |  |  | 0 |
| Bremerton WA | 7 | 3 | 0.06 mi | 0.27 mi | 4 |
| Poulsbo WA | 2 | 2 | 0.88 mi | 0.88 mi | 0 |
| Silverdale WA | 3 | 2 | 0.20 mi | 0.20 mi | 1 |
| Port Orchard WA | 3 | 3 | 0.15 mi | 0.15 mi | 1 |

Home-improvement spacing summary:

| Place | Stores | Brands | Nearest opposite | Median nearest opposite | Close pairs under 0.5 mi |
|---|---:|---:|---:|---:|---:|
| Bainbridge Island WA | 0 | 0 |  |  | 0 |
| Kingston WA | 0 | 0 |  |  | 0 |
| Bremerton WA | 0 | 0 |  |  | 0 |
| Poulsbo WA | 1 | 1 |  |  | 0 |
| Silverdale WA | 2 | 2 | 0.44 mi | 0.44 mi | 1 |
| Port Orchard WA | 1 | 1 |  |  | 0 |

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- ret-place-spacing-summary auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- ret-place-spacing-summary home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
git diff --check
```
