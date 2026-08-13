# Dallas/Fort Worth Anchor-Field QSR Summary

Generated output:
`reports/ret-dallas-anchor-field-qsr-summary.csv`

Source fixture:
`fixtures/stores/overture-qsr-texas-review-2026-07-22.csv`

Scope: McDonald's, Burger King, Wendy's, and Taco Bell exact-brand rows from
Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-dallas-anchor-field-qsr-summary.sql"
```

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.

## Current Read

The Texas QSR review fixture validates with 2,989 packet-ready rows after
excluding five brand false positives. The packet-ready statewide brand counts
are:

| Brand | Packet-ready rows |
| --- | ---: |
| McDonald's | 1,274 |
| Taco Bell | 677 |
| Burger King | 583 |
| Wendy's | 455 |
| Total | 2,989 |

The review excludes false-positive rows for Burger Bar, The Burger Joint,
McDonald Sanders, and two Taco Cabana rows before field interpretation.

## Dallas/Fort Worth Field Read

| Field | QSR rows | Brands | Signal |
| --- | ---: | ---: | --- |
| Downtown / Uptown Dallas | 5 | 4 | multi-brand QSR corridor |
| NorthPark / Preston Hollow | 4 | 2 | QSR service node |
| Galleria / Addison | 6 | 4 | multi-brand QSR corridor |
| Legacy / Frisco / Plano | 7 | 4 | multi-brand QSR corridor |
| Las Colinas / Irving | 7 | 3 | multi-brand QSR corridor |
| Arlington / Grand Prairie | 16 | 4 | four-brand dense QSR grid |
| Southlake Town Square | 1 | 1 | single QSR anchor |
| Fort Worth Cultural / West 7th | 1 | 1 | single QSR anchor |

## Learning

QSR intensifies Dallas/Fort Worth in a different way than the core
type-discovery stack. Arlington / Grand Prairie is the only four-brand dense
QSR grid, matching its midcities power/event field role. Downtown / Uptown,
Galleria / Addison, Legacy / Frisco / Plano, and Las Colinas / Irving all carry
multi-brand QSR corridor signal.

NorthPark / Preston Hollow is present but less saturated, reading as a QSR
service node rather than a dense daily-trip grid. Southlake Town Square and
Fort Worth West 7th are light inside the bounded fields, so their existing
town-center and secondary-core labels should not be upgraded on QSR evidence
alone.
