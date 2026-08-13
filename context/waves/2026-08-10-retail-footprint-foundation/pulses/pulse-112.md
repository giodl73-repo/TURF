# Pulse 112: Texas Mass-Retail Layer

## Goal

Add Target / Walmart / Costco / Sam's Club signal to the Dallas/Fort Worth
pre-scale stack.

## Changes

- Added Texas mass-retail Overture extraction query.
- Added conservative Texas mass-retail review query.
- Added raw and reviewed Texas mass-retail fixtures.
- Added Dallas/Fort Worth anchor-field mass-retail summary query and report.
- Recorded README, wave, and role-review references.

## Findings

Dallas/Fort Worth mass-retail signal is more selective than grocery:

- Galleria / Addison is the only multi-brand big-box anchor field.
- Downtown / Uptown Dallas, NorthPark / Preston Hollow, Legacy / Frisco /
  Plano, Arlington / Grand Prairie, and Fort Worth Cultural / West 7th each
  have a single-brand mass-retail anchor.
- Las Colinas / Irving and Southlake Town Square are checked absent for this
  layer inside the bounded boxes.

The review layer also caught brand/name mismatches, including a Walmart-branded
raw row named Scott's Discount Liquor. Those rows are excluded before field
scoring.

## Validation

```powershell
duckdb -c ".read queries/overture-mass-retail-texas-2026-07-22.sql"
duckdb -c ".read queries/overture-mass-retail-texas-review-2026-07-22.sql"
duckdb -c ".read queries/ret-dallas-anchor-field-mass-retail-summary.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-texas-review-2026-07-22.csv
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. Dallas/Fort Worth now has postal, grocery, and mass-retail layers.
