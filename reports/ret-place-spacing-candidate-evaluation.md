# RET Place Spacing Candidate Evaluation

## Scope

This report evaluates place-level RET candidates generated with same-place
spacing features.

The spacing-aware command keeps the same candidate CSV shape as
`suggest-ret-place`, but fills `nearest_opposite_brand_miles` and expands the
evidence summary with median spacing and close opposite-brand pair counts.

## Command Shape

```powershell
cargo run -p turf-cli -- suggest-ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- suggest-ret-place-spacing home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-spacing-candidates.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-puget-sound-place-spacing-candidates.csv
```

Generated outputs:

```text
reports/ret-auto-parts-puget-sound-place-spacing-candidates.csv
reports/ret-home-improvement-puget-sound-place-spacing-candidates.csv
reports/ret-auto-parts-puget-sound-place-spacing-evaluation.csv
reports/ret-home-improvement-puget-sound-place-spacing-evaluation.csv
```

## Results

| Category | Comparable examples | Matches | Mismatches |
|---|---:|---:|---:|
| Home improvement | 6 | 6 | 0 |
| Auto parts | 6 | 6 | 0 |

## Interpretation

The spacing-aware rule does not change the reviewed Puget Sound place labels.
That is the right result for this fixture: the count-based rules already match
the examples, and spacing should strengthen evidence before it changes labels.

The strongest improvement is Bremerton. The spacing-aware candidate keeps
`contested_service_grid` and adds nearest opposite-brand spacing of 0.06 miles,
median nearest-opposite spacing of 0.27 miles, and four close opposite-brand
pairs under 0.5 miles.

Kingston remains `ferry_side_enclave`: it has two NAPA rows, one brand, and no
same-place opposite-brand spacing. That gives TURF a clean contrast between a
single-brand ferry-side service enclave and a true same-place contested grid.
