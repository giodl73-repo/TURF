# Wyoming Scoped Frame Depth Batch 4

## Reusable Output

Updated scoped-frame depth source review:
`tables/wyoming-scoped-frame-depth-review-open-sources-2026-08-16.csv`.

Updated scoped-frame depth decisions:
`tables/wyoming-scoped-frame-depth-review-decision-2026-08-16.csv`.

## Result

The fourth scoped-frame depth batch adds four fresh Wyoming depth decisions:

- Hillsdale, WY 82060,
- Lance Creek,
- Manville,
- Osage.

After this batch, the scoped depth source artifact contains 22 rows and the
scoped decision artifact contains 11 rows.

## Decisions

Hillsdale remains a depth survivor candidate with nearby outside-service
context. TA Cheyenne/Burns is a real nearby fuel, food, and laundry/service
context, but Census geocoding places it outside the Hillsdale scoped target
box.

Lance Creek remains a depth survivor candidate with nearby outside-service
context. 3 Sisters in Manville is a real nearby gas, convenience, and
restaurant context, but the Manville coordinate basis is south of the Lance
Creek scoped target box.

Manville is reclassified out of postal-only status. 3 Sisters Truck Stop /
Restaurant is an active gas, convenience, deli, and restaurant source, and
Census/Nominatim coordinate bases fall inside the Manville scoped target box.

Osage remains a depth survivor candidate with nearby outside-service context.
Newcastle Sinclair and Maverik are real nearby fuel, convenience, and food
contexts, but Census-geocoded Newcastle addresses fall outside the Osage
scoped target box.

## Remaining Work

After the reuse batch and batches 2 through 4:

- 9 current-anchor-confirmed rows still need fresh scoped-frame depth review,
- 4 source-gated rows still need repair, contradiction, or explicit exclusion
  treatment before denominator or estimator use.

## Boundary

This batch does not create numerator rows, denominator rows, a scoped Wyoming
share, or any Mountain West, regional, or national frequency claim. It only
adds four scoped-frame depth decisions to the partial Wyoming full-frame
review.
