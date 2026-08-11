# Pulse 28: RET Place Candidate Evaluation

## Goal

Add place-level RET candidate generation so ferry-side places can be scored
against hand-reviewed examples.

## Changes

- Added `RetPlaceTarget` and a validator for curated place targets.
- Added `suggest_ret_place_candidates` for packet-ready reviewed store rows by
  place target.
- Added `evaluate_ret_place_candidates` and `evaluate-ret-place`.
- Added `suggest-ret-place` and `validate-ret-place-targets` to `turf-cli`.
- Added the Puget Sound place target fixture.
- Added place candidate/evaluation outputs for home improvement and auto parts.
- Added focused unit tests for place targets, ferry-side suggestions, and
  place-level evaluation.

## Readout

All 10 comparable place examples match the hand-reviewed RET fixture:

| Category | Matches | Mismatches |
|---|---:|---:|
| Home improvement | 5 | 0 |
| Auto parts | 5 | 0 |

Key observations:

- Bainbridge Island remains `white_space` for both current categories.
- Kingston remains home-improvement `white_space` but becomes auto-parts
  `ferry_side_enclave`.
- Poulsbo, Silverdale, and Port Orchard keep normal service labels despite the
  ferry-side context because their direct row evidence is multi-brand.
- Bremerton now has an unreviewed place candidate: auto parts
  `contested_service_grid`, distinct from the larger NAPA-led Kitsap CBSA.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-ret-place-targets fixtures\geography\ret-puget-sound-place-targets.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-puget-sound-place-candidates.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-candidates.csv
git diff --check
```
