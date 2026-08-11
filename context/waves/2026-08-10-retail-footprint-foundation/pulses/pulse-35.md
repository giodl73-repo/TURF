# Pulse 35: Washington QSR Footprint

## Goal

Run the QSR Overture acquisition gate, create the first reviewed Washington QSR
layer, and compare QSR against the existing Puget Sound place and metro
geography.

## Changes

- Ran `queries/overture-qsr-washington-2026-07-22.sql` with DuckDB `v1.5.5`.
- Added `fixtures/stores/overture-qsr-washington-2026-07-22.csv`.
- Added `fixtures/stores/overture-qsr-washington-review-2026-07-22.csv`.
- Added `fixtures/geography/washington-qsr-zcta-county-primary-2020.csv`.
- Added `docs/research/overture-qsr-washington-review-2026-07-22.md`.
- Updated the QSR extraction doc with actual output counts.
- Added QSR statewide, metro, drilldown, and Puget Sound spacing reports.

## Readout

Washington QSR packet-ready rows:

| Brand | Stores |
|---|---:|
| Burger King | 116 |
| McDonald's | 260 |
| Taco Bell | 144 |
| Wendy's | 86 |
| Total | 606 |

Seattle-Tacoma-Bellevue CBSA (`42660`) has 274 QSR rows. McDonald's leads with
126, followed by Taco Bell with 60, Burger King with 49, and Wendy's with 39.

Bremerton-Silverdale-Port Orchard CBSA (`14740`) has 27 QSR rows. McDonald's
leads with 10, but all four brands are present.

Ferry-side place signal:

| Place | Stores | Brands | Read |
|---|---:|---:|---|
| Bainbridge Island | 1 | 1 | Single-brand McDonald's node. |
| Kingston | 1 | 1 | Single-brand McDonald's node. |
| Bremerton | 9 | 4 | Dense contested QSR grid. |
| Poulsbo | 4 | 4 | Compact four-brand QSR node. |
| Silverdale | 6 | 4 | Four-brand commercial node. |
| Port Orchard | 6 | 4 | Four-brand commercial node. |

## Validation

```powershell
duckdb -c ".read queries/overture-qsr-washington-2026-07-22.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-qsr-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\washington-qsr-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-qsr-washington-review-2026-07-22.csv fixtures\geography\washington-qsr-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- ret-place-spacing-summary qsr fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-qsr-washington-review-2026-07-22.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
