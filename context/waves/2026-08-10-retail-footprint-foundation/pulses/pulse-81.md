# Pulse 81: Laundromat Household-Service Layer

## Goal

Add a household-service everyday layer before scaling the anchor-field context
contract to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `laundromat` support using named
  OSM laundry-shop features.
- Added configurable Overpass request timeouts and `URLError` retry handling for
  endpoint stalls.
- Generated
  `fixtures/civic/osm-laundromat-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-laundromat-summary.sql`.
- Promoted laundromat in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Laundromat presence is highly selective:

- Bellevue core: 0 rows.
- Factoria: 0 rows.
- Southcenter / Tukwila: 0 rows.
- Tacoma Mall: 1 row, 38th Street Laundromat.
- Kitsap Mall / Silverdale: 0 rows.
- South Hill / Puyallup: 1 row, Puyallup South Hill Laundry.

This gives TURF a household-service signal that differs from car-trip,
small-trade, value-store, and finance errands. Tacoma Mall and South Hill /
Puyallup now carry household-service texture that Bellevue, Factoria,
Southcenter, and Kitsap do not show inside the current bounded fields.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type laundromat --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-laundromat-tacoma-mall.csv --source-date 2026-08-13 --retries 3 --request-timeout-seconds 30
duckdb -c ".read queries/ret-washington-anchor-field-laundromat-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
