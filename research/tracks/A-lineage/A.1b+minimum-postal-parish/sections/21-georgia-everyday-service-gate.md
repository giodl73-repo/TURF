# Georgia Everyday-Service Gate

## Reusable Output

Broad food-service review layer:
`tables/osm-food-service-georgia-second-pilot-review-2026-08-15.csv`.

Everyday-service status tables:

- `tables/georgia-food-service-status-2026-08-15.csv`
- `tables/georgia-gas-convenience-status-2026-08-15.csv`
- `tables/georgia-dollar-store-status-2026-08-15.csv`
- `tables/georgia-hardware-status-2026-08-15.csv`
- `tables/georgia-laundromat-status-2026-08-15.csv`

Classifier:
`tables/georgia-minimum-stack-classification-2026-08-15.csv`.

## Scope

Only Ball Ground and Cohutta were eligible for this pass because the Georgia
post-office gate observed bounded post-office evidence in those two target
boxes. The other 18 Georgia second-pilot targets remain post-office
checked-absent in this bounded evidence stack and are not classified here.

## Result

The completed sidecar statuses for the two eligible Georgia targets are:

| Layer | Observed | Checked Absent | Source Gated |
|---|---:|---:|---:|
| food_service | 2 | 0 | 0 |
| gas_convenience | 0 | 2 | 0 |
| dollar_store | 0 | 2 | 0 |
| hardware | 0 | 2 | 0 |
| laundromat | 0 | 2 | 0 |

The resulting classifier has:

| Minimum Stack Class | Targets |
|---|---:|
| postal_food_service_minimum | 2 |
| postal_only_candidate | 0 |
| postal_everyday_service_minimum | 0 |
| postal_signal_absent_or_source_gated | 0 |

Ball Ground and Cohutta both started from `auto_parts` sparse-chain queue
evidence. That queue-origin signal is useful for candidate selection, but it is
not counted as an everyday-service sidecar in this classifier.

## Read

Georgia does not confirm any postal-only target. Both postal-observed targets
are now `postal_food_service_minimum` after an OSM API 0.6 map retry found named
food-service rows inside both bounded target boxes.

The earlier alternate Overpass endpoint returned zero food-service rows for
Ball Ground and Cohutta, while main-endpoint and narrower food-service
verification timed out. The resolving OSM API retry found eight packet-ready
food-service rows in Ball Ground and five in Cohutta, so the prior source gate
is closed.

Gas/convenience, dollar store, hardware, and laundromat are checked absent
inside the two bounded target boxes.

## Next Gate

Compare the Georgia result against the Washington pilot before any national
sampling claim. The two-state pilot now points in the same direction: the
sparsest durable postal stacks in these bounded tests are not postal-only;
they retain at least one everyday food-service signal.

## Boundary

This gate may say the two Georgia post-office-observed target boxes have
observed food-service and checked-absent gas/convenience, dollar store,
hardware, and laundromat in this bounded OSM evidence stack. It may not claim
citywide, ZIP, ZCTA, CDP, county, postal-locality, trade-area, or catchment
absence, and it may not claim Georgia has postal-only minimum parishes.
