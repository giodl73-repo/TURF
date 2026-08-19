# Appalachia West Virginia Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-west-virginia-appalachia-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-west-virginia-appalachia-review-2026-08-16.csv`,
- `tables/osm-dollar-store-west-virginia-appalachia-review-2026-08-16.csv`,
- `tables/osm-hardware-west-virginia-appalachia-review-2026-08-16.csv`,
- `tables/osm-laundromat-west-virginia-appalachia-review-2026-08-16.csv`.

Classification:
`tables/west-virginia-appalachia-minimum-stack-classification-2026-08-16.csv`.

Synthesis:
`tables/west-virginia-appalachia-sidecar-synthesis-2026-08-16.csv`.

Depth candidates:
`tables/west-virginia-appalachia-depth-candidates-2026-08-16.csv`.

## Result

The West Virginia/Appalachia local sidecar pass is sparse. Among 12 sampled
target boxes:

- food service is observed in 2,
- gas/convenience is observed in 2,
- hardware is observed in 1,
- target-name dollar-store evidence is observed in 0,
- laundromat evidence is observed in 0.

Classification:

- `postal_everyday_service_minimum`: 3,
- `postal_only_candidate`: 9.

The nine postal-only candidates are Advent, Alkol, Alum Bridge, Alvy, Ameagle,
Amherstdale, Amma, Annamoriah, and Anthony.

## Interpretation

West Virginia behaves more like the South Dakota local Geofabrik result than
the Rhode Island result: the first seed-order sample produces many
postal-only candidates under local OSM sidecars.

This does not confirm postal-only minimum stacks. The South Dakota follow-up
showed that local OSM absence can collapse under alternate local-directory and
brand-source review. The correct next move is depth review of the nine
Appalachia candidates, not a regional frequency claim.

## Boundary

This pass may classify the 12 sampled West Virginia/Appalachia target boxes
under the local Geofabrik sidecar method. It may not claim West Virginia
frequency, Appalachia frequency, national frequency, complete local inventory,
service adequacy, trade areas, catchments, income, spending, or customer
behavior.
