# Pulse 78: Gas/Convenience Car-Trip Layer

## Goal

Add a car-trip and quick-errand everyday-service layer before scaling the
anchor-field context contract to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `gas_convenience` support using
  OSM fuel amenities and convenience-shop features.
- Added `--target-id` so dense Overpass layers can be fetched one field at a
  time when batch queries hit timeout or rate-limit pressure.
- Generated
  `fixtures/civic/osm-gas-convenience-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-gas-convenience-summary.sql`.
- Promoted gas/convenience in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Gas/convenience behaves differently from finance:

- Bellevue core: 3 rows.
- Factoria: 6 rows.
- Southcenter / Tukwila: 10 rows.
- Tacoma Mall: 9 rows.
- Kitsap Mall / Silverdale: 10 rows.
- South Hill / Puyallup: 14 rows.

Bellevue core is finance-dense but gas/convenience-light inside the tight
downtown field. South Hill / Puyallup, Southcenter / Tukwila, Kitsap Mall /
Silverdale, and Tacoma Mall carry stronger car-trip service texture. That gives
TURF a better distinction between downtown multi-errand fields and
auto-oriented mall/suburban service fields.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type gas_convenience --target-id bellevue-core --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-gas-bellevue.csv --source-date 2026-08-13 --retries 2
duckdb -c ".read queries/ret-washington-anchor-field-gas-convenience-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
