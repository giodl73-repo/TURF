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

It is not yet the full 11-dimension Washington contract. It is a mid-pass
summary that keeps observed dimensions and source-gated dimensions visible.

Generated output:

```text
reports/ret-atlanta-anchor-field-context-summary.csv
```

## Current Read

| Field | Observed Dimensions | Source-Gated Dimensions | Context Archetype |
|---|---:|---:|---|
| Cumberland / Vinings | 2 | 5 | `finance_dense_service_field` |
| Buckhead / Lenox / Phipps | 4 | 4 | `civic_open_space_mall_field` |
| Perimeter widened | 3 | 5 | `transit_health_edge_city_field` |
| Camp Creek | 0 | 7 | `fully_source_gated_context_field` |
| Northlake | 1 | 7 | `health_only_partial_context_field` |
| North Point / Alpharetta widened | 3 | 5 | `open_space_health_edge_city_field` |
| Decatur / Emory | 4 | 4 | `finance_car_trip_health_service_village` |

## Learning

The strongest current typed fields are:

- Decatur / Emory: finance-dense, gas/convenience-dense, and pharmacy-present
  inner service village.
- Cumberland / Vinings: finance-dense suburban mall/office edge.
- Buckhead / Lenox / Phipps: civic/open-space mall field.
- Perimeter widened: postal/transit/health edge-city field.
- North Point / Alpharetta widened: postal/open-space/health edge-city field.
- Northlake: health-only partial context field in the current checked layers.

The dollar-store layer is source-gated in every Atlanta field. This means the
current summary cannot yet compare Atlanta value-errand texture against
Washington's checked Dollar Tree rows.

Camp Creek and Northlake are not classified as weak. Camp Creek is fully
source-gated across seven of eight acquired dimensions, while Northlake has
pharmacy signal but seven source gates. Both need another source strategy or
later retry.

## Interpretation

This is the clearest evidence so far for typed enclaves. The same retail-field
model is separating Atlanta into finance-dense, civic/open-space,
transit-health-edge-city, open-space-health-edge-city, and
finance/car-trip/health service-village patterns.

The caveat is important: source gates are still high. The summary is useful for
learning, but it should not be used as a final atlas until the remaining
dimensions and source gates are resolved.
