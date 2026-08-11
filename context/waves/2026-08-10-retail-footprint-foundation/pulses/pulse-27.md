# Pulse 27: RET Candidate Evaluation

## Goal

Compare rule-generated metro RET candidates against hand-reviewed RET examples.

## Changes

- Added `RetCandidateEvaluation`.
- Added `parse_ret_metro_candidates`.
- Added `evaluate_ret_metro_candidates`.
- Added `evaluate-ret-metro` to `turf-cli`.
- Added evaluation tests and checked-in Washington evaluation outputs.
- Added `reports/ret-metro-candidate-evaluation.md`.

## Readout

The first metro evaluation has four comparable examples and four matches:

| Category | Geography | Expected | Suggested |
|---|---|---|---|
| Home improvement | Seattle-Tacoma-Bellevue WA | `anchor_market` | `anchor_market` |
| Home improvement | Bremerton-Silverdale-Port Orchard WA | `anchor_market` | `anchor_market` |
| Auto parts | Seattle-Tacoma-Bellevue WA | `contested_service_grid` | `contested_service_grid` |
| Auto parts | Bremerton-Silverdale-Port Orchard WA | `brand_led_service_mesh` | `brand_led_service_mesh` |

## Caveat

This evaluates only metro-level examples. Place-level ferry examples are out of
scope until TURF adds a place-level RET candidate command.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- evaluate-ret-metro fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-washington-metro-candidates.csv
cargo run -p turf-cli -- evaluate-ret-metro fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-washington-metro-candidates.csv
git diff --check
```
