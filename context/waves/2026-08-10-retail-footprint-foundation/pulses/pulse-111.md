# Pulse 111: Texas Grocery Layer

## Goal

Add the first non-Overpass everyday-service layer to the Dallas/Fort Worth
pre-scale stack.

## Changes

- Added Texas Overture grocery extraction query.
- Added a conservative Texas grocery review query.
- Added raw and reviewed Texas grocery fixtures.
- Added Dallas/Fort Worth anchor-field grocery summary query and report.
- Recorded README, wave, and role-review references.

## Findings

All eight Dallas/Fort Worth target fields carry grocery signal:

- Downtown / Uptown Dallas: 4 rows across 3 brands.
- NorthPark / Preston Hollow: 6 rows across 4 brands.
- Galleria / Addison: 2 rows across 2 brands.
- Legacy / Frisco / Plano: 4 rows across 4 brands.
- Las Colinas / Irving: 3 rows across 3 brands.
- Arlington / Grand Prairie: 6 rows across 4 brands.
- Southlake Town Square: 4 rows across 4 brands.
- Fort Worth Cultural / West 7th: 2 rows across 2 brands.

Grocery fills the three fields that source-gated on the post-office layer:
Las Colinas / Irving, Arlington / Grand Prairie, and Fort Worth Cultural /
West 7th.

## Validation

```powershell
duckdb -c ".read queries/overture-grocery-texas-2026-07-22.sql"
duckdb -c ".read queries/overture-grocery-texas-review-2026-07-22.sql"
duckdb -c ".read queries/ret-dallas-anchor-field-grocery-summary.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-texas-review-2026-07-22.csv
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. Dallas/Fort Worth now has postal civic signal plus grocery
everyday-service signal.
