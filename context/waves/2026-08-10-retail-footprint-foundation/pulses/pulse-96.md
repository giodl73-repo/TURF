# Pulse 96: Atlanta Gym Layer

## Goal

Add gym as a wellness-service everyday-anchor layer for Atlanta and complete
the 11-dimension Atlanta context pass.

## Work

- Attempted bounded OSM/Overpass gym fetches for all seven Atlanta anchor
  fields.
- Promoted observed gym rows for Cumberland / Vinings, Buckhead / Lenox /
  Phipps, Camp Creek, and North Point / Alpharetta widened.
- Added a three-field source-gate fixture for timeout fields.
- Added `queries/ret-atlanta-anchor-field-gym-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-gym-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-gym-summary.md`.
- Updated the combined Atlanta context summary to eleven dimensions.
- Updated README, wave state, and role review.

## Learning

Gym is a strong observed layer:

- Cumberland / Vinings: 6 gym rows.
- Buckhead / Lenox / Phipps: 1 gym row.
- Camp Creek: 1 gym row.
- North Point / Alpharetta widened: 17 gym rows.

The 11-dimension Atlanta summary now reads:

- Cumberland / Vinings: `finance_household_wellness_service_field`.
- Buckhead / Lenox / Phipps: `civic_open_space_small_trade_mall_field`.
- Perimeter widened: `transit_health_edge_city_field`.
- Camp Creek: `wellness_only_partial_context_field`.
- Northlake: `health_only_partial_context_field`.
- North Point / Alpharetta widened:
  `open_space_health_wellness_edge_city_field`.
- Decatur / Emory: `finance_car_trip_health_service_village`.

Atlanta now has all eleven Washington-equivalent dimensions wired into the
contract, but it is not equally resolved. Source gates remain high and should
drive the pre-scale readiness decision.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
