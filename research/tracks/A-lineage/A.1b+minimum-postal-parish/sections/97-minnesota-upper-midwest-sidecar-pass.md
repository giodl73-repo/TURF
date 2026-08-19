# Minnesota Upper Midwest Sidecar Pass

## Reusable Output

Sidecar review tables:

- `tables/osm-food-service-minnesota-upper-midwest-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-minnesota-upper-midwest-review-2026-08-16.csv`,
- `tables/osm-dollar-store-minnesota-upper-midwest-review-2026-08-16.csv`,
- `tables/osm-hardware-minnesota-upper-midwest-review-2026-08-16.csv`,
- `tables/osm-laundromat-minnesota-upper-midwest-review-2026-08-16.csv`.

Classification:

- `tables/minnesota-upper-midwest-minimum-stack-classification-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-sidecar-synthesis-2026-08-16.csv`.

## Result

The local Geofabrik sidecar extraction found:

- 77 food-service rows,
- 14 gas/convenience rows,
- zero dollar-store rows,
- 10 hardware rows,
- two laundromat rows.

The first-pass classifier produced 12 Minnesota classifications:

- five `postal_everyday_service_minimum`,
- one `postal_food_service_minimum`,
- six `postal_only_candidate`.

The six first-pass postal-only candidates were:

- Iverson,
- Porter,
- Courtland,
- Magnolia,
- Wawina,
- Naytahwaush.

## Boundary

These rows were sidecar candidates only. They required current-anchor and depth
review before denominator use.
