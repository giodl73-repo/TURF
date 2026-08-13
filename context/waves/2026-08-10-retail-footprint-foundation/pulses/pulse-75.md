# Pulse 75: Park Civic Anchor Layer

## Goal

Fill the final source-gated civic anchor before scaling the anchor-field context
model to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `park` support.
- Added reviewed OSM named park/open-space rows for the six Puget Sound anchor
  fields.
- Added `queries/ret-washington-anchor-field-park-summary.sql`.
- Wired park rows into Anchor Field Context v0.
- Regenerated context dimension, park, and Washington anchor-field context
  reports.
- Updated README, OSM source policy, wave state, and role review.

## Learning

Parks are present in all six fields, so public open space behaves differently
from the harder civic facility anchors:

- Bellevue core and Kitsap Mall / Silverdale have all checked civic dimensions
  plus pharmacy.
- Southcenter / Tukwila has all checked civic dimensions but no checked
  pharmacy row.
- South Hill / Puyallup has park, transit, and pharmacy, but lacks library and
  civic post office.
- Factoria has parks plus a civic post-office point, but lacks library, transit,
  and pharmacy.
- Tacoma Mall is no longer empty once parks are counted, but it still lacks the
  checked postal, library, transit, and pharmacy anchors.

This completes the first civic-anchor pass. The remaining source gates are
everyday-service dimensions: bank/credit union, gas/convenience, gym,
laundromat, dollar store, and hardware.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type park --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-park-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
duckdb -c ".read queries/ret-washington-anchor-field-park-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
