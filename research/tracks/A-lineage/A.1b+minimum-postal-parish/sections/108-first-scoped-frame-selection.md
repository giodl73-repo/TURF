# First Scoped Frame Selection

## Reusable Output

First scoped-frame selection matrix:
`tables/a1b-first-scoped-frame-selection-2026-08-16.csv`.

Wyoming scoped-frame manifest contract:
`tables/wyoming-scoped-frame-manifest-contract-2026-08-16.csv`.

Supporting outputs:

- `sections/107-frame-scope-launch-decision.md`,
- `tables/a1b-frame-scope-launch-decision-2026-08-16.csv`,
- `tables/wyoming-mountain-west-post-office-seed-2026-08-16.csv`,
- `tables/wyoming-mountain-west-preflight-report-2026-08-16.csv`,
- `tables/wyoming-mountain-west-minimum-stack-classification-2026-08-16.csv`,
- `tables/wyoming-current-postal-anchor-review-2026-08-16.csv`,
- `tables/wyoming-depth-review-decision-2026-08-16.csv`,
- `sections/109-wyoming-scoped-frame-manifest-contract.md`.

## Decision

Select **Wyoming / Mountain West** as the first scoped full-frame
implementation.

This is not a national-frequency move. It is the first complete-frame test of
the frequency-design machinery inside one declared scope.

## Why Wyoming

Wyoming is the most tractable first scoped frame:

- 110 post-office seed rows in the current Geofabrik extraction,
- selected-wave sample had 12 enriched rows,
- selected-wave sample had zero settlement-proxy unknowns,
- selected-wave workflow already exercised sidecars, current-anchor review,
  depth review, and one constrained survivor,
- seed count is small enough to debug complete-frame denominator and estimator
  plumbing before scaling.

Alaska is also small, but remote-address geocoding and source availability make
it a better second stress test. Mississippi is useful but larger and already
showed outside-service geocode repair behavior. California, Texas, and
Minnesota are better later stress tests because their seed counts are much
larger.

## Required First-Frame Outputs

The Wyoming scoped frame needs:

- frame manifest covering all eligible Wyoming/Mountain West public-post-office
  target boxes,
- target boxes for every eligible seed row,
- settlement join,
- sidecar reviews for food service, gas/convenience, dollar store, hardware,
  and laundromat,
- current-anchor gates for first-pass postal-only candidates,
- depth review for candidate rows,
- denominator eligibility rows and exclusion ledger for the full scoped frame,
- estimator dry run that reports only scoped Wyoming/Mountain West target-box
  share if every gate passes.

Section 109 converts this decision into a manifest contract. The first
execution should use the 84 packet-ready Wyoming seed rows as the initial
eligible frame and keep the 26 unnamed/excluded Geofabrik rows in a separate
seed-exclusion ledger.

## Boundary

This selection does not create the Wyoming frame or authorize a Wyoming
frequency claim yet. It only chooses the first scoped frame to build. Any later
share may apply only to the completed Wyoming/Mountain West target-box frame,
not to the Mountain West region, the United States, ZIPs, cities, catchments,
or trade areas.
