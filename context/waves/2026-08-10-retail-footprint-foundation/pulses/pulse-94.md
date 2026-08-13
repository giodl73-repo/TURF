# Pulse 94: Atlanta Hardware Layer

## Goal

Add hardware as a small-trade everyday-anchor layer for Atlanta and refresh the
combined Atlanta context summary.

## Work

- Attempted bounded OSM/Overpass hardware fetches for all seven Atlanta anchor
  fields.
- Promoted the successful Buckhead / Lenox / Phipps hardware row.
- Added a six-field source-gate fixture for timeout fields.
- Added `queries/ret-atlanta-anchor-field-hardware-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-hardware-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-hardware-summary.md`.
- Updated the combined Atlanta context summary to nine dimensions.
- Updated README, wave state, and role review.

## Learning

Buckhead / Lenox / Phipps has one checked hardware / small-trade row:
Northside Tool Rental. The other six fields are source-gated from bounded
Overpass target timeouts.

The nine-dimension Atlanta summary now reads:

- Cumberland / Vinings: `finance_dense_service_field`.
- Buckhead / Lenox / Phipps: `civic_open_space_small_trade_mall_field`.
- Perimeter widened: `transit_health_edge_city_field`.
- Camp Creek: `fully_source_gated_context_field`.
- Northlake: `health_only_partial_context_field`.
- North Point / Alpharetta widened: `open_space_health_edge_city_field`.
- Decatur / Emory: `finance_car_trip_health_service_village`.

This is real movement toward the Washington contract, but Atlanta remains less
resolved than Washington because high-timeout OSM layers are accumulating.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-hardware-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
