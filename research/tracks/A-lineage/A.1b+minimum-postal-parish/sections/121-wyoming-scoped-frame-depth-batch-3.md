# Wyoming Scoped Frame Depth Batch 3

## Reusable Output

Updated scoped-frame depth source review:
`tables/wyoming-scoped-frame-depth-review-open-sources-2026-08-16.csv`.

Updated scoped-frame depth decisions:
`tables/wyoming-scoped-frame-depth-review-decision-2026-08-16.csv`.

## Result

The third scoped-frame depth batch adds three fresh Wyoming depth decisions:

- Fairview,
- Grover,
- LA Barge.

After this batch, the scoped depth source artifact contains 16 rows and the
scoped decision artifact contains seven rows.

## Decisions

Fairview remains a depth survivor candidate with nearby outside-service
context. Way lists nearby Afton gas stations, including Sinclair and Maverik,
but the Census-geocoded Afton addresses fall outside the Fairview scoped
target box.

Grover remains a depth survivor candidate with nearby outside-service context.
Way lists nearby Afton gas stations, including Chevron and Maverik, but the
Census-geocoded Afton addresses fall south of the Grover scoped target box.

LA Barge is reclassified out of postal-only status. Sinclair and Truck Stops
and Services both corroborate the 292 N Alpine Dr / Dry Creek Station service
context with fuel, convenience-store, deli, fast-food, and quick-service
signals. Census address geocoding did not return a match for 292 N Alpine Dr,
so the coordinate basis is a Nominatim address geocode; that coordinate falls
inside the LA Barge scoped target box.

## Remaining Work

After the reuse batch, batch 2, and batch 3:

- 13 current-anchor-confirmed rows still need fresh scoped-frame depth review,
- 4 source-gated rows still need repair, contradiction, or explicit exclusion
  treatment before denominator or estimator use.

## Boundary

This batch does not create numerator rows, denominator rows, a scoped Wyoming
share, or any Mountain West, regional, or national frequency claim. It only
adds three scoped-frame depth decisions to the partial Wyoming full-frame
review.
