# Home Improvement: Seattle and Puget Sound

## Scope

This report uses the Washington Overture Places candidate extract from
`2026-07-22.0`, the reviewed packet-ready layer, Census 2020 ZCTA-county
relationships, and the Census July 2023 CBSA delineation file.

The report is public footprint evidence. It is not an official Home Depot,
Lowe's, USPS, WSDOT, Census, or corporate territory map.

## Statewide Read

Washington packet-ready rows:

| Brand | Stores |
|---|---:|
| Home Depot | 57 |
| Lowe's | 35 |
| Total | 92 |

## Metro Read

Seattle-Tacoma-Bellevue CBSA (`42660`) is Home Depot-led:

| Brand | Stores |
|---|---:|
| Home Depot | 26 |
| Lowe's | 16 |
| Total | 42 |

County split inside the Seattle CBSA:

| County | Home Depot/Lowe's read |
|---|---|
| King County | Home Depot leads 15 to 7. |
| Pierce County | Home Depot leads 6 to 4. |
| Snohomish County | The brands tie 5 to 5, so the county is contested. |

Bremerton-Silverdale-Port Orchard CBSA (`14740`) is separate from the Seattle
CBSA and is contested:

| Brand | Stores |
|---|---:|
| Home Depot | 2 |
| Lowe's | 2 |
| Total | 4 |

## Ferry Geography

The ferry-linked places are not just ordinary Seattle suburbs in this first
read:

| Place | Finding |
|---|---|
| Bainbridge Island | No direct packet-ready Home Depot or Lowe's row appears in the Washington extract. The nearest fixture-level read should come from Kitsap anchors rather than from Seattle rings. |
| Kingston | No direct packet-ready row appears. Poulsbo and Silverdale are the useful north Kitsap retail anchors in this fixture. |
| Bremerton | The broader Bremerton-Silverdale-Port Orchard metro is balanced at 2 Home Depot and 2 Lowe's. The checked nearest mirrored pair is Silverdale at 0.44 straight-line miles. |

WSDOT lists the relevant public ferry route names as Seattle / Bainbridge
Island, Seattle / Bremerton, and Edmonds / Kingston. TURF records those route
hints in `fixtures/geography/puget-sound-ferry-context.csv`.

## Ring Read

Seattle CBSA rings from downtown Seattle (`47.6062,-122.3321`):

| Ring | Home Depot | Lowe's | Total | Lowe's share |
|---|---:|---:|---:|---:|
| `urban_core` | 4 | 3 | 7 | 0.429 |
| `inner_suburb` | 14 | 7 | 21 | 0.333 |
| `outer_suburb` | 8 | 6 | 14 | 0.429 |

Bremerton CBSA rings from Bremerton (`47.5650,-122.6270`):

| Ring | Home Depot | Lowe's | Total | Lowe's share |
|---|---:|---:|---:|---:|
| `urban_core` | 1 | 2 | 3 | 0.667 |
| `inner_suburb` | 1 | 0 | 1 | 0.000 |

## Interpretation

Seattle itself is not a Lowe's-over-Home-Depot market in this first read. Home
Depot leads the Seattle CBSA and every Seattle distance ring. Lowe's is still
substantial, especially in close mirrored pairs like Seattle, Puyallup, Tacoma,
Bonney Lake, and Issaquah.

The more interesting Puget Sound lesson is that ferry geography breaks a simple
suburban model. Kitsap County is not inside the Seattle CBSA even though ferry
routes tie Bainbridge Island and Bremerton directly to Seattle. The observed
Kitsap home-improvement footprint is contested, with Poulsbo, Silverdale, and
Port Orchard acting as anchors for ferry-linked communities that do not have
their own packet-ready row.

## Follow-Up

The next Puget Sound step should add ferry-aware impedance before treating
Seattle distance rings as catchments across water. The first implementation can
be a small route-edge fixture that joins places to ferry terminals and labels
whether a store is on the same-side road network or requires a ferry crossing.
