# Wyoming Scoped Frame Current-Anchor Batch 2

## Reusable Output

Updated current-anchor review table:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

## Batch Result

The second scoped-frame current-anchor batch reviewed additional named
first-pass postal-only candidates against current USPS locator evidence and
Census address geocoding.

Four more rows now have current postal anchors confirmed inside their bounded
target boxes:

- Manville,
- Osage,
- Powder River,
- Smoot.

Current review-table status after batch 2:

- `current_anchor_confirmed_inside_box`: 12,
- `current_anchor_status_gated`: 1,
- `source_gated`: 11.

The unresolved queue now consists of Hartville's coordinate gate, McKinley, two
Meriden seed rows, seven generic `United States Postal Service` seed rows, and
one `U.S. Post Office` seed row.

## Superseded Next Gate

Batch 3 is recorded in
`sections/116-wyoming-scoped-frame-current-anchor-batch-3.md`. The current
next gate is resolution of the remaining four source-gated rows and repair of
the Hartville and Sinclair coordinate gates. Meriden requires special caution
because simple USPS locator searches resolve to non-Wyoming Meriden offices;
those results do not support a Wyoming current-anchor confirmation.

## Boundary

This batch confirms current postal-anchor status only. It does not confirm
everyday-service absence, numerator eligibility, denominator eligibility, a
Wyoming scoped-frame share, or any Mountain West, regional, or national
frequency.
