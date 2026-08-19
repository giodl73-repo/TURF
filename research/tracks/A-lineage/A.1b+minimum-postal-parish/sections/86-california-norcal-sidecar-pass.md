# Northern California Sidecar Pass

## Reusable Output

Sidecar review tables:

- `tables/osm-food-service-california-norcal-interior-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-california-norcal-interior-review-2026-08-16.csv`,
- `tables/osm-dollar-store-california-norcal-interior-review-2026-08-16.csv`,
- `tables/osm-hardware-california-norcal-interior-review-2026-08-16.csv`,
- `tables/osm-laundromat-california-norcal-interior-review-2026-08-16.csv`.

Classification:

- `tables/california-norcal-interior-minimum-stack-classification-2026-08-16.csv`,
- `tables/california-norcal-interior-sidecar-synthesis-2026-08-16.csv`.

## Result

The local Geofabrik sidecar extraction found:

- 680 food-service rows,
- 70 gas/convenience rows,
- zero dollar-store rows,
- 14 hardware rows,
- 52 laundromat rows.

The first-pass classifier produced 12 Northern California classifications:

- seven `postal_everyday_service_minimum`,
- four `postal_food_service_minimum`,
- one `postal_only_candidate`.

The only first-pass postal-only candidate was Crescent Mills.

## Boundary

Crescent Mills required current-anchor and alternate-source depth review before
any denominator or truth-dossier use.
