# Wyoming Scoped Frame Current-Anchor Queue

## Reusable Output

Current-anchor review queue:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

## Queue Initialization

The scoped-frame sidecar pass produced 24 first-pass `postal_only_candidate`
rows. Those rows are now materialized in a validator-compatible current-anchor
review table, joined back to the repaired enriched target rows so each row
retains:

- `target_id`,
- `primary_city`,
- `seed_facility_id`,
- `seed_facility_name`.

The queue was initialized with all 24 rows marked `source_gated` and
`inside_target_box=unknown`. Batch 1 is recorded in
`sections/114-wyoming-scoped-frame-current-anchor-batch-1.md`, batch 2 is
recorded in `sections/115-wyoming-scoped-frame-current-anchor-batch-2.md`,
and batch 3 is recorded in
`sections/116-wyoming-scoped-frame-current-anchor-batch-3.md`. Batch 4 is
recorded in `sections/117-wyoming-scoped-frame-current-anchor-batch-4.md`.
The current review status is 20 confirmed inside-box current anchors and four
source-gated rows.

## Candidate Queue

The queue includes Auburn, Carpenter WY, Fairview, Fort Bridger, Grover,
Hartville, Hillsdale WY, LA Barge, Lance Creek, Manville, McKinley, two
Meriden seed rows, Osage, seven generic `United States Postal Service` seed
rows, Powder River, Smoot, and one `U.S. Post Office` seed row.

The generic seed-name rows are not errors in this queue; they are exactly the
kind of source-gated rows that need current postal-anchor resolution before
they can remain in, or be excluded from, downstream denominator treatment.

## Next Gate

Resolve each remaining source-gated row against USPS or equivalent current
postal-anchor evidence, record the current facility name and address, geocode
the observed address, and test whether the geocode falls inside the bounded
scoped-frame target box. If no strong current-source match is found, carry the
row as a source-gated exclusion candidate before denominator treatment.

Rows may advance only as:

- `current_anchor_confirmed_inside_box`,
- `current_anchor_confirmed_outside_box`,
- `current_anchor_status_gated`,
- `current_anchor_contradicted`,
- `source_gated`.

## Boundary

This queue does not confirm any current postal anchor, everyday-service
absence, numerator eligibility, denominator eligibility, or Wyoming/Mountain
West frequency. It only fixes the worklist and schema for the current-anchor
gate.
