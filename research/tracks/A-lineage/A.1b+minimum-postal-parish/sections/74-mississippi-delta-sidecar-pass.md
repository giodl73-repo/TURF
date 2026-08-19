# Mississippi Delta Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-mississippi-delta-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-mississippi-delta-review-2026-08-16.csv`,
- `tables/osm-dollar-store-mississippi-delta-review-2026-08-16.csv`,
- `tables/osm-hardware-mississippi-delta-review-2026-08-16.csv`,
- `tables/osm-laundromat-mississippi-delta-review-2026-08-16.csv`.

Status tables:

- `tables/mississippi-delta-food-service-status-2026-08-16.csv`,
- `tables/mississippi-delta-gas-convenience-status-2026-08-16.csv`,
- `tables/mississippi-delta-dollar-store-status-2026-08-16.csv`,
- `tables/mississippi-delta-hardware-status-2026-08-16.csv`,
- `tables/mississippi-delta-laundromat-status-2026-08-16.csv`.

Classification:
`tables/mississippi-delta-minimum-stack-classification-2026-08-16.csv`.

Synthesis:
`tables/mississippi-delta-sidecar-synthesis-2026-08-16.csv`.

Depth candidates:
`tables/mississippi-delta-depth-candidates-2026-08-16.csv`.

Supporting classifier:
`scripts/build_a1b_sidecar_classification.py`.

## Result

The Mississippi / Deep South Delta local sidecar pass classifies 12 bounded
target boxes:

- `postal_everyday_service_minimum`: 5,
- `postal_only_candidate`: 7.

Sidecar status counts:

- food service: 5 observed, 7 checked absent,
- gas/convenience: 5 observed, 7 checked absent,
- dollar store: 0 observed, 12 checked absent,
- hardware: 3 observed, 9 checked absent,
- laundromat: 2 observed, 10 checked absent.

The seven local postal-only candidates are:

- Tutwiler,
- Bigbee Valley,
- Union Church,
- Phillip,
- Crowder,
- Nitta Yuma,
- Valley Park.

## Interpretation

Mississippi is the strongest local sidecar pressure test since the post-repair
truth-dossier phase. Seven of 12 sampled boxes have no local Geofabrik
everyday-service sidecar in the bounded target box, and all seven are
under-2,500 settlement proxies. That is a depth queue, not a postal-only claim.

The five everyday-service rows are concentrated in larger or more service-rich
places: Wiggins, Verona, Clarksdale, Ocean Springs, and Heidelberg.

## Next Gate

Before Mississippi can enter any denominator numerator:

- current postal-anchor review is required for all seven candidates,
- alternate-source everyday-service depth review is required for all seven
  candidates,
- the denominator manifest must not be extended until Mississippi depth
  decisions exist.

## Boundary

This pass may classify the 12 sampled Mississippi / Deep South Delta target
boxes under the local Geofabrik sidecar method. It may not claim Mississippi
frequency, Deep South Delta frequency, national frequency, complete local
inventory, complete service absence, catchment isolation, service adequacy,
trade areas, income, spending, or customer behavior.
