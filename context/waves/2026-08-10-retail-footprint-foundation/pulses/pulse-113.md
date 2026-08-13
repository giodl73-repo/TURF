# Pulse 113: Texas Pharmacy Layer

## Goal

Add exact-brand drugstore signal to the Dallas/Fort Worth pre-scale stack as a
health-errand proxy.

## Changes

- Added Texas Overture drugstore extraction query.
- Added conservative Texas drugstore review query.
- Added raw and reviewed Texas drugstore fixtures.
- Added Dallas/Fort Worth anchor-field pharmacy summary query and report.
- Recorded README, wave, and role-review references.

## Findings

Pharmacy signal appears in seven of eight Dallas/Fort Worth target fields:

- Downtown / Uptown Dallas: 3 rows.
- NorthPark / Preston Hollow: 2 rows.
- Legacy / Frisco / Plano: 4 rows.
- Las Colinas / Irving: 2 rows.
- Arlington / Grand Prairie: 3 rows.
- Southlake Town Square: 1 row.
- Fort Worth Cultural / West 7th: 2 rows.

Galleria / Addison is checked absent for this exact-brand drugstore layer,
despite having grocery and multi-brand mass-retail signal.

## Validation

```powershell
duckdb -c ".read queries/overture-drugstore-texas-2026-07-22.sql"
duckdb -c ".read queries/overture-drugstore-texas-review-2026-07-22.sql"
duckdb -c ".read queries/ret-dallas-anchor-field-pharmacy-summary.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-texas-review-2026-07-22.csv
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. Dallas/Fort Worth now has postal, grocery, mass-retail, and pharmacy
layers.
