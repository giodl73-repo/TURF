# Pulse 86: Atlanta Park Civic Layer

## Goal

Add the third Atlanta civic-context layer: named parks and open spaces inside
the bounded Atlanta retail fields.

## Work

- Fetched target-by-target OSM/Overpass park rows for Atlanta fields.
- Added
  `fixtures/civic/osm-park-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-park-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Added `queries/ret-atlanta-anchor-field-park-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-park-summary.md`.
- Updated README, wave state, and role review.

## Learning

Parks returned dense signal in the two observed fields:

- Buckhead / Lenox / Phipps: 14 checked named open-space rows.
- North Point / Alpharetta widened: 16 checked named open-space rows.

Cumberland / Vinings, Perimeter widened, Camp Creek, Northlake, and Decatur /
Emory remain source-gated because target-only Overpass attempts timed out. They
are not park absences.

Buckhead is now the strongest Atlanta civic stack: post offices, Buckhead
Library, and dense open-space signal inside the same luxury urban mall field.
North Point adds a different pattern: edge-city postal plus dense open-space
signal, but its library layer is still source-gated.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type park --target-id buckhead-lenox-phipps --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-park-atlanta-buckhead-lenox-phipps.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-atlanta-anchor-field-park-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
