# RET Washington Examples

## Scope

RET means Retail Enclave Typology. This report applies the first RET vocabulary
to the Washington home-improvement and auto-parts fixtures.

The examples are hand-reviewed typology seeds. They are not automated model
output and do not claim official corporate territories.

## Why RET

Raw dominance answers who has more stores. RET asks what kind of commercial
place the evidence suggests.

The Washington comparison shows why this matters. The same geography can have
different commercial forms by category:

- Seattle is a Home-Depot-led `anchor_market` for home improvement.
- Seattle is an O'Reilly-largest `contested_service_grid` for auto parts.
- Kitsap is thin and balanced for home improvement.
- Kitsap is denser and NAPA-led for auto parts.
- Kingston is home-improvement `white_space` but an auto-parts
  `ferry_side_enclave`.

## Seed Examples

| Geography | Category | RET type | Evidence |
|---|---|---|---|
| Kingston | Home improvement | `white_space` | No direct packet-ready Home Depot/Lowe's row. |
| Kingston | Auto parts | `ferry_side_enclave` | Two direct NAPA rows in a ferry-linked place. |
| Seattle-Tacoma-Bellevue CBSA | Home improvement | `anchor_market` | Home Depot leads 26 to 16 in a 42-row destination big-box layer. |
| Seattle-Tacoma-Bellevue CBSA | Auto parts | `contested_service_grid` | 197 auto-parts rows; O'Reilly largest but all four brands present. |
| Bremerton-Silverdale-Port Orchard CBSA | Home improvement | `anchor_market` | Thin regional layer with Home Depot and Lowe's tied 2 to 2. |
| Bremerton-Silverdale-Port Orchard CBSA | Auto parts | `brand_led_service_mesh` | NAPA leads 9 of 17 while O'Reilly and AutoZone remain present. |
| Port Orchard | Auto parts | `contested_service_grid` | AutoZone, NAPA, and O'Reilly each appear once. |
| Bainbridge Island | Home improvement and auto parts | `white_space` | Neither category has a direct packet-ready row in this first pass. |

## Interpretation

RET makes category morphology explicit. Home improvement stores look like
regional anchors. Auto parts stores look like a dense local service mesh.
Ferry-side places expose the difference because water separation makes
same-side local coverage matter more than straight-line distance to Seattle.

The long-term TURF goal is to map these permutations across regions: which
places are anchor markets, service meshes, ferry-side enclaves, corridor
rivalries, county-seat service centers, postal identity zones, or white spaces.

## Next Step

The next implementation step should add an executable RET validator and summary
command for `fixtures/geography/ret-washington-examples.csv`, then use those
examples to design conservative automatic classification rules.
