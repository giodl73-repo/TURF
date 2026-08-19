# Rhode Island Sidecar Pass

## Reusable Output

Food-service review:
`tables/osm-food-service-rhode-island-new-england-review-2026-08-15.csv`.

Status tables:

- `tables/rhode-island-new-england-food-service-status-2026-08-15.csv`,
- `tables/rhode-island-new-england-gas-convenience-status-2026-08-15.csv`,
- `tables/rhode-island-new-england-dollar-store-status-2026-08-15.csv`,
- `tables/rhode-island-new-england-hardware-status-2026-08-15.csv`,
- `tables/rhode-island-new-england-laundromat-status-2026-08-15.csv`.

Classification:
`tables/rhode-island-new-england-minimum-stack-classification-2026-08-15.csv`.

Synthesis:
`tables/rhode-island-new-england-sidecar-synthesis-2026-08-15.csv`.

Depth candidates:
`tables/rhode-island-new-england-depth-candidates-2026-08-15.csv`.

## Source Path

Live Overpass failed for the Rhode Island food-service pass: the primary
endpoint returned 504 and the alternate endpoint timed out. The pass therefore
uses the local Geofabrik OSM GeoPackage extract already used for the post-office
seed.

The sidecar extractor reads target-box overlaps from the GeoPackage POI layers:

- food service: `restaurant`, `fast_food`, `cafe`,
- gas/convenience: `fuel`, `convenience`, `kiosk`,
- hardware: `doityourself`,
- laundromat: `laundry`.

Dollar-store review is header-only in this pass because the local GeoPackage
had no target-name Dollar Tree, Dollar General, or Family Dollar evidence.

## Result

The 12-target Rhode Island sample classifies as:

- `postal_everyday_service_minimum`: 9,
- `postal_food_service_minimum`: 2,
- `postal_only_candidate`: 1.

Food service is observed in 11 of 12 targets. Clayville is the one candidate
without named Geofabrik food-service, gas/convenience, dollar-store, hardware,
or laundromat evidence in the target box.

## Clayville

Clayville survives the local Geofabrik sidecar pass as a postal-only depth
candidate. A narrow OSM API map check around the post-office point returned no
everyday-service matches, but the full target-box OSM API request was too large
for that endpoint.

That means Clayville is not a confirmed postal-only minimum stack yet. It is
the first breadth-phase depth-review candidate.

## Boundary

This pass may classify the 12 sampled Rhode Island target boxes under the local
Geofabrik sidecar method. It may not claim Rhode Island frequency, New England
frequency, national frequency, complete local inventory, service adequacy,
trade areas, catchments, income, spending, or customer behavior.
