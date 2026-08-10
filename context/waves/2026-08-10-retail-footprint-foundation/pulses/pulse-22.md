# Pulse 22: Washington Auto Parts Footprint

## Goal

Add the first post-home-improvement category by extracting Washington auto-parts
chains and comparing them against Seattle/Puget Sound home-improvement
geography.

## Changes

- Added Washington Overture auto-parts raw and reviewed fixtures.
- Added packet-ready, postal, county, and metro Washington auto-parts exports.
- Added auto-parts-specific Washington ZCTA-county and county-CBSA context
  fixtures.
- Added Seattle and Bremerton auto-parts drilldown reports.
- Added a Puget Sound auto-parts comparison report.
- Added extraction and review notes for the auto-parts source pass.

## Readout

Washington packet-ready rows:

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 27 |
| AutoZone | 106 |
| NAPA Auto Parts | 190 |
| O'Reilly Auto Parts | 184 |
| Total | 507 |

Seattle-Tacoma-Bellevue CBSA:

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 15 |
| AutoZone | 50 |
| NAPA Auto Parts | 43 |
| O'Reilly Auto Parts | 89 |
| Total | 197 |

Bremerton-Silverdale-Port Orchard CBSA:

| Brand | Stores |
|---|---:|
| AutoZone | 3 |
| NAPA Auto Parts | 9 |
| O'Reilly Auto Parts | 5 |
| Total | 17 |

## Learning

Auto parts is the right next layer. It reaches 507 packet-ready rows, 230
ZCTA candidates, and 39 counties in Washington, compared with 92 packet-ready
rows, 64 ZCTA candidates, and 22 counties for home improvement.

Kingston is the key Puget Sound example: no direct Home Depot/Lowe's row appears
there, but the auto-parts fixture has two NAPA rows.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-auto-parts-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 42660 fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 14740 fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
git diff --check
```
