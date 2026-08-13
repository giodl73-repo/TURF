# Pulse 89: Atlanta Bank / Credit Union Layer

## Goal

Start Atlanta everyday-anchor backfill with finance errands: bank and
credit-union rows inside the bounded Atlanta retail fields.

## Work

- Fetched target-by-target OSM/Overpass bank / credit-union rows for Atlanta
  fields.
- Added
  `fixtures/civic/osm-bank-credit-union-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-bank-credit-union-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Added `queries/ret-atlanta-anchor-field-bank-credit-union-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-bank-credit-union-summary.md`.
- Updated README, wave state, and role review.

## Learning

Finance returned dense signal in two fields:

- Cumberland / Vinings: 14 checked rows and 11 operator/name groups.
- Decatur / Emory: 12 checked rows and 10 operator/name groups.

Buckhead / Lenox / Phipps, Perimeter widened, Camp Creek, Northlake, and North
Point / Alpharetta widened remain source-gated because target-only Overpass
attempts timed out. They are not finance absences.

This changes the Atlanta read. Cumberland and Decatur looked like postal-only
civic fields in the civic summary because their other civic layers were mostly
source-gated. The finance layer shows both are routine-service dense anyway.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type bank_credit_union --target-id cumberland-vinings --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-bank-credit-union-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-atlanta-anchor-field-bank-credit-union-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
