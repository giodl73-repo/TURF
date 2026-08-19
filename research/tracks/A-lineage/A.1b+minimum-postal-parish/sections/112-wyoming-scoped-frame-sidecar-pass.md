# Wyoming Scoped Frame Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-wyoming-scoped-frame-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-wyoming-scoped-frame-review-2026-08-16.csv`,
- `tables/osm-dollar-store-wyoming-scoped-frame-review-2026-08-16.csv`,
- `tables/osm-hardware-wyoming-scoped-frame-review-2026-08-16.csv`,
- `tables/osm-laundromat-wyoming-scoped-frame-review-2026-08-16.csv`.

Status tables:

- `tables/wyoming-scoped-frame-food-service-status-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-gas-convenience-status-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-dollar-store-status-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-hardware-status-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-laundromat-status-2026-08-16.csv`.

Classification:
`tables/wyoming-scoped-frame-minimum-stack-classification-2026-08-16.csv`.

Synthesis:
`tables/wyoming-scoped-frame-sidecar-synthesis-2026-08-16.csv`.

Depth candidates:
`tables/wyoming-scoped-frame-depth-candidates-2026-08-16.csv`.

Sidecar execution status:
`tables/wyoming-scoped-frame-sidecar-status-2026-08-16.csv`.

## Execution

The scoped-frame sidecar pass reused the selected-wave Wyoming Geofabrik
pipeline, but ran it against all 84 repaired enriched scoped-frame target
boxes instead of the 12-row selected sample.

Raw local Geofabrik review rows:

- food service: 1,370,
- gas/convenience: 237,
- dollar store: 2,
- hardware: 101,
- laundromat: 56.

Observed target-box counts:

- food service observed in 57 of 84 target boxes,
- gas/convenience observed in 43 of 84,
- dollar-store evidence observed in 2 of 84,
- hardware observed in 29 of 84,
- laundromat observed in 19 of 84.

## Classification

The first-pass scoped-frame minimum-stack classes are:

- `postal_everyday_service_minimum`: 45,
- `postal_food_service_minimum`: 15,
- `postal_only_candidate`: 24.

The 24 postal-only candidates are a depth queue, not a numerator. They require
current postal-anchor review and alternate-source everyday-service depth review
before any denominator, exclusion, or estimator table can use them as candidate
survivors.

The candidate settlement-size proxy buckets are:

- `under_2500`: 9,
- `2500_to_9999`: 6,
- `10000_to_49999`: 9,
- `50000_plus`: 0.

## Next Gate

The next scoped-frame gate is current postal-anchor review for the 24
first-pass postal-only candidates. That queue is initialized in
`sections/113-wyoming-scoped-frame-current-anchor-queue.md`. No candidate
advances to depth review or denominator treatment without a current postal
anchor confirmed inside its bounded target box or an explicit exclusion status.

## Boundary

This sidecar pass classifies bounded Wyoming scoped-frame target boxes under a
local Geofabrik sidecar method. It does not prove complete local inventory,
service absence, service adequacy, trade areas, catchments, customer behavior,
or Wyoming, Mountain West, regional, or national frequency.
