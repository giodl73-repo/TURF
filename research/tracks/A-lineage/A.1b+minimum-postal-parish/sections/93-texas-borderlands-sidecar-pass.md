# Texas Borderlands Sidecar Pass

## Reusable Output

Sidecar review tables:

- `tables/osm-food-service-texas-borderlands-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-texas-borderlands-review-2026-08-16.csv`,
- `tables/osm-dollar-store-texas-borderlands-review-2026-08-16.csv`,
- `tables/osm-hardware-texas-borderlands-review-2026-08-16.csv`,
- `tables/osm-laundromat-texas-borderlands-review-2026-08-16.csv`.

Classification:

- `tables/texas-borderlands-minimum-stack-classification-2026-08-16.csv`,
- `tables/texas-borderlands-sidecar-synthesis-2026-08-16.csv`.

## Result

The local Geofabrik sidecar extraction found:

- 1,037 food-service rows,
- 196 gas/convenience rows,
- zero dollar-store rows,
- 15 hardware rows,
- 33 laundromat rows.

The first-pass classifier produced 12 Texas classifications:

- nine `postal_everyday_service_minimum`,
- three `postal_only_candidate`.

The three first-pass postal-only candidates were:

- Aquilla,
- Tennessee Colony,
- Mountain Home.

## Boundary

These rows were sidecar candidates only. They required current-anchor and depth
review before denominator or truth-dossier use.
