# Alaska Arctic Remote Sidecar Pass

## Reusable Output

Sidecar review tables:

- `tables/osm-food-service-alaska-arctic-remote-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-alaska-arctic-remote-review-2026-08-16.csv`,
- `tables/osm-dollar-store-alaska-arctic-remote-review-2026-08-16.csv`,
- `tables/osm-hardware-alaska-arctic-remote-review-2026-08-16.csv`,
- `tables/osm-laundromat-alaska-arctic-remote-review-2026-08-16.csv`.

Classification:

- `tables/alaska-arctic-remote-minimum-stack-classification-2026-08-16.csv`,
- `tables/alaska-arctic-remote-sidecar-synthesis-2026-08-16.csv`.

## Result

The local Geofabrik sidecar extraction found:

- 124 food-service rows,
- 15 gas/convenience rows,
- zero dollar-store rows,
- seven hardware rows,
- three laundromat rows.

The first-pass classifier produced 12 Alaska classifications:

- six `postal_everyday_service_minimum`,
- two `postal_food_service_minimum`,
- four `postal_only_candidate`.

The four first-pass postal-only candidates were:

- Savoonga,
- Nikiski,
- Galena,
- Clam Gulch.

## Boundary

These four rows were sidecar candidates only. They required current-anchor
review and alternate-source depth review before any denominator or truth-dossier
use.
