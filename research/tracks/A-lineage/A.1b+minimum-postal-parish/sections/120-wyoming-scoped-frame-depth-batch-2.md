# Wyoming Scoped Frame Depth Batch 2

## Reusable Output

Updated scoped-frame depth source review:
`tables/wyoming-scoped-frame-depth-review-open-sources-2026-08-16.csv`.

Updated scoped-frame depth decisions:
`tables/wyoming-scoped-frame-depth-review-decision-2026-08-16.csv`.

## Result

The second scoped-frame depth batch adds two fresh Wyoming depth decisions:

- Fort Bridger,
- Hartville.

After this batch, the scoped depth source artifact contains 10 rows and the
scoped decision artifact contains four rows.

## Decisions

Fort Bridger remains a depth survivor candidate with nearby outside-service
context. TravelCenters of America and Shell both corroborate the I-80 Exit 30
Bigelow Road service context with fuel, food, c-store, restaurant,
travel-store, and laundry/service signals. The TA page embedded map coordinate
`41.3144,-110.5095` is west of the Fort Bridger scoped target box, so that
service context is not an inside-box contradiction.

Hartville is reclassified out of postal-only status. Miners and Stockmen's
Steakhouse & Spirits is an active food-service source at 608 Main St,
Hartville, WY 82215. Census address geocoding did not return a match, so the
coordinate basis is the Nominatim Main Street Hartville street geocode; that
coordinate falls inside the Hartville scoped target box. Hartville is therefore
carried as a `postal_food_service_minimum_candidate`, not a numerator row.

## Remaining Work

After the reuse batch and batch 2:

- 16 current-anchor-confirmed rows still need fresh scoped-frame depth review,
- 4 source-gated rows still need repair, contradiction, or explicit exclusion
  treatment before denominator or estimator use.

## Boundary

This batch does not create numerator rows, denominator rows, a scoped Wyoming
share, or any Mountain West, regional, or national frequency claim. It only
adds two scoped-frame depth decisions to the partial Wyoming full-frame review.
