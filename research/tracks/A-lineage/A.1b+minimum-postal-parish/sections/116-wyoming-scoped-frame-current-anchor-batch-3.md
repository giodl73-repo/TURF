# Wyoming Scoped Frame Current-Anchor Batch 3

## Reusable Output

Updated current-anchor review table:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

## Batch Result

The third scoped-frame current-anchor batch resolved six generic seed-name
rows by combining coordinate context, current USPS locator evidence, Census
address geocoding, and target-box membership checks.

Six additional rows now have current postal anchors confirmed inside their
bounded target boxes:

- Pavillion,
- Recluse,
- Baggs,
- Arvada,
- Hanna,
- Leiter.

The Sinclair row has current USPS locator evidence, but Census address
geocoding did not resolve the USPS address in this pass. It is now
`current_anchor_status_gated` with `inside_target_box=unknown`.

Current review-table status after batch 3:

- `current_anchor_confirmed_inside_box`: 18,
- `current_anchor_status_gated`: 2,
- `source_gated`: 4.

The unresolved queue now consists of Hartville and Sinclair coordinate gates,
McKinley, two Meriden seed rows, and one remaining generic `United States
Postal Service` seed row in the Kaycee CCD coordinate context.

## Superseded Next Gate

Batch 4 is recorded in
`sections/117-wyoming-scoped-frame-current-anchor-batch-4.md`. The current
next gate is source-gated treatment for the remaining four unresolved rows and
alternate-source everyday-service depth review for the 20 confirmed-inside
rows. The remaining generic Kaycee CCD row should not be resolved to Kaycee
Post Office without a target-box match; the Kaycee USPS address geocodes
outside that generic seed's bounded target box.

## Boundary

This batch confirms current postal-anchor status only. It does not confirm
everyday-service absence, numerator eligibility, denominator eligibility, a
Wyoming scoped-frame share, or any Mountain West, regional, or national
frequency.
