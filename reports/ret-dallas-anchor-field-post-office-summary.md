# Dallas/Fort Worth Anchor-Field Post-Office Summary

## Scope

This report starts the Dallas/Fort Worth pre-scale stack with the postal civic
anchor layer.

Generated output:

```text
reports/ret-dallas-anchor-field-post-office-summary.csv
```

## Current Read

| Field | Post-Office Rows | Private Counters Excluded | Signal | Gate |
|---|---:|---:|---|---|
| Downtown / Uptown Dallas | 2 | 3 | `observed` |  |
| NorthPark / Preston Hollow | 1 | 1 | `observed` |  |
| Galleria / Addison | 3 | 2 | `observed` |  |
| Legacy / Frisco / Plano | 0 | 3 | `checked_absent` |  |
| Las Colinas / Irving | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Arlington / Grand Prairie | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Southlake Town Square | 1 | 0 | `observed` |  |
| Fort Worth Cultural / West 7th | 0 | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Dallas/Fort Worth immediately shows postal civic signal in four fields:
Downtown / Uptown, NorthPark / Preston Hollow, Galleria / Addison, and
Southlake Town Square. Galleria / Addison is the strongest first postal edge,
with three packet-ready post-office rows inside the bounded edge-city field.

Legacy / Frisco / Plano is not postal-empty as a broader area, but the bounded
field returned only private shipping/mail counters in this pass, so it is a
checked absence for USPS-like civic post-office signal inside the current box.

Las Colinas / Irving, Arlington / Grand Prairie, and Fort Worth Cultural /
West 7th remain source-gated because their target requests timed out. Those
timeouts should be retried or moved to an alternate public source path before
TURF uses postal signal to rank those fields.
