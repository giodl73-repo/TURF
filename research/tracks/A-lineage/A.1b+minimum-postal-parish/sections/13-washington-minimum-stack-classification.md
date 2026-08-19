# Washington Minimum Stack Classification

## Classifier Inputs

Reusable classification table:
`tables/washington-minimum-stack-classification-2026-08-15.csv`.

The first Washington classifier joins:

- post-office status,
- the existing four-brand QSR flag from the sparse-city queue,
- target-brand pizza delivery/carryout status,
- named OSM food-service status,
- gas/convenience status,
- dollar-store status,
- hardware status,
- laundromat status,
- grocery and pharmacy flags from the sparse-city queue.

Auto-parts and home-improvement rows remain queue-origin signals. They are not
counted as everyday-service sidecars in this first minimum postal stack, except
for independently checked OSM `hardware_status`.

## Results

| Minimum Stack Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 15 |
| postal_food_service_minimum | 3 |
| postal_signal_absent_or_source_gated | 2 |

After the broad food-service sidecar, no target remains a
`postal_only_candidate`.

`postal_food_service_minimum` targets:

- Clallam Bay,
- La Conner,
- Lopez Island.

Darrington and Mesa are not postal minimum-stack classifications in this pass
because the bounded OSM post-office sidecar is checked absent for both, even
though other everyday-service sidecars are observed.

The hardware sidecar does not change the top-level class split. Its observed
targets were already everyday-service minimums from other sidecars.

The laundromat sidecar also does not change the top-level class split because
all 20 target boxes are checked absent for named OSM laundromat rows.

## Boundary

This classification is a pilot table for bounded Washington target boxes. It
does not define municipal, ZIP, ZCTA, CDP, county, postal-locality, trade-area,
or catchment boundaries. It also does not claim no local commerce, service
adequacy, customer behavior, spending, or national smallest-place coverage.
