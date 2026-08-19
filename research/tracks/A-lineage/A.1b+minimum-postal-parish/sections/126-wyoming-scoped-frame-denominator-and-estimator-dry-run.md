# Wyoming Scoped Frame Denominator And Estimator Dry Run

## Reusable Output

Denominator eligibility rows:
`tables/wyoming-scoped-frame-denominator-eligibility-rows-2026-08-16.csv`.

Exclusion ledger:
`tables/wyoming-scoped-frame-denominator-exclusion-ledger-2026-08-16.csv`.

Denominator summary:
`tables/wyoming-scoped-frame-denominator-summary-2026-08-16.csv`.

Estimator dry run:
`tables/wyoming-scoped-frame-estimator-dry-run-2026-08-16.csv`.

## Result

The scoped Wyoming frame now reconciles as:

- 84 scoped target rows,
- 80 clean denominator rows,
- 11 eligible postal-only depth-survivor numerator rows,
- 4 active current-anchor/source-gated exclusions.

The exact scoped-frame target-box dry run is `11/80`.

## Class Treatment

The denominator keeps first-pass sidecar rows and depth-reclassified rows in the
clean denominator. Only the four treated source-gated/current-anchor rows are
excluded from the clean denominator.

The numerator includes only rows with a completed depth decision of
`keep_as_depth_candidate`. It excludes rows reclassified as food-service,
everyday-service, or trade-service minimum candidates.

## Boundary

This is a scoped Wyoming target-box dry run. It is not a Mountain West regional
frequency estimate, national frequency estimate, catchment-isolation claim,
complete-service-absence claim, or service-adequacy claim.

## Next Gate

Run a method-review pass over the scoped denominator before elevating any
wording beyond internal dry-run language. The review should check duplicate
seed handling, source-gated exclusion categories, numerator class wording, and
whether `11/80` should be reported only as an exact scoped-frame target-box
count.
