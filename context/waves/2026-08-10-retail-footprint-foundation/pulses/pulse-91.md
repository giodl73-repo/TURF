# Pulse 91: Atlanta Context Summary

## Goal

Summarize the Atlanta context dimensions acquired so far before adding more
everyday anchors.

## Work

- Added `queries/ret-atlanta-anchor-field-context-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-context-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-context-summary.md`.
- Updated README, wave state, and role review.

## Learning

The six-dimension Atlanta context summary separates the current target fields:

- Cumberland / Vinings: `finance_dense_service_field`.
- Buckhead / Lenox / Phipps: `civic_open_space_mall_field`.
- Perimeter widened: `transit_edge_city_field`.
- Camp Creek: `fully_source_gated_context_field`.
- Northlake: `fully_source_gated_context_field`.
- North Point / Alpharetta widened: `open_space_edge_city_field`.
- Decatur / Emory: `finance_and_car_trip_service_village`.

This is the clearest evidence so far for typed Atlanta fields. Decatur / Emory
changed the most: civic-only evidence made it look postal-only, but everyday
anchors reveal dense finance and gas/convenience texture.

Source gates remain high, so this is a mid-pass learning read rather than a
final atlas.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
