# Southern California Sidecar Pass

## Reusable Output

Sidecar review tables:

- `tables/osm-food-service-california-socal-interior-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-california-socal-interior-review-2026-08-16.csv`,
- `tables/osm-dollar-store-california-socal-interior-review-2026-08-16.csv`,
- `tables/osm-hardware-california-socal-interior-review-2026-08-16.csv`,
- `tables/osm-laundromat-california-socal-interior-review-2026-08-16.csv`.

Classification:

- `tables/california-socal-interior-minimum-stack-classification-2026-08-16.csv`,
- `tables/california-socal-interior-sidecar-synthesis-2026-08-16.csv`.

## Result

The local Geofabrik sidecar extraction found:

- 2,911 food-service rows,
- 433 gas/convenience rows,
- zero dollar-store rows,
- 55 hardware rows,
- 127 laundromat rows.

The first-pass classifier produced 12 Southern California classifications:

- 12 `postal_everyday_service_minimum`,
- zero `postal_only_candidate` rows.

## Boundary

Southern California adds no depth queue and no numerator candidate. Its row can
enter the denominator as local sidecar evidence only.
