# Atlanta Anchor-Field Laundromat Summary

## Scope

This report tests household-service texture across the seven Atlanta anchor
fields using OSM/Overpass `shop=laundry` rows.

Generated output:

```text
reports/ret-atlanta-anchor-field-laundromat-summary.csv
```

## Current Read

| Field | Laundromat Rows | Signal | Names / Gate |
|---|---:|---|---|
| Cumberland / Vinings | 2 | `observed_dense` | Spring Road Laundry; Tiny Bubbles Coin Laundry |
| Buckhead / Lenox / Phipps | 0 | `source_gated` | `overpass_target_timeout` |
| Perimeter widened | 0 | `checked_absent` |  |
| Camp Creek | 0 | `source_gated` | `overpass_target_timeout` |
| Northlake | 0 | `source_gated` | `overpass_target_timeout` |
| North Point / Alpharetta widened | 0 | `checked_absent` |  |
| Decatur / Emory | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Cumberland / Vinings gains a household-service signal that was not visible in
the finance-only read. The observed rows sit around Spring Road, giving the
field a more lived-service edge than the mall/office label alone suggests.

Perimeter widened and North Point / Alpharetta widened are checked absent in
this source pass. Buckhead, Camp Creek, Northlake, and Decatur remain
source-gated and should not be read as laundromat absences.
