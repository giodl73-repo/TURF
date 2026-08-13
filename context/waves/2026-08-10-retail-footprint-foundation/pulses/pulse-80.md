# Pulse 80: Dollar-Store Value-Errand Layer

## Goal

Add a value-errand everyday-service layer before scaling the anchor-field
context contract to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `dollar_store` support using named
  OSM variety-store features.
- Limited packet-ready dollar-store rows to Dollar Tree, Dollar General, and
  Family Dollar name/operator matches.
- Generated
  `fixtures/civic/osm-dollar-store-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-dollar-store-summary.sql`.
- Promoted dollar store in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Dollar-store presence is sparse and brand-specific:

- Bellevue core: 0 packet-ready rows; one excluded non-target variety-store row.
- Factoria: 0 rows.
- Southcenter / Tukwila: 1 Dollar Tree row.
- Tacoma Mall: 1 Dollar Tree row.
- Kitsap Mall / Silverdale: 1 Dollar Tree row.
- South Hill / Puyallup: 1 Dollar Tree row.

The value-errand signal aligns with the more auto-oriented mall and suburban
fields rather than the tight Bellevue downtown field.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-dollar-store-tacoma-mall.csv --source-date 2026-08-13 --retries 3
duckdb -c ".read queries/ret-washington-anchor-field-dollar-store-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
