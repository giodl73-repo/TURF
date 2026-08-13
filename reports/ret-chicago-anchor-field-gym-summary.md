# Chicago Anchor-Field Gym Summary

## Scope

This report tests whether a dense OSM category resolves Chicago target fields
better than the first post-office pass.

Generated output:

```text
reports/ret-chicago-anchor-field-gym-summary.csv
```

## Current Read

All seven Chicago gym fetches timed out across bounded target requests on
2026-08-13. The Loop / River North fallback against the main Overpass endpoint
also timed out.

| Field | Gym Rows | Signal | Gate |
|---|---:|---|---|
| Loop / River North | 0 | `source_gated` | `overpass_target_timeout` |
| Lincoln Park / Lakeview | 0 | `source_gated` | `overpass_target_timeout` |
| Old Orchard / Skokie | 0 | `source_gated` | `overpass_target_timeout` |
| Oakbrook widened | 0 | `source_gated` | `overpass_target_timeout` |
| Woodfield / Schaumburg | 0 | `source_gated` | `overpass_target_timeout` |
| Midway / Ford City | 0 | `source_gated` | `overpass_target_timeout` |
| Orland Square | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Chicago's source issue is broader than post office. Gym is a dense category in
Washington and Atlanta, but the Chicago target pass still fully source-gated.

That does not prove gym absence in Chicago. It means the Chicago extraction
strategy should change before TURF spends many pulses attempting every
remaining OSM category one by one.
