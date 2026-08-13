# Dallas/Fort Worth Anchor-Field Auto-Parts Summary

Generated output:
`reports/ret-dallas-anchor-field-auto-parts-summary.csv`

Source fixture:
`fixtures/stores/overture-auto-parts-texas-review-2026-07-22.csv`

Scope: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto Parts
rows from Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-dallas-anchor-field-auto-parts-summary.sql"
```

## Current Read

Texas has 1,827 packet-ready reviewed auto-parts rows in this first pass:

| Brand | Stores |
| --- | ---: |
| O'Reilly Auto Parts | 854 |
| AutoZone | 733 |
| Advance Auto Parts | 214 |
| NAPA Auto Parts | 26 |
| Total | 1,827 |

The review excludes 15 rows: five duplicate candidates and ten brand false
positives, including NAPA-name mismatches, Tri-C Auto Zone, and an O'Reilly
warehouse customer pickup row.

## Dallas/Fort Worth Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Downtown / Uptown Dallas | 0 | 0 |  | `checked_absent` |
| NorthPark / Preston Hollow | 2 | 2 | AutoZone; O'Reilly Auto Parts | `auto_service_node` |
| Galleria / Addison | 2 | 2 | AutoZone; O'Reilly Auto Parts | `auto_service_node` |
| Legacy / Frisco / Plano | 1 | 1 | AutoZone | `single_auto_parts_anchor` |
| Las Colinas / Irving | 1 | 1 | AutoZone | `single_auto_parts_anchor` |
| Arlington / Grand Prairie | 13 | 3 | Advance Auto Parts; AutoZone; O'Reilly Auto Parts | `dense_multi_brand_auto_service_grid` |
| Southlake Town Square | 0 | 0 |  | `checked_absent` |
| Fort Worth Cultural / West 7th | 1 | 1 | O'Reilly Auto Parts | `single_auto_parts_anchor` |

## Learning

Dallas/Fort Worth auto parts is more selective than QSR but far less absent
than Chicago. Arlington / Grand Prairie is the clear trade/car-service standout:
it has 13 rows across three brands, matching the midcities power/event field
interpretation and strengthening it beyond mall and QSR evidence.

NorthPark / Preston Hollow and Galleria / Addison show smaller two-brand
auto-service nodes. That suggests mature north Dallas retail fields have enough
car-service texture to register, but not enough depth to become trade corridors
inside the current boxes.

Downtown / Uptown Dallas and Southlake Town Square are checked absent for this
chain set. Legacy / Frisco / Plano, Las Colinas / Irving, and Fort Worth West
7th each have only a single auto-parts anchor, so their current field labels
should not be upgraded on auto-parts evidence alone.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
