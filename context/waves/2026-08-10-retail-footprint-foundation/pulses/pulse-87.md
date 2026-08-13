# Pulse 87: Atlanta Transit Civic Layer

## Goal

Add the fourth Atlanta civic-context layer: named transit centers and stations
inside the bounded Atlanta retail fields.

## Work

- Fetched target-by-target OSM/Overpass transit-center rows for Atlanta fields.
- Added
  `fixtures/civic/osm-transit-center-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-transit-center-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Added `queries/ret-atlanta-anchor-field-transit-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-transit-summary.md`.
- Updated README, wave state, and role review.

## Learning

Perimeter widened returned four checked MARTA station rows:

- Dunwoody.
- Medical Center.
- North Springs.
- Sandy Springs.

That makes Perimeter the first Atlanta field with a strong observed mobility
layer. Cumberland / Vinings, Buckhead / Lenox / Phipps, Camp Creek, Northlake,
North Point / Alpharetta widened, and Decatur / Emory remain source-gated
because target-only Overpass attempts timed out. They are not transit absences.

Perimeter now looks like a different civic archetype from Buckhead and North
Point. Buckhead stacks postal, library, and parks; North Point stacks postal and
parks; Perimeter stacks postal and rail-station mobility.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type transit_center --target-id perimeter-wide --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-transit-center-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-atlanta-anchor-field-transit-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
