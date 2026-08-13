# Atlanta Anchor-Field Hardware Summary

## Scope

This report tests small-trade / repair texture across the seven Atlanta anchor
fields using OSM/Overpass `shop=hardware` rows.

Generated output:

```text
reports/ret-atlanta-anchor-field-hardware-summary.csv
```

## Current Read

| Field | Hardware Rows | Signal | Names / Gate |
|---|---:|---|---|
| Cumberland / Vinings | 0 | `source_gated` | `overpass_target_timeout` |
| Buckhead / Lenox / Phipps | 1 | `observed` | Northside Tool Rental |
| Perimeter widened | 0 | `source_gated` | `overpass_target_timeout` |
| Camp Creek | 0 | `source_gated` | `overpass_target_timeout` |
| Northlake | 0 | `source_gated` | `overpass_target_timeout` |
| North Point / Alpharetta widened | 0 | `source_gated` | `overpass_target_timeout` |
| Decatur / Emory | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Buckhead / Lenox / Phipps now has a checked small-trade signal in addition to
postal, library, open-space, and pharmacy texture. That makes the field less
purely luxury-mall/civic than the earlier summary suggested.

The other six fields remain source-gated for hardware. As with the dollar-store
layer, this does not prove hardware absence. It shows that Atlanta's OSM
target fetches still need a later retry window or alternate source strategy
before the Washington 11-dimension contract is equally resolved.
