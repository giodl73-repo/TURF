# Pulse 32: RET Spacing-Aware Place Candidates

## Goal

Use place spacing features in RET place candidate generation and evaluate the
result against the reviewed Washington examples.

## Changes

- Added `suggest_ret_place_candidates_with_spacing`.
- Added `suggest-ret-place-spacing` to `turf-cli`.
- Added spacing-aware evidence summaries and nearest opposite-brand distances
  to place candidate outputs.
- Added a unit test covering Bremerton as spacing-supported
  `contested_service_grid` and Kingston as `ferry_side_enclave`.
- Generated spacing-aware Puget Sound candidate and evaluation CSVs.
- Added `reports/ret-place-spacing-candidate-evaluation.md`.

## Readout

The spacing-aware candidates match all 12 comparable place examples:

| Category | Comparable examples | Matches | Mismatches |
|---|---:|---:|---:|
| Home improvement | 6 | 6 | 0 |
| Auto parts | 6 | 6 | 0 |

The label set does not change versus the prior place classifier. The evidence
does improve: Bremerton now carries nearest opposite-brand spacing of 0.06
miles, median nearest-opposite spacing of 0.27 miles, and four close
opposite-brand pairs under 0.5 miles.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- suggest-ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- suggest-ret-place-spacing home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-spacing-candidates.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-puget-sound-place-spacing-candidates.csv
git diff --check
```
