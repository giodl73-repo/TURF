# Pulse 116: Dallas Type-Discovery Profile

## Goal

Synthesize Dallas/Fort Worth field types and add them to the cross-metro
type-discovery profile before scaling to another urban area.

## Changes

- Added `reports/ret-dallas-type-discovery-synthesis.md`.
- Extended `queries/ret-cross-metro-type-discovery-profile.sql` with Dallas /
  Fort Worth rows.
- Regenerated `reports/ret-cross-metro-type-discovery-profile.csv`.
- Updated `reports/ret-cross-metro-type-discovery-profile.md`.
- Extended the type-discovery profile validator for Dallas/Fort Worth and the
  five-layer stack basis.
- Updated README, wave state, and role review.

## Findings

Dallas/Fort Worth adds seven type-discovery-comparable rows and one partial row
to the cross-metro profile. Downtown/Uptown, NorthPark/Preston Hollow,
Galleria/Addison, Legacy/Frisco/Plano, Arlington/Grand Prairie, Southlake, and
Fort Worth/West 7th are comparable for type discovery. Las Colinas/Irving stays
partial because USPS is source-gated and mass retail is checked absent in the
selected field.

## Validation

```powershell
duckdb -c ".read queries/ret-cross-metro-type-discovery-profile.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. TURF now has Washington, Atlanta, Chicago, and Dallas/Fort Worth in
the type-discovery profile.
