# Chicago Anchor-Field Gym Summary

## Scope

This report tests whether a dense OSM category resolves Chicago target fields
better than the first post-office pass.

Generated output:

```text
reports/ret-chicago-anchor-field-gym-summary.csv
```

## Current Read

Old Orchard / Skokie resolved on a targeted retry. The remaining six Chicago
gym fields stay source-gated from earlier bounded target timeouts.

| Field | Gym Rows | Signal | Gate |
|---|---:|---|---|
| Loop / River North | 0 | `source_gated` | `overpass_target_timeout` |
| Lincoln Park / Lakeview | 0 | `source_gated` | `overpass_target_timeout` |
| Old Orchard / Skokie | 4 | `observed` |  |
| Oakbrook widened | 0 | `source_gated` | `overpass_target_timeout` |
| Woodfield / Schaumburg | 0 | `source_gated` | `overpass_target_timeout` |
| Midway / Ford City | 0 | `source_gated` | `overpass_target_timeout` |
| Orland Square | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Chicago's source issue is broader than post office, but the Old Orchard retry
shows the category can resolve when bounded requests succeed. The field has
CorePower Yoga, CycleBar, Life Time, and SoulCycle as named wellness anchors.

That does not prove gym absence in the remaining Chicago fields. It means the
remaining gates are source-quality warnings until TURF retries or adopts an
alternate civic/wellness source strategy.
