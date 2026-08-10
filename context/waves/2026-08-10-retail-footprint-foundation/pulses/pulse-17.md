# Pulse 17: Georgia Metro Context Read

## Goal

Use Census July 2023 metropolitan and micropolitan delineation data to add
metro context to Georgia packet-ready Home Depot/Lowe's rows.

## Source

- Census delineation files page:
  https://www.census.gov/geographies/reference-files/time-series/demo/metro-micro/delineation-files.html
- Census July 2023 CBSA workbook:
  https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2023/delineation-files/list1_2023.xlsx

## Changes

- Added `fixtures/geography/georgia-county-cbsa-2023.csv`.
- Added `fixtures/brands/home-improvement-georgia-packet-ready-metro.csv`.
- Added county-CBSA parsing, validation, metro enrichment, and metro summary
  helpers.
- Added `validate-county-cbsa`, `export-packet-ready-metro`, and
  `summarize-metro-review` to `turf-cli`.
- Updated `reports/home-improvement-georgia.md` with metro/micro tables.

## Readout

- Packet-ready stores: 132.
- Metro/micro/non-CBSA groups: 32.
- Dominant metro/micro/non-CBSA groups: 25.
- Contested metro/micro/non-CBSA groups: 7.
- Home Depot leads 23 metro/micro/non-CBSA groups.
- Lowe's leads 9 metro/micro/non-CBSA groups.
- Atlanta-Sandy Springs-Roswell GA has 79 stores: 59 Home Depot and 20 Lowe's.

## Caveat

CBSA context is statistical geography. It is not a company operating district,
franchise territory, or drive-time catchment.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- export-packet-ready-metro fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
git diff --check
```
