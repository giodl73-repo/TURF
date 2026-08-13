# Chicago Anchor-Field Post-Office Summary

## Scope

This report starts the Chicago 11-dimension context pass with the postal civic
anchor layer.

Generated output:

```text
reports/ret-chicago-anchor-field-post-office-summary.csv
```

## Current Read

| Field | Post-Office Rows | Private Counters Excluded | Signal | Gate |
|---|---:|---:|---|---|
| Loop / River North | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Lincoln Park / Lakeview | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Old Orchard / Skokie | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Oakbrook widened | 1 | 1 | `observed` |  |
| Woodfield / Schaumburg | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Midway / Ford City | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Orland Square | 0 | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Oakbrook widened has the first checked Chicago postal civic signal: Oak Brook
Post Office. The same bounded response also found one private shipping counter,
The UPS Store, which remains excluded from the post-office count.

The other six fields are source-gated from Overpass target timeouts. This is
not a post-office absence claim. It means Chicago starts with the same source
quality warning Atlanta exposed: the contract can travel, but OSM target
response quality has to be measured field by field.
