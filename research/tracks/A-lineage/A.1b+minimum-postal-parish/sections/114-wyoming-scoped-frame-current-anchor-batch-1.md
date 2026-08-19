# Wyoming Scoped Frame Current-Anchor Batch 1

## Reusable Output

Updated current-anchor review table:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

## Batch Result

The first scoped-frame current-anchor batch reviewed nine of the 24 first-pass
postal-only candidates against current USPS locator evidence and Census address
geocoding.

Eight rows now have current postal anchors confirmed inside their bounded
target boxes:

- Auburn,
- Carpenter WY,
- Fairview,
- Fort Bridger,
- Grover,
- Hillsdale WY,
- LA Barge,
- Lance Creek.

Hartville has current USPS locator evidence, but Census address geocoding did
not resolve the address in this pass. It remains
`current_anchor_status_gated` with `inside_target_box=unknown` until a
coordinate is resolved and target-box membership is tested.

Current review-table status:

- `current_anchor_confirmed_inside_box`: 8,
- `current_anchor_status_gated`: 1,
- `source_gated`: 15.

## Superseded Next Gate

Batch 2 is recorded in
`sections/115-wyoming-scoped-frame-current-anchor-batch-2.md`. The current
next gate is resolution of the remaining 11 source-gated rows and Hartville's
coordinate gate. Only rows confirmed inside the scoped target box may advance
to alternate-source everyday-service depth review.

## Boundary

This batch confirms current postal-anchor status only. It does not confirm
everyday-service absence, numerator eligibility, denominator eligibility, a
Wyoming scoped-frame share, or any Mountain West, regional, or national
frequency.
