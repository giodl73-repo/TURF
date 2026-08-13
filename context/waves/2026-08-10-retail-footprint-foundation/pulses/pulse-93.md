# Pulse 93: Atlanta Dollar-Store Source Gate

## Goal

Test dollar-store value-errand texture across the seven Atlanta anchor fields
and refresh the combined Atlanta context summary.

## Work

- Attempted bounded OSM/Overpass dollar-store fetches for all seven Atlanta
  anchor fields.
- Added an empty reviewed Atlanta dollar-store fixture with the standard civic
  review headers.
- Added a seven-field source-gate fixture for the Overpass timeouts.
- Added `queries/ret-atlanta-anchor-field-dollar-store-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-dollar-store-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-dollar-store-summary.md`.
- Updated the combined Atlanta context summary to eight dimensions.
- Updated README, wave state, and role review.

## Learning

The current OSM/Overpass value-retail path is fully source-gated for Atlanta.
That is not a value-store absence claim. It means TURF cannot yet compare
Atlanta value-errand texture against Washington's checked dollar-store signal.

The eight-dimension Atlanta summary remains useful because source gates stay
visible:

- Cumberland / Vinings: `finance_dense_service_field`.
- Buckhead / Lenox / Phipps: `civic_open_space_mall_field`.
- Perimeter widened: `transit_health_edge_city_field`.
- Camp Creek: `fully_source_gated_context_field`.
- Northlake: `health_only_partial_context_field`.
- North Point / Alpharetta widened: `open_space_health_edge_city_field`.
- Decatur / Emory: `finance_car_trip_health_service_village`.

The practical pre-scale goal is clearer now: Atlanta needs the remaining
Washington contract layers, but also a source strategy for high-timeout OSM
layers before TURF treats Atlanta as equally resolved.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-dollar-store-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
