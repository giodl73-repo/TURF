# Clayville Depth Review

## Reusable Output

Open-source evidence table:
`tables/clayville-depth-review-open-sources-2026-08-15.csv`.

Decision table:
`tables/clayville-depth-review-decision-2026-08-15.csv`.

## Question

Clayville was the only Rhode Island breadth target classified as
`postal_only_candidate` after the local Geofabrik sidecar pass. The depth review
asks whether alternate open sources immediately contradict that target-box
classification.

## Evidence

The official USPS location page is the postal-anchor source for Clayville. The
address geocodes inside the sampled Clayville target box.

The open local-business evidence found nearby services, but outside the sampled
box:

- Groundwater Cafe at 985 Chopmist Hill Rd,
- Brigido's Fresh Market at 25 Village Plaza Way,
- Scituate Hardware at 32 Danielson Pike,
- Scituate Lumber at 622 Danielson Pike.

The Census geocoder places all four outside the Clayville target box. These
sources show nearby everyday services in the broader North Scituate/Scituate
area, but they do not contradict the sampled target-box result.

The narrow OSM API map check around the Clayville post-office point returned no
everyday-service matches. The full target-box OSM API request was rejected by
API bbox limits, so it remains source-gated and is not treated as checked
absence.

## Decision

Clayville survives depth review as a `postal_only_depth_candidate`, not as a
confirmed postal-only minimum stack.

The important distinction is:

- inside the sampled post-office target box: no alternate open everyday-service
  evidence found,
- nearby outside the sampled target box: everyday services exist.

## Boundary

This review may keep Clayville as a depth candidate. It may not claim Clayville
is a confirmed postal-only minimum stack, that the broader Scituate area lacks
services, that the target box is a catchment, or that Rhode Island/New England
has a postal-only frequency.

## Next Gate

Run at least one more next-wave regional stratum before deciding whether
Clayville should become an exemplar, remain an outlier candidate, or be
discarded under a refined target-box rule.
