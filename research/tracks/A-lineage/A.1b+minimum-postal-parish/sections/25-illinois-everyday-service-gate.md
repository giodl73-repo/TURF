# Illinois Everyday-Service Gate

## Reusable Output

Everyday-service review layers:

- `tables/osm-food-service-illinois-third-pilot-review-2026-08-15.csv`
- `tables/osm-gas-convenience-illinois-third-pilot-review-2026-08-15.csv`
- `tables/osm-dollar-store-illinois-third-pilot-review-2026-08-15.csv`
- `tables/osm-hardware-illinois-third-pilot-review-2026-08-15.csv`
- `tables/osm-laundromat-illinois-third-pilot-review-2026-08-15.csv`

Everyday-service status tables:

- `tables/illinois-food-service-status-2026-08-15.csv`
- `tables/illinois-gas-convenience-status-2026-08-15.csv`
- `tables/illinois-dollar-store-status-2026-08-15.csv`
- `tables/illinois-hardware-status-2026-08-15.csv`
- `tables/illinois-laundromat-status-2026-08-15.csv`

Classifier:
`tables/illinois-minimum-stack-classification-2026-08-15.csv`.

## Scope

Only the eight post-office-observed Illinois targets moved into this sidecar
pass:

- Fairbury,
- Greenup,
- Mount Carmel,
- Virden,
- Winthrop Harbor,
- Albion,
- Altamont,
- Arcola.

The two post-office checked-absent targets and ten post-office source-gated
targets remain outside everyday-service classification.

## Result

The completed sidecar statuses for the eight eligible Illinois targets are:

| Layer | Observed | Checked Absent | Source Gated |
|---|---:|---:|---:|
| food_service | 8 | 0 | 0 |
| gas_convenience | 5 | 3 | 0 |
| dollar_store | 3 | 5 | 0 |
| hardware | 0 | 8 | 0 |
| laundromat | 0 | 8 | 0 |

The classifier has:

| Minimum Stack Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 5 |
| postal_food_service_minimum | 3 |
| postal_only_candidate | 0 |
| postal_signal_absent_or_source_gated | 12 |

The three Illinois `postal_food_service_minimum` targets are:

- Mount Carmel,
- Virden,
- Albion.

## Read

Illinois reinforces the Washington and Georgia pattern. Every
post-office-observed Illinois target has named food-service in the bounded OSM
API sidecar pass. No Illinois postal-only candidate survives among the
post-office-observed targets.

The Illinois gate is still less complete than Washington and Georgia because 10
of the 20 target boxes remain post-office source-gated. Those targets should not
be used to make absence claims until post-office verification is resolved.

## Boundary

This gate may classify the eight post-office-observed Illinois target boxes.
It may not claim Illinois-wide frequency, citywide service absence, complete
food-service inventory, ZIP/ZCTA/CDP/county coverage, trade areas, catchments,
or service adequacy.
