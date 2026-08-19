# Mountain West Wyoming Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-wyoming-mountain-west-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-wyoming-mountain-west-review-2026-08-16.csv`,
- `tables/osm-dollar-store-wyoming-mountain-west-review-2026-08-16.csv`,
- `tables/osm-hardware-wyoming-mountain-west-review-2026-08-16.csv`,
- `tables/osm-laundromat-wyoming-mountain-west-review-2026-08-16.csv`.

Status tables:

- `tables/wyoming-mountain-west-food-service-status-2026-08-16.csv`,
- `tables/wyoming-mountain-west-gas-convenience-status-2026-08-16.csv`,
- `tables/wyoming-mountain-west-dollar-store-status-2026-08-16.csv`,
- `tables/wyoming-mountain-west-hardware-status-2026-08-16.csv`,
- `tables/wyoming-mountain-west-laundromat-status-2026-08-16.csv`.

Classification:
`tables/wyoming-mountain-west-minimum-stack-classification-2026-08-16.csv`.

Synthesis:
`tables/wyoming-mountain-west-sidecar-synthesis-2026-08-16.csv`.

Depth candidates:
`tables/wyoming-mountain-west-depth-candidates-2026-08-16.csv`.

Current-anchor review:
`tables/wyoming-current-postal-anchor-review-2026-08-16.csv`.

## Result

The Wyoming/Mountain West local sidecar pass is much less sparse than West
Virginia or South Dakota. Among 12 sampled target boxes:

- food service is observed in 8,
- gas/convenience is observed in 8,
- hardware is observed in 6,
- target-name dollar-store evidence is observed in 1,
- laundromat evidence is observed in 4.

Classification:

- `postal_everyday_service_minimum`: 10,
- `postal_only_candidate`: 2.

The two postal-only candidates are Auburn and Carpenter WY.

## Current-Anchor Gate

The current-postal-anchor gate confirms both postal-only candidates as current
inside-box postal anchors:

- Auburn Post Office at 449 1st West St geocodes inside the Auburn target box,
- Carpenter Post Office at 322 1st St geocodes inside the Carpenter target box.

This means the Wyoming postal-only queue does not collapse at the anchor gate.
It still needs alternate-source everyday-service depth review before either
candidate can support a postal-only minimum-stack finding.

## Interpretation

Wyoming broadens the regional picture. Unlike West Virginia, the first local
sidecar pass is mostly everyday-service observed. Unlike the final West
Virginia depth outcome, the remaining postal-only candidates have current USPS
anchors confirmed inside their boxes. That makes Auburn and Carpenter better
depth candidates than stale-anchor cases, but still not confirmed postal-only
minimum stacks.

## Boundary

This pass may classify the 12 sampled Wyoming/Mountain West target boxes under
the local Geofabrik sidecar method and current-anchor gate. It may not claim
Wyoming frequency, Mountain West frequency, national frequency, complete local
inventory, service adequacy, trade areas, catchments, income, spending, or
customer behavior.
