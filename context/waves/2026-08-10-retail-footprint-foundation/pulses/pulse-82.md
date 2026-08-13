# Pulse 82: Gym Wellness-Service Layer

## Goal

Add the final source-gated everyday-service layer so the Washington anchor-field
context contract is complete before scaling to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `gym` support using named OSM
  fitness-centre features.
- Generated
  `fixtures/civic/osm-gym-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-gym-summary.sql`.
- Promoted gym in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Gym presence is the strongest single-field contrast in the completed pass:

- Bellevue core: 15 checked rows.
- Factoria: 0 rows.
- Southcenter / Tukwila: 0 rows.
- Tacoma Mall: 0 rows.
- Kitsap Mall / Silverdale: 0 rows.
- South Hill / Puyallup: 0 rows.

Bellevue core is not merely finance-dense. It is a civic-plus-finance-plus-
wellness downtown field that lacks checked hardware, dollar-store, and
laundromat signals. That is a different everyday enclave from the mall and
suburban fields.

The pre-scale Washington anchor-field context contract now has no remaining
source-gated dimensions.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type gym --target-id bellevue-core --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-gym-bellevue-core.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-washington-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
