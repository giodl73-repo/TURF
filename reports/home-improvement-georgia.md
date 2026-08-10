# Georgia Home Improvement Footprint

## Scope

First statewide TURF read for Home Depot and Lowe's in Georgia using reviewed
Overture Places candidates from release `2026-07-22.0`.

This report uses only rows marked `packet_ready` in:

```text
fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv
```

Derived store-point input:

```text
fixtures/brands/home-improvement-georgia-packet-ready.csv
```

## Review Gate

| Review status | Rows |
|---|---:|
| `packet_ready` | 132 |
| `needs_review` | 3 |
| `exclude` | 1 |
| Total reviewed candidates | 136 |

## Statewide Brand Count

| Brand | Packet-ready stores |
|---|---:|
| Home Depot | 90 |
| Lowe's | 42 |
| Total | 132 |

## City-Level Read

TURF currently groups this report by candidate address city/locality. That makes
postal/locality labels visible, but it is not the same as ZIP, ZCTA,
municipality, county, CBSA, urban area, or drive-time territory.

| City status | City/locality groups |
|---|---:|
| Dominant | 70 |
| Contested | 20 |
| Total | 90 |

| Leading brand | City/locality groups |
|---|---:|
| Home Depot | 73 |
| Lowe's | 17 |

## Contested City/Locality Groups

These are same-city/locality groups where the current packet-ready sample does
not show a clear city-level winner.

| City/locality | Leader label | Leader stores | Total stores |
|---|---|---:|---:|
| Albany | Home Depot | 1 | 2 |
| Augusta | Home Depot | 1 | 2 |
| Buford | Home Depot | 1 | 2 |
| Carrollton | Home Depot | 1 | 2 |
| Columbus | Home Depot | 1 | 2 |
| Conyers | Home Depot | 1 | 2 |
| Cumming | Home Depot | 1 | 2 |
| Dalton | Home Depot | 1 | 2 |
| Douglasville | Home Depot | 1 | 2 |
| Fayetteville | Home Depot | 1 | 2 |
| Fort Oglethorpe | Home Depot | 1 | 2 |
| Gainesville | Home Depot | 1 | 2 |
| Griffin | Home Depot | 1 | 2 |
| Loganville | Home Depot | 1 | 2 |
| Morrow | Home Depot | 1 | 2 |
| Moultrie | Home Depot | 1 | 2 |
| Rome | Home Depot | 1 | 2 |
| Sandy Springs | Home Depot | 1 | 2 |
| Snellville | Home Depot | 1 | 2 |
| Warner Robins | Home Depot | 1 | 2 |

## What We Are Learning

- Home Depot has the larger reviewed Georgia footprint in this Overture-derived
  candidate set: 90 packet-ready rows versus 42 for Lowe's.
- Many apparent city wins are one-store localities. That is useful evidence,
  but weak territory evidence by itself.
- The 20 contested city/locality groups are mostly 1-to-1 pairings. Those are
  better candidates for ZIP/ZCTA, road, and catchment analysis than for simple
  city-level scoring.
- Address city/locality is not enough. TURF needs to attach ZIP/ZCTA, county,
  CBSA, urban area, and drive-time layers before saying how these chains divide
  Georgia.

## Commands

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-georgia-packet-ready.csv
```
