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
| Camp Creek | 0 | `checked_absent` |  |
| Northlake | 1 | `observed` | Imeca Hardware |
| North Point / Alpharetta widened | 0 | `source_gated` | `overpass_target_timeout` |
| Decatur / Emory | 0 | `checked_absent` |  |

## Learning

Buckhead / Lenox / Phipps now has a checked small-trade signal in addition to
postal, library, open-space, and pharmacy texture. That makes the field less
purely luxury-mall/civic than the earlier summary suggested.

Northlake now adds Imeca Hardware, which strengthens the field's legacy mall
service read. Decatur / Emory and Camp Creek are checked absent for hardware in
the current bounded field definitions.

Cumberland / Vinings, Perimeter widened, and North Point / Alpharetta widened
remain source-gated for hardware. As with the dollar-store layer, this does not
prove hardware absence. It shows that Atlanta's OSM target fetches still need a
later retry window or alternate source strategy before the Washington
11-dimension contract is equally resolved.
