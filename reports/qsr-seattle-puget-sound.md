# QSR: Seattle and Puget Sound

## Scope

This report uses the Washington Overture Places QSR candidate extract from
`2026-07-22.0`, the reviewed packet-ready layer, Census 2020 ZCTA-county
relationships, and the Census July 2023 CBSA delineation file.

The report is public footprint evidence. It is not an official McDonald's,
Burger King, Wendy's, Taco Bell, franchise, Census, WSDOT, USPS, or corporate
territory map.

## Statewide Read

Washington packet-ready rows:

| Brand | Stores |
|---|---:|
| Burger King | 116 |
| McDonald's | 260 |
| Taco Bell | 144 |
| Wendy's | 86 |
| Total | 606 |

QSR reaches 217 ZIP-derived ZCTA candidates and 32 Washington counties in this
first reviewed fixture. For comparison, the earlier auto-parts layer reached
230 ZCTA candidates and 39 counties, while home improvement reached 64 ZCTA
candidates and 22 counties.

## Metro Read

Seattle-Tacoma-Bellevue CBSA (`42660`) is McDonald's-led but contested:

| Brand | Stores |
|---|---:|
| Burger King | 49 |
| McDonald's | 126 |
| Taco Bell | 60 |
| Wendy's | 39 |
| Total | 274 |

County split inside the Seattle CBSA:

| County | Leader | Stores | Total | Status |
|---|---|---:|---:|---|
| King County | McDonald's | 64 | 126 | dominant |
| Pierce County | McDonald's | 34 | 83 | contested |
| Snohomish County | McDonald's | 28 | 65 | contested |

Bremerton-Silverdale-Port Orchard CBSA (`14740`) is also McDonald's-led but
contested:

| Brand | Stores |
|---|---:|
| Burger King | 6 |
| McDonald's | 10 |
| Taco Bell | 6 |
| Wendy's | 5 |
| Total | 27 |

## Ferry Geography

QSR makes the ferry-side map more local than either home improvement or auto
parts:

| Place | QSR finding | Prior category comparison |
|---|---|---|
| Bainbridge Island | One McDonald's row. | No direct home-improvement or auto-parts row. |
| Kingston | One McDonald's row. | No direct home-improvement row; two NAPA auto-parts rows. |
| Bremerton | Nine rows across all four QSR brands. | Seven auto-parts rows and no direct city-level home-improvement row. |
| Poulsbo | Four rows, one for each QSR brand. | Two auto-parts rows and one Home Depot row. |
| Silverdale | Six rows across all four QSR brands. | Three auto-parts rows and one Home Depot plus one Lowe's. |
| Port Orchard | Six rows across all four QSR brands. | Three auto-parts rows and one Lowe's. |

## Spacing Signal

The QSR layer produces dense same-place competition:

| Place | Stores | Brands | Nearest opposite-brand miles | Close pairs under 0.5 miles |
|---|---:|---:|---:|---:|
| Bainbridge Island | 1 | 1 |  | 0 |
| Kingston | 1 | 1 |  | 0 |
| Bremerton | 9 | 4 | 0.06 | 9 |
| Poulsbo | 4 | 4 | 0.06 | 2 |
| Silverdale | 6 | 4 | 0.16 | 4 |
| Port Orchard | 6 | 4 | 0.18 | 1 |

## Interpretation

QSR is a daily-life grid rather than a destination-store category. McDonald's is
the broad default layer, but Taco Bell, Burger King, and Wendy's turn many
places into contested local restaurant grids.

The strongest new TURF lesson is ferry-side selectivity. Bainbridge Island and
Kingston are not QSR white spaces: each has a McDonald's row. But they are
single-brand QSR places in this first reviewed layer, while Bremerton, Poulsbo,
Silverdale, and Port Orchard are four-brand contested QSR places. That gives
RET a cleaner distinction between a ferry-side single-brand node and a dense
same-side commercial grid.

## Caveats

- Rows are Overture-derived candidates, not an official chain store census.
- All first-pass reviewed rows are `packet_ready`; deeper manual review should
  check co-branded, venue, and stale-store edge cases before national reports.
- Nearest-competitor spacing is straight-line distance. Puget Sound still needs
  ferry-aware impedance before cross-water access is treated as practical
  service territory.
