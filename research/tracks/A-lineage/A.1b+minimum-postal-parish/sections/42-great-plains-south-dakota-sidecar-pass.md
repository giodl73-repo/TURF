# Great Plains South Dakota Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-south-dakota-great-plains-review-2026-08-15.csv`,
- `tables/osm-gas-convenience-south-dakota-great-plains-review-2026-08-15.csv`,
- `tables/osm-dollar-store-south-dakota-great-plains-review-2026-08-15.csv`,
- `tables/osm-hardware-south-dakota-great-plains-review-2026-08-15.csv`,
- `tables/osm-laundromat-south-dakota-great-plains-review-2026-08-15.csv`.

Classification:
`tables/south-dakota-great-plains-minimum-stack-classification-2026-08-15.csv`.

Synthesis:
`tables/south-dakota-great-plains-sidecar-synthesis-2026-08-15.csv`.

Depth candidates:
`tables/south-dakota-great-plains-depth-candidates-2026-08-15.csv`.

## Result

The South Dakota sidecar pass is much sparser than Rhode Island. Among 12
sampled target boxes:

- food service is observed in 2,
- gas/convenience is observed in 3,
- hardware is observed in 3,
- laundromat is observed in 1,
- target-name dollar-store evidence is observed in 0.

Classification:

- `postal_everyday_service_minimum`: 4,
- `postal_food_service_minimum`: 1,
- `postal_only_candidate`: 7.

The seven postal-only candidates are Alcester, Alexandria, Allen, Artesian,
Astoria, Avon, and Badger.

## Interpretation

This is the first breadth result that strongly challenges the current
food-service companion pattern. It does not confirm postal-only minimum stacks
yet, because local Geofabrik absence may reflect OSM sidecar incompleteness in
small Great Plains towns.

The correct next move is depth review of the seven candidates, not a frequency
claim.

## Boundary

This pass may classify the 12 sampled South Dakota target boxes under the local
Geofabrik sidecar method. It may not claim South Dakota frequency, Great Plains
frequency, national frequency, complete local inventory, service adequacy,
trade areas, catchments, income, spending, or customer behavior.
