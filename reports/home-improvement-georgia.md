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

Derived postal store-point input:

```text
fixtures/brands/home-improvement-georgia-packet-ready-postal.csv
```

Derived county store-point input:

```text
fixtures/brands/home-improvement-georgia-packet-ready-county.csv
```

Derived metro store-point input:

```text
fixtures/brands/home-improvement-georgia-packet-ready-metro.csv
```

Atlanta CBSA drilldown:

```text
reports/home-improvement-atlanta-cbsa-drilldown.txt
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

## Postal ZIP / ZCTA-Candidate Read

The postal fixture keeps the source `postal_code` field and adds
`zcta_candidate`, a five-digit ZIP-derived key for future Census joins. Per
TURF's postal/ZCTA source review, this is not yet a confirmed Census ZCTA
polygon join.

| Postal status | ZIP/ZCTA-candidate groups |
|---|---:|
| Dominant | 85 |
| Contested | 21 |
| Total | 106 |

| Leading brand | ZIP/ZCTA-candidate groups |
|---|---:|
| Home Depot | 86 |
| Lowe's | 20 |

## County Read

The county fixture joins each `zcta_candidate` to the 2020 Census county with
the largest ZCTA land overlap. This is a Census relationship-file context, not
a rooftop point-in-county geocode.

County context fixture:

```text
fixtures/geography/georgia-zcta-county-primary-2020.csv
```

| County status | Primary county groups |
|---|---:|
| Dominant | 48 |
| Contested | 11 |
| Total | 59 |

| Leading brand | Primary county groups |
|---|---:|
| Home Depot | 48 |
| Lowe's | 11 |

## Metro / Micro Read

The metro fixture joins primary counties to the Census July 2023 CBSA
delineation file. Counties outside the delineation file remain explicit
`non_cbsa` rows.

Metro context fixture:

```text
fixtures/geography/georgia-county-cbsa-2023.csv
```

| Metro status | Metro/micro/non-CBSA groups |
|---|---:|
| Dominant | 25 |
| Contested | 7 |
| Total | 32 |

| Leading brand | Metro/micro/non-CBSA groups |
|---|---:|
| Home Depot | 23 |
| Lowe's | 9 |

## Largest Metro Signal

| Metro/micro area | Leader | Leader stores | Total stores | Status |
|---|---|---:|---:|---|
| Atlanta-Sandy Springs-Roswell GA | Home Depot | 59 | 79 | dominant |
| Non-CBSA Georgia county | Home Depot | 5 | 6 | dominant |
| Savannah GA | Home Depot | 3 | 5 | dominant |

## Contested Metro / Micro Groups

| Metro/micro area | Leader label | Leader stores | Total stores |
|---|---|---:|---:|
| Albany GA | Home Depot | 1 | 2 |
| Chattanooga TN-GA | Home Depot | 1 | 2 |
| Columbus GA-AL | Home Depot | 1 | 2 |
| Dalton GA | Home Depot | 1 | 2 |
| Moultrie GA | Home Depot | 1 | 2 |
| Rome GA | Home Depot | 1 | 2 |
| Warner Robins GA | Home Depot | 1 | 2 |

## Atlanta CBSA Drilldown

The Atlanta-Sandy Springs-Roswell GA CBSA is the main observed signal in this
Georgia pass.

| Brand | Stores |
|---|---:|
| Home Depot | 59 |
| Lowe's | 20 |
| Total | 79 |

| County | Leader | Leader stores | Total stores | Status |
|---|---|---:|---:|---|
| Gwinnett County | Home Depot | 10 | 13 | dominant |
| Fulton County | Home Depot | 9 | 13 | dominant |
| Cobb County | Home Depot | 9 | 11 | dominant |
| DeKalb County | Home Depot | 5 | 7 | dominant |
| Clayton County | Home Depot | 3 | 4 | dominant |
| Forsyth County | Home Depot | 1 | 2 | contested |
| Henry County | Home Depot | 1 | 2 | contested |
| Rockdale County | Home Depot | 1 | 2 | contested |
| Spalding County | Home Depot | 1 | 2 | contested |

Nearest opposite-brand spacing inside the Atlanta CBSA:

| Spacing read | Stores |
|---|---:|
| Opposite-brand neighbor under 0.5 miles | 12 |
| Opposite-brand neighbor under 1.0 mile | 24 |
| Nearest opposite-brand neighbor in same county | 55 |

Closest mirrored city pairs:

| City | County | Distance miles |
|---|---|---:|
| Cumming | Forsyth County | 0.26 |
| Griffin | Spalding County | 0.28 |
| Snellville | Gwinnett County | 0.36 |
| Loganville | Walton County | 0.40 |
| Marietta | Cobb County | 0.45 |
| Douglasville | Douglas County | 0.45 |

## Contested Primary County Groups

| County | Leader label | Leader stores | Total stores |
|---|---|---:|---:|
| Catoosa County | Home Depot | 1 | 2 |
| Colquitt County | Home Depot | 1 | 2 |
| Dougherty County | Home Depot | 1 | 2 |
| Floyd County | Home Depot | 1 | 2 |
| Forsyth County | Home Depot | 1 | 2 |
| Henry County | Home Depot | 1 | 2 |
| Houston County | Home Depot | 1 | 2 |
| Muscogee County | Home Depot | 1 | 2 |
| Rockdale County | Home Depot | 1 | 2 |
| Spalding County | Home Depot | 1 | 2 |
| Whitfield County | Home Depot | 1 | 2 |

## Contested ZIP/ZCTA-Candidate Groups

These are same-ZIP candidate groups where the current packet-ready sample does
not show a clear postal-level winner.

| ZIP/ZCTA candidate | Leader label | Leader stores | Total stores |
|---|---|---:|---:|
| 30004 | Home Depot | 1 | 2 |
| 30013 | Home Depot | 1 | 2 |
| 30041 | Home Depot | 1 | 2 |
| 30052 | Home Depot | 1 | 2 |
| 30064 | Home Depot | 1 | 2 |
| 30078 | Home Depot | 1 | 2 |
| 30106 | Home Depot | 1 | 2 |
| 30117 | Home Depot | 1 | 2 |
| 30135 | Home Depot | 1 | 2 |
| 30214 | Home Depot | 1 | 2 |
| 30223 | Home Depot | 1 | 2 |
| 30260 | Home Depot | 1 | 2 |
| 30328 | Home Depot | 1 | 2 |
| 30606 | Home Depot | 1 | 2 |
| 30742 | Home Depot | 1 | 2 |
| 30907 | Home Depot | 1 | 2 |
| 31093 | Home Depot | 1 | 2 |
| 31419 | Home Depot | 1 | 2 |
| 31707 | Home Depot | 1 | 2 |
| 31788 | Home Depot | 1 | 2 |
| 31909 | Home Depot | 1 | 2 |

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
- The postal view finds 21 contested ZIP/ZCTA-candidate groups. That is a
  better first target list for county, metro, and drive-time enrichment than the
  full statewide footprint.
- The county view compresses the signal further: 59 primary county groups, with
  11 contested counties. The largest observed concentration is in the Atlanta
  suburban counties, especially Cobb, Fulton, and Gwinnett.
- The metro view reveals the main story so far: the Atlanta CBSA contains 79 of
  the 132 packet-ready stores, with Home Depot leading 59 to 20. Most statewide
  rivalry is therefore metro-edge and suburban, not evenly distributed.
- Inside the Atlanta CBSA, the chains often mirror each other closely. Twelve
  packet-ready stores have an opposite-brand nearest neighbor within half a mile
  and 24 are within one mile.
- Address city/locality is not enough. TURF needs to attach ZIP/ZCTA, county,
  CBSA, urban area, and drive-time layers before saying how these chains divide
  Georgia.

## Commands

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready-postal fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready-county fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- export-packet-ready-metro fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-postal-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-county-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-georgia-packet-ready.csv
```
