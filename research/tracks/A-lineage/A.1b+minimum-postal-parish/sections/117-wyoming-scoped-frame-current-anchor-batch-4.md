# Wyoming Scoped Frame Current-Anchor Batch 4

## Reusable Output

Updated current-anchor review table:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

## Batch Result

The fourth scoped-frame current-anchor batch repaired the two coordinate gates
left by earlier batches:

- Hartville,
- Sinclair.

Both rows have current USPS locator evidence. Census address geocoding did not
resolve either USPS address in prior passes, so the inside-box coordinate test
uses the corresponding Geofabrik post-office seed coordinate. In both cases,
the coordinate falls inside the bounded scoped-frame target box.

Current review-table status after batch 4:

- `current_anchor_confirmed_inside_box`: 20,
- `source_gated`: 4.

The remaining source-gated rows are:

- McKinley,
- two Meriden seed rows,
- one generic `United States Postal Service` row in the Kaycee CCD coordinate
  context.

## Superseded Next Gate

The depth/source-gated handoff is recorded in
`sections/118-wyoming-scoped-frame-depth-queue-handoff.md`. Do not force the
remaining four rows into the denominator. They need either a strong current-
source match, an explicit current-anchor contradiction, or a source-gated
exclusion treatment before any scoped-frame denominator or estimator dry run.

The 20 confirmed-inside rows may advance to alternate-source everyday-service
depth review, but they are not numerator rows until that depth review is
complete.

## Boundary

This batch confirms current postal-anchor status for Hartville and Sinclair
only. It does not confirm everyday-service absence, numerator eligibility,
denominator eligibility, a Wyoming scoped-frame share, or any Mountain West,
regional, or national frequency.
