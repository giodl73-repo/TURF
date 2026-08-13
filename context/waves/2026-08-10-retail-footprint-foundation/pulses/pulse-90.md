# Pulse 90: Atlanta Gas / Convenience Layer

## Goal

Add the second Atlanta everyday-anchor layer: gas / convenience rows for
car-trip and quick-errand texture.

## Work

- Fetched target-by-target OSM/Overpass gas / convenience rows for Atlanta
  fields.
- Added
  `fixtures/civic/osm-gas-convenience-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-gas-convenience-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Added `queries/ret-atlanta-anchor-field-gas-convenience-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-gas-convenience-summary.md`.
- Updated README, wave state, and role review.

## Learning

Decatur / Emory returned 10 raw rows:

- 8 checked gas / convenience rows.
- 2 excluded unnamed trip-anchor rows.

Cumberland / Vinings, Buckhead / Lenox / Phipps, Perimeter widened, Camp Creek,
Northlake, and North Point / Alpharetta widened remain source-gated because
target-only Overpass attempts timed out. They are not gas/convenience absences.

Decatur / Emory now has both dense finance and dense car-trip / quick-errand
texture. That changes the enclave read from `postal_only_civic_field` to a
routine-service rich inner village once everyday anchors are included.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type gas_convenience --target-id decatur-emory --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-gas-convenience-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-atlanta-anchor-field-gas-convenience-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
