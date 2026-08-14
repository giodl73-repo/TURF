# Philadelphia / South Jersey Anchor-Field Auto-Parts Summary

Generated output:
`reports/ret-philadelphia-anchor-field-auto-parts-summary.csv`

Source fixture:
`fixtures/stores/overture-auto-parts-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto Parts
rows from Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-auto-parts-summary.sql"
```

## Current Read

The Pennsylvania / New Jersey auto-parts review fixture validates with 759
packet-ready rows after excluding 12 brand false positives and one duplicate
candidate. The packet-ready statewide brand counts are:

| Brand | Stores |
| --- | ---: |
| AutoZone | 358 |
| Advance Auto Parts | 332 |
| O'Reilly Auto Parts | 40 |
| NAPA Auto Parts | 29 |
| Total | 759 |

## Philadelphia / South Jersey Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Center City / Market East | 0 | 0 |  | `checked_absent` |
| University City / 30th Street | 0 | 0 |  | `checked_absent` |
| King of Prussia | 0 | 0 |  | `checked_absent` |
| Northeast Philadelphia / Roosevelt Boulevard | 3 | 2 | Advance Auto Parts; AutoZone | `multi_brand_auto_service_corridor` |
| Conshohocken / Plymouth Meeting | 0 | 0 |  | `checked_absent` |
| South Philadelphia Sports / Port | 3 | 2 | Advance Auto Parts; AutoZone | `multi_brand_auto_service_corridor` |
| Camden Waterfront / Cooper | 0 | 0 |  | `checked_absent` |
| Cherry Hill / Moorestown | 5 | 3 | Advance Auto Parts; AutoZone; NAPA Auto Parts | `multi_brand_auto_service_corridor` |

## Learning

Auto parts is more selective than QSR and lines up with corridor terrain. The
three observed fields are Northeast Roosevelt, South Philadelphia, and Cherry
Hill / Moorestown. Those are also the fields where QSR already showed corridor
or dense-grid signal, so the sidecars reinforce an auto-oriented daily-service
axis rather than spreading evenly across every anchor field.

The checked-absent fields are just as useful. Center City and University City
remain rail/civic and eds-and-meds service fields, not auto-service corridors.
King of Prussia remains mall-led inside the bounded box, with retail-complex
and mass-retail evidence but no auto-parts sidecar rows. Camden Waterfront
keeps its older industrial river civic readout rather than becoming a retail
or auto-service field in this layer.
