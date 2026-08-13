# Pulse 85: Atlanta Library Civic Layer

## Goal

Add the second Atlanta civic-context layer after post offices: libraries inside
the bounded Atlanta retail fields.

## Work

- Fetched target-by-target OSM/Overpass library rows for Atlanta fields.
- Added
  `fixtures/civic/osm-library-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-library-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Added `queries/ret-atlanta-anchor-field-library-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-library-summary.md`.
- Updated README, wave state, and role review.

## Learning

Only Buckhead / Lenox / Phipps returned a checked library row in this pulse:
Buckhead Library. That stacks with the same field's post-office signal and
makes Buckhead the first Atlanta field with two checked civic dimensions.

The other six fields remain source-gated because target-only Overpass attempts
timed out. This layer is therefore not yet comparable across Atlanta fields.
The useful learning is partly analytical and partly operational: civic-source
acquisition for Atlanta is less stable than the Washington pass, so summaries
must keep `source_gated` separate from `checked_absent`.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type library --target-id buckhead-lenox-phipps --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-library-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 2 --request-timeout-seconds 30 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-atlanta-anchor-field-library-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
