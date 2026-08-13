# Pulse 92: Atlanta Pharmacy Layer

## Goal

Add pharmacy as a health-errand everyday-anchor layer for Atlanta and refresh
the combined Atlanta context summary.

## Work

- Added `queries/ret-atlanta-anchor-field-pharmacy-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-pharmacy-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-pharmacy-summary.md`.
- Updated `queries/ret-atlanta-anchor-field-context-summary.sql` to seven
  dimensions.
- Regenerated `reports/ret-atlanta-anchor-field-context-summary.csv`.
- Updated README, wave state, and role review.

## Learning

Pharmacy appears in five fields:

- Buckhead / Lenox / Phipps: 1 row.
- Perimeter widened: 2 rows.
- Northlake: 1 row.
- North Point / Alpharetta widened: 1 row.
- Decatur / Emory: 1 row.

Cumberland / Vinings and Camp Creek are checked absent inside the current
bounded fields.

The seven-dimension summary now reads:

- Cumberland / Vinings: `finance_dense_service_field`.
- Buckhead / Lenox / Phipps: `civic_open_space_mall_field`.
- Perimeter widened: `transit_health_edge_city_field`.
- Camp Creek: `fully_source_gated_context_field`.
- Northlake: `health_only_partial_context_field`.
- North Point / Alpharetta widened: `open_space_health_edge_city_field`.
- Decatur / Emory: `finance_car_trip_health_service_village`.

Pharmacy is a useful low-noise layer because it comes from an already reviewed
Georgia store layer. It changes archetypes without adding a new source-gate
problem.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-pharmacy-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
