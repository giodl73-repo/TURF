# Pulse 114: Texas Retail-Complex Layer

## Goal

Add target-limited retail-complex confirmation to the Dallas/Fort Worth
pre-scale stack.

## Changes

- Added Texas retail-complex Overture extraction query.
- Added target-limited Texas retail-complex review query.
- Added raw and reviewed Texas retail-complex fixtures.
- Added Dallas/Fort Worth retail-complex summary query and report.
- Recorded README, wave, and role-review references.

## Findings

All eight Dallas/Fort Worth target fields have confirmed retail-complex signal
inside the current reviewed layer:

- Downtown / Uptown Dallas: West Village.
- NorthPark / Preston Hollow: NorthPark Center and The Plaza At Preston Center.
- Galleria / Addison: Addison Walk Shopping Center.
- Legacy / Frisco / Plano: Legacy West Shopping Center and Stonebriar Mall.
- Las Colinas / Irving: Las Colinas Urban Center.
- Arlington / Grand Prairie: Lincoln Square Shopping Center.
- Southlake Town Square: Park Village.
- Fort Worth Cultural / West 7th: Montgomery Plaza and West 7th Plaza.

Legacy / Frisco / Plano is the only confirmed mall-complex field in this pass.

## Validation

```powershell
duckdb -c ".read queries/overture-retail-complex-texas-2026-07-22.sql"
duckdb -c ".read queries/overture-retail-complex-texas-review-2026-07-22.sql"
duckdb -c ".read queries/ret-dallas-anchor-field-retail-complex-summary.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-texas-review-2026-07-22.csv
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. Dallas/Fort Worth now has five pre-scale stack layers.
