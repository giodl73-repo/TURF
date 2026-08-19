# Wyoming Scoped Frame Method Review

## Reusable Output

Method-review checks:
`tables/wyoming-scoped-frame-method-review-2026-08-16.csv`.

Reporting-safe numerator roster:
`tables/wyoming-scoped-frame-numerator-roster-2026-08-16.csv`.

## Result

The scoped Wyoming dry run passes method review for internal scoped target-box
wording, with boundary constraints.

The reviewed count remains:

- 84 scoped target rows,
- 80 clean denominator rows,
- 11 eligible postal-only depth-survivor numerator rows,
- 4 active exclusions,
- exact scoped target-box dry run `11/80`.

## Review Checks

Row reconciliation passes: denominator eligibility rows reconcile to 80 clean
denominator rows plus four active exclusions.

Source-gate exclusion policy passes: McKinley, two Meriden rows, and the
generic Kaycee CCD context row have explicit exclusion treatment.

Numerator definition passes: only completed depth decisions with
`keep_as_depth_candidate` enter the numerator.

Duplicate-seed handling passes with a boundary. There are no duplicate
`target_id` or `seed_facility_id` values in the denominator rows, and both
semantically duplicate Meriden rows are excluded. If a later frame deduplicates
by place/facility semantics, rerun the denominator under that policy and treat
the difference as a sensitivity case.

Generic-label reporting passes with a boundary. Raw OSM labels such as
`Postal Service` remain in the denominator rows for provenance, but prose and
tables should use the numerator roster labels. The roster resolves Pavillion
and Recluse from current-anchor review instead of exposing them as generic
postal-service names.

Claim scope passes with a boundary. `11/80` may be used only as an internal
exact count over the scoped Wyoming target-box frame after exclusions.

## Boundary

Do not promote this result to Mountain West regional frequency, national
frequency, catchment isolation, complete service absence, or service adequacy.
Any share must keep the four exclusions and scoped target-box frame definition
adjacent to the number.
