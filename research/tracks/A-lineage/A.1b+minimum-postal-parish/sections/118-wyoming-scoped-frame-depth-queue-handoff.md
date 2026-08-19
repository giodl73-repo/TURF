# Wyoming Scoped Frame Depth Queue Handoff

## Reusable Output

Depth-review queue:
`tables/wyoming-scoped-frame-depth-review-queue-2026-08-16.csv`.

Source-gated anchor treatment:
`tables/wyoming-scoped-frame-source-gated-anchor-treatment-2026-08-16.csv`.

Current-anchor review input:
`tables/wyoming-scoped-frame-current-postal-anchor-review-2026-08-16.csv`.

## Handoff

The scoped-frame current-anchor gate has been split into two downstream
worklists:

- 20 current-anchor-confirmed-inside rows may advance to alternate-source
  everyday-service depth review,
- 4 source-gated rows must be repaired or explicitly excluded before any
  denominator or estimator dry run.

The 20-row depth queue includes 18 rows that need fresh scoped-frame depth
review and two rows with prior selected-wave Wyoming depth decisions available:

- Auburn,
- Carpenter WY.

Those prior decisions are not automatically promoted to scoped-frame numerator
eligibility. They need a scoped-frame boundary check before reuse.

That boundary check is now recorded for the first reuse batch in
`sections/119-wyoming-scoped-frame-depth-reuse-batch-1.md`, with scoped-frame
source and decision artifacts for Auburn and Carpenter WY.

The first fresh depth batch after reuse is recorded in
`sections/120-wyoming-scoped-frame-depth-batch-2.md`, with decisions for Fort
Bridger and Hartville.

The next fresh depth batch is recorded in
`sections/121-wyoming-scoped-frame-depth-batch-3.md`, with decisions for
Fairview, Grover, and LA Barge.

The fourth depth batch is recorded in
`sections/122-wyoming-scoped-frame-depth-batch-4.md`, with decisions for
Hillsdale, Lance Creek, Manville, and Osage.

The fifth depth batch is recorded in
`sections/123-wyoming-scoped-frame-depth-batch-5.md`, with decisions for
Pavillion, Hanna, Sinclair, and Baggs.

The sixth depth batch is recorded in
`sections/124-wyoming-scoped-frame-depth-batch-6.md`, with decisions for
Arvada, Recluse, Powder River, Smoot, and Leiter. This closes the 20-row
current-anchor-confirmed depth queue.

## Source-Gated Rows

The source-gated treatment queue contains:

- McKinley,
- Meriden seed row 1,
- Meriden seed row 2,
- one generic `United States Postal Service` row in the Kaycee CCD coordinate
  context.

These rows should not enter a clean scoped-frame denominator unless the current
anchor is resolved, contradicted, or carried as an explicit exclusion class.

## Next Gate

Resolve or exclude the four source-gated rows before denominator treatment.
The confirmed-inside alternate-source everyday-service depth queue is complete.
That source-gated treatment is now recorded in
`sections/125-wyoming-scoped-frame-source-gated-anchor-treatment.md`, and the
denominator/estimator dry run is recorded in
`sections/126-wyoming-scoped-frame-denominator-and-estimator-dry-run.md`.

## Boundary

This handoff does not create numerator rows, denominator rows, a scoped
Wyoming share, or any Mountain West, regional, or national frequency claim. It
only separates reviewed current-anchor candidates from unresolved anchor
gates.
