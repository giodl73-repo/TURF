# Pulse 16: Georgia County Context Read

## Goal

Use Census ZCTA-to-county relationship data to add the first county context to
Georgia packet-ready Home Depot/Lowe's rows.

## Source

- Census 2020 ZCTA relationship record layouts:
  https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2020-zcta-record-layout.html
- Census 2020 ZCTA5 to County relationship file:
  https://www2.census.gov/geo/docs/maps-data/data/rel2020/zcta520/tab20_zcta520_county20_natl.txt

## Changes

- Added `fixtures/geography/georgia-zcta-county-primary-2020.csv`.
- Added `fixtures/brands/home-improvement-georgia-packet-ready-county.csv`.
- Added ZCTA-county parsing, validation, county enrichment, and county summary
  helpers.
- Added `validate-zcta-county`, `export-packet-ready-county`, and
  `summarize-county-review` to `turf-cli`.
- Updated `reports/home-improvement-georgia.md` with county tables.

## Readout

- Packet-ready stores: 132.
- Primary county groups: 59.
- Dominant primary county groups: 48.
- Contested primary county groups: 11.
- Home Depot leads 48 primary county groups.
- Lowe's leads 11 primary county groups.

## Caveat

The county context uses the county with the largest ZCTA land overlap from the
Census relationship file. It is not a rooftop point-in-county geocode.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-county-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- export-packet-ready-county fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
git diff --check
```
