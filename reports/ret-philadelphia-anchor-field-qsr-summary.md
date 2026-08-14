# Philadelphia / South Jersey Anchor-Field QSR Summary

Generated output:
`reports/ret-philadelphia-anchor-field-qsr-summary.csv`

Source fixture:
`fixtures/stores/overture-qsr-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: McDonald's, Burger King, Wendy's, and Taco Bell exact-brand rows from
Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-qsr-summary.sql"
```

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.

## Current Read

The Pennsylvania / New Jersey QSR review fixture validates with 1,814
packet-ready rows after excluding two brand false positives. The packet-ready
statewide brand counts are:

| Brand | Packet-ready rows |
| --- | ---: |
| McDonald's | 714 |
| Burger King | 410 |
| Wendy's | 396 |
| Taco Bell | 294 |
| Total | 1,814 |

## Philadelphia / South Jersey Field Read

| Field | QSR rows | Brands | Signal |
| --- | ---: | ---: | --- |
| Center City / Market East | 4 | 3 | QSR service node |
| University City / 30th Street | 2 | 2 | QSR service node |
| King of Prussia | 2 | 1 | QSR service node |
| Northeast Philadelphia / Roosevelt Boulevard | 12 | 4 | four-brand dense QSR grid |
| Conshohocken / Plymouth Meeting | 3 | 3 | QSR service node |
| South Philadelphia Sports / Port | 7 | 4 | multi-brand QSR corridor |
| Camden Waterfront / Cooper | 3 | 2 | QSR service node |
| Cherry Hill / Moorestown | 7 | 3 | multi-brand QSR corridor |

## Learning

QSR sharpens the older auto-corridor and cross-state suburban fields rather
than the dense rail/civic core. Northeast Roosevelt is the only four-brand
dense QSR grid, consistent with its Roosevelt Boulevard / Cottman Avenue
corridor role. South Philadelphia and Cherry Hill / Moorestown are multi-brand
QSR corridors, adding daily-trip texture to the plaza/service and mall-corridor
readouts.

Center City, University City, King of Prussia, Conshohocken / Plymouth Meeting,
and Camden all carry QSR service-node signal, but none should be upgraded on
QSR alone. King of Prussia remains mall-led; QSR is present but not dense
inside the bounded field.
