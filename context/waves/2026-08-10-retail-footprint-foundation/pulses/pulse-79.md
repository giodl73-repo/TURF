# Pulse 79: Hardware Small-Trade Layer

## Goal

Add a small-trade and repair-errand everyday-service layer before scaling the
anchor-field context contract to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `hardware` support using named OSM
  hardware-shop features.
- Tightened hardware extraction to named node/way features to avoid broad
  relation queries that timed out against Overpass.
- Generated
  `fixtures/civic/osm-hardware-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-hardware-summary.sql`.
- Promoted hardware in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Hardware is sparse and selective:

- Bellevue core: 0 rows.
- Factoria: 0 rows.
- Southcenter / Tukwila: 3 rows.
- Tacoma Mall: 3 rows.
- Kitsap Mall / Silverdale: 1 row.
- South Hill / Puyallup: 1 row.

The signal separates downtown/finance-oriented fields from mall and suburban
fields with more repair, home, or small-trade texture. Southcenter and Tacoma
now show the clearest small-trade edge among the six checked fields.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type hardware --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-hardware-tacoma-mall.csv --source-date 2026-08-13 --retries 3
duckdb -c ".read queries/ret-washington-anchor-field-hardware-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
