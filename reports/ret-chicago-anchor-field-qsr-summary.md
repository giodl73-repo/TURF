# Chicago Anchor-Field QSR Summary

Generated output:
`reports/ret-chicago-anchor-field-qsr-summary.csv`

Source fixture:
`fixtures/stores/overture-qsr-illinois-review-2026-07-22.csv`

Scope: McDonald's, Burger King, Wendy's, and Taco Bell exact-brand rows from
Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-qsr-summary.sql"
```

## Current Read

Illinois has 1,397 packet-ready reviewed QSR rows in this first pass:

| Brand | Stores |
| --- | ---: |
| McDonald's | 650 |
| Taco Bell | 280 |
| Burger King | 273 |
| Wendy's | 194 |
| Total | 1,397 |

Two Overture rows are excluded as brand false positives:

- Mc Donald Funeral Home,
- Wheelock Allen-Melvin Funeral Home.

## Chicago Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Loop / River North | 11 | 3 | Burger King; McDonald's; Taco Bell | `multi_brand_qsr_corridor` |
| Lincoln Park / Lakeview | 12 | 4 | Burger King; McDonald's; Taco Bell; Wendy's | `four_brand_dense_qsr_grid` |
| Old Orchard / Skokie | 1 | 1 | Wendy's | `single_qsr_anchor` |
| Oakbrook widened | 3 | 2 | Burger King; McDonald's | `qsr_service_node` |
| Woodfield / Schaumburg | 6 | 3 | Burger King; McDonald's; Wendy's | `multi_brand_qsr_corridor` |
| Midway / Ford City | 10 | 4 | Burger King; McDonald's; Taco Bell; Wendy's | `four_brand_dense_qsr_grid` |
| Orland Square | 3 | 3 | Burger King; McDonald's; Taco Bell | `qsr_service_node` |

## Learning

Chicago QSR does not simply mirror the mall hierarchy. Lincoln Park / Lakeview
and Midway / Ford City are the two four-brand dense grids, while Loop / River
North and Woodfield / Schaumburg are multi-brand corridors.

Old Orchard stays intentionally light in this chain set with a single Wendy's
inside the bounded field. That reinforces the current Old Orchard read as a
confirmed mall/grocery field rather than a daily-QSR corridor.

The QSR sidecar strengthens Ford City as an airport-edge everyday-service field:
the core stack already has mall, big-box, and grocery signal, and QSR adds a
four-brand daily-trip layer.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
