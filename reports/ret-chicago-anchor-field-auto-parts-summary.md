# Chicago Anchor-Field Auto-Parts Summary

Generated output:
`reports/ret-chicago-anchor-field-auto-parts-summary.csv`

Source fixture:
`fixtures/stores/overture-auto-parts-illinois-review-2026-07-22.csv`

Scope: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto Parts
rows from Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-auto-parts-summary.sql"
```

## Current Read

Illinois has 616 packet-ready reviewed auto-parts rows in this first pass:

| Brand | Stores |
| --- | ---: |
| AutoZone | 255 |
| O'Reilly Auto Parts | 234 |
| Advance Auto Parts | 119 |
| NAPA Auto Parts | 8 |
| Total | 616 |

The review excludes six rows: four brand false positives and two duplicate
candidates.

## Chicago Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Loop / River North | 0 | 0 |  | `checked_absent` |
| Lincoln Park / Lakeview | 0 | 0 |  | `checked_absent` |
| Old Orchard / Skokie | 1 | 1 | Advance Auto Parts | `single_auto_parts_anchor` |
| Oakbrook widened | 0 | 0 |  | `checked_absent` |
| Woodfield / Schaumburg | 2 | 2 | Advance Auto Parts; O'Reilly Auto Parts | `auto_service_node` |
| Midway / Ford City | 4 | 3 | Advance Auto Parts; AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| Orland Square | 0 | 0 |  | `checked_absent` |

## Learning

Chicago auto parts is far more selective than QSR. Ford City is the only
multi-brand auto-service corridor in the seven-field target set. Woodfield /
Schaumburg has a smaller two-brand auto-service node, and Old Orchard has a
single Advance Auto Parts anchor.

Loop / River North and Lincoln Park / Lakeview have dense QSR but checked-absent
auto parts inside the bounded fields. That separation is useful: QSR marks
daily-trip fabric, while auto parts marks car-service/trade corridors.

The Ford City result strengthens the southwest airport-edge interpretation.
Its core stack already shows mall, big-box, and grocery signal; QSR adds a
four-brand daily-trip layer, and auto parts adds the clearest trade/car-service
sidecar among Chicago fields.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
