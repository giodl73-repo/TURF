# Auto Parts: Seattle and Puget Sound

## Scope

This report uses the Washington Overture Places auto-parts candidate extract
from `2026-07-22.0`, the reviewed packet-ready layer, Census 2020 ZCTA-county
relationships, and the Census July 2023 CBSA delineation file.

The report is public footprint evidence. It is not an official AutoZone,
O'Reilly, NAPA, Advance, Census, WSDOT, USPS, or corporate territory map.

## Statewide Read

Washington packet-ready rows:

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 27 |
| AutoZone | 106 |
| NAPA Auto Parts | 190 |
| O'Reilly Auto Parts | 184 |
| Total | 507 |

Auto parts reaches 230 Washington ZIP-derived ZCTA candidates and 39 counties
in this first reviewed fixture. The earlier Home Depot/Lowe's Washington layer
reached 64 ZCTA candidates and 22 counties.

## Metro Read

Seattle-Tacoma-Bellevue CBSA (`42660`) is contested, with O'Reilly as the
largest observed brand:

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 15 |
| AutoZone | 50 |
| NAPA Auto Parts | 43 |
| O'Reilly Auto Parts | 89 |
| Total | 197 |

County split inside the Seattle CBSA:

| County | Leader | Stores | Total | Status |
|---|---|---:|---:|---|
| King County | O'Reilly Auto Parts | 42 | 91 | contested |
| Pierce County | O'Reilly Auto Parts | 25 | 55 | contested |
| Snohomish County | O'Reilly Auto Parts | 22 | 51 | contested |

Bremerton-Silverdale-Port Orchard CBSA (`14740`) is NAPA-led:

| Brand | Stores |
|---|---:|
| AutoZone | 3 |
| NAPA Auto Parts | 9 |
| O'Reilly Auto Parts | 5 |
| Total | 17 |

## Ferry Geography

Auto parts changes the ferry-side read immediately:

| Place | Auto-parts finding | Home-improvement comparison |
|---|---|---|
| Bainbridge Island | No direct packet-ready row appears. | No direct Home Depot/Lowe's row appears. |
| Kingston | Two NAPA rows appear. | No direct Home Depot/Lowe's row appears. |
| Bremerton | Seven rows appear: 2 AutoZone, 3 NAPA, 2 O'Reilly. | Bremerton's broader home-improvement metro is contested 2 Home Depot to 2 Lowe's. |
| Poulsbo | Two rows appear: 1 NAPA, 1 O'Reilly. | One Home Depot row appears. |
| Silverdale | Three rows appear: 2 NAPA, 1 O'Reilly. | One Home Depot and one Lowe's row appear. |
| Port Orchard | Three rows appear: 1 AutoZone, 1 NAPA, 1 O'Reilly. | One Lowe's row appears. |

The practical lesson is that auto parts sees local service geography that
home-improvement big boxes mostly skip. Kingston is the cleanest example in
this pulse: ferry-linked north Kitsap has no direct Home Depot/Lowe's row, but
it does have NAPA auto-parts coverage.

## Comparison To Home Improvement

| Layer | Home improvement | Auto parts |
|---|---:|---:|
| Washington packet-ready rows | 92 | 507 |
| Washington ZCTA candidates | 64 | 230 |
| Washington counties | 22 | 39 |
| Seattle CBSA rows | 42 | 197 |
| Bremerton CBSA rows | 4 | 17 |

Home Depot/Lowe's shows destination big-box geography. Auto parts shows a local
repair, parts, and corridor network. That makes auto parts a better category
for learning neighborhood, small-city, ferry-side, and rural service turf before
TURF moves to Target/Walmart.

## Caveats

- NAPA rows need more careful review than single-banner corporate chains because
  Overture contains affiliated and parent-company naming.
- Nearest-competitor spacing is straight-line distance. For Puget Sound, TURF
  still needs ferry-aware impedance before treating cross-water distance as
  practical access.
