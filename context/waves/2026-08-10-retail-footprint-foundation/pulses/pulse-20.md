# Pulse 20: Seattle Puget Sound Ferry Read

## Goal

Extend the Home Depot/Lowe's acquisition pipeline to Washington and test whether
Seattle/Puget Sound needs ferry-aware market geography.

## Changes

- Added Washington Overture candidate and reviewed candidate fixtures.
- Added packet-ready, postal, county, and metro Washington exports.
- Added Washington Census ZCTA-county and county-CBSA context fixtures.
- Added Seattle and Bremerton metro drilldown and ring reports.
- Added Puget Sound ferry context for Bainbridge Island, Kingston, and
  Bremerton.
- Added a Seattle/Puget Sound report and Washington extraction/review notes.

## Readout

Washington packet-ready rows:

| Brand | Stores |
|---|---:|
| Home Depot | 57 |
| Lowe's | 35 |
| Total | 92 |

Seattle-Tacoma-Bellevue CBSA:

| Brand | Stores |
|---|---:|
| Home Depot | 26 |
| Lowe's | 16 |
| Total | 42 |

Bremerton-Silverdale-Port Orchard CBSA:

| Brand | Stores |
|---|---:|
| Home Depot | 2 |
| Lowe's | 2 |
| Total | 4 |

## Ferry Finding

Bainbridge Island and Kingston have no direct packet-ready Home Depot or Lowe's
rows in this fixture. Bremerton's Census metro is separate from Seattle and is
contested through the Kitsap anchors of Poulsbo, Silverdale, and Port Orchard.

This makes Puget Sound a useful test case for TURF: CBSA and straight-line rings
are not enough where ferry routes define practical access.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\washington-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 42660 fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 14740 fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- ring-metro-review 42660 47.6062 -122.3321 fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- ring-metro-review 14740 47.5650 -122.6270 fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
git diff --check
```
