# Atlanta Anchor-Field Dollar-Store Summary

## Scope

This report tests value-errand texture across the seven Atlanta anchor fields
using the same OSM/Overpass `shop=variety_store` review boundary as the
Washington dollar-store layer.

Target packet-ready brands are Dollar Tree, Dollar General, and Family Dollar.
Non-target variety stores and unnamed value anchors remain audit rows and are
excluded from counted packet-ready rows.

Generated output:

```text
reports/ret-atlanta-anchor-field-dollar-store-summary.csv
```

## Current Read

All seven Atlanta field fetches timed out against the bounded Overpass target
queries on 2026-08-13. Camp Creek also timed out against the main Overpass
endpoint fallback.

| Field | Dollar-Store Rows | Signal | Gate Reason |
|---|---:|---|---|
| Cumberland / Vinings | 0 | `source_gated` | `overpass_target_timeout` |
| Buckhead / Lenox / Phipps | 0 | `source_gated` | `overpass_target_timeout` |
| Perimeter widened | 0 | `source_gated` | `overpass_target_timeout` |
| Camp Creek | 0 | `source_gated` | `overpass_target_timeout` |
| Northlake | 0 | `source_gated` | `overpass_target_timeout` |
| North Point / Alpharetta widened | 0 | `source_gated` | `overpass_target_timeout` |
| Decatur / Emory | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

This layer does not prove value-retail absence in Atlanta. It proves that the
current OSM/Overpass extraction path cannot yet support a clean Atlanta
dollar-store comparison.

That still matters for scaling. Washington's dollar-store layer separated
value-errand mall/suburban fields from Bellevue and Factoria checked absences.
Atlanta needs either a later Overpass retry window or an alternate reviewed
open source before value texture can be compared honestly against Washington.
