# Pulse 39: Georgia Auto Parts Backfill

## Goal

Fill the Georgia auto-parts source gate so Atlanta can be compared to Seattle
across home improvement, QSR, and auto parts.

## Changes

- Added `queries/overture-auto-parts-georgia-2026-07-22.sql`.
- Added raw and reviewed Georgia auto-parts fixtures.
- Added Georgia auto-parts ZCTA/county and county/CBSA context fixtures.
- Added Georgia and Atlanta auto-parts summary reports.
- Refreshed RET Profile v0 metro and place capacity outputs.

## Output

Georgia has 734 packet-ready auto-parts rows:

- Advance Auto Parts: 246
- AutoZone: 222
- NAPA Auto Parts: 17
- O'Reilly Auto Parts: 249

Atlanta-Sandy Springs-Roswell has 363 packet-ready auto-parts rows:

- Advance Auto Parts: 122
- AutoZone: 124
- NAPA Auto Parts: 12
- O'Reilly Auto Parts: 105

## Learning

Atlanta is now a complete multi-category daily-life grid in the current RET
profile: home improvement, QSR, and auto parts are all observed. AutoZone leads
Atlanta auto parts by only two rows over Advance Auto Parts, with O'Reilly also
large. That is capacity and service density before it is any stronger rivalry
claim.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-auto-parts-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-auto-parts-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-auto-parts-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-auto-parts-county-cbsa-2023.csv
duckdb -c ".read queries/ret-profile-v0-metro-comparison.sql"
duckdb -c ".read queries/ret-profile-v0-place-capacity-matrix.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
