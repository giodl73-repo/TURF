# Atlanta Anchor-Field Context Summary

## Scope

This report combines the Atlanta context dimensions acquired so far:

- post office
- library
- park / open space
- transit center
- bank / credit union
- gas / convenience
- pharmacy
- dollar store
- hardware
- laundromat
- gym

It is not yet the full 11-dimension Washington contract. It is a mid-pass
summary that keeps observed dimensions and source-gated dimensions visible.

Generated output:

```text
reports/ret-atlanta-anchor-field-context-summary.csv
```

## Current Read

| Field | Observed Dimensions | Source-Gated Dimensions | Context Archetype |
|---|---:|---:|---|
| Cumberland / Vinings | 4 | 6 | `finance_household_wellness_service_field` |
| Buckhead / Lenox / Phipps | 6 | 5 | `civic_open_space_small_trade_mall_field` |
| Perimeter widened | 4 | 6 | `transit_health_edge_city_field` |
| Camp Creek | 3 | 3 | `finance_car_trip_wellness_airport_edge_field` |
| Northlake | 3 | 7 | `partial_context_source_gate` |
| North Point / Alpharetta widened | 4 | 6 | `open_space_health_wellness_edge_city_field` |
| Decatur / Emory | 4 | 7 | `finance_car_trip_health_service_village` |

## Learning

The strongest current typed fields are:

- Decatur / Emory: finance-dense, gas/convenience-dense, and pharmacy-present
  inner service village.
- Cumberland / Vinings: finance-dense household-service and wellness field.
- Buckhead / Lenox / Phipps: civic/open-space/small-trade mall field.
- Perimeter widened: postal/transit/health/wellness edge-city field.
- North Point / Alpharetta widened: postal/open-space/health/wellness
  edge-city field.
- Camp Creek: finance/car-trip/wellness airport-edge field in the current
  checked layers.
- Northlake: library/health/wellness partial context field in the current
  checked layers.

The dollar-store layer is source-gated in every Atlanta field. The hardware
layer adds one checked Buckhead small-trade row, checks Camp Creek absent, and
is source-gated in the other five fields. The laundromat layer adds dense
Cumberland household-service
signal, checks Perimeter and North Point absent, and source-gates four fields.
The gym layer adds dense wellness-service signal in Cumberland, Perimeter, and
North Point, single gym anchors in Buckhead, Camp Creek, and Northlake, and
leaves only Decatur / Emory source-gated.
This means the current summary cannot yet compare Atlanta value-errand texture
against Washington's checked Dollar Tree rows, and it only partially compares
small-trade texture. Household and wellness texture are now meaningfully
observed in several fields.

Camp Creek and Northlake are not classified as weak. Camp Creek now has bank,
gas/convenience, and gym signal, while post office, library, transit, hardware,
and pharmacy are checked absent. Northlake has library, pharmacy, and gym
signal, and has moved below the local source-limited threshold, but it still
needs another source strategy or later retry before final ranking.

## Interpretation

This is the clearest evidence so far for typed enclaves. The same retail-field
model is separating Atlanta into finance-dense, civic/open-space,
transit-health-edge-city, open-space-health-edge-city,
civic/open-space/small-trade mall, and
finance/household/wellness, finance/car-trip/wellness airport-edge, and
finance/car-trip/health service-village patterns.

The caveat is important: source gates are still high. The summary is useful for
learning, but it should not be used as a final atlas until the remaining
dimensions and source gates are resolved.
