# Pulse 74: Transit Center Civic Anchor Layer

## Goal

Add a mobility-anchor signal before scaling the anchor-field context model to
more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `transit_center` support.
- Added reviewed OSM transit-center rows for the six Puget Sound anchor fields.
- Added `queries/ret-washington-anchor-field-transit-summary.sql`.
- Wired transit-center rows into Anchor Field Context v0.
- Regenerated context dimension, transit, and Washington anchor-field context
  reports.
- Updated README, OSM source policy, wave state, and role review.

## Learning

Transit centers add a mobility split:

- Bellevue core has the strongest mobility signal with Bellevue Downtown,
  Bellevue Transit Center, and East Main.
- Southcenter / Tukwila has Tukwila station plus library and post office, but no
  checked pharmacy.
- Kitsap Mall / Silverdale now has all four checked context anchors: library,
  post office, transit center, and pharmacy.
- South Hill / Puyallup has transit centers and pharmacy, but no library or
  civic post office in the current box.
- Factoria remains postal-only.
- Tacoma Mall remains empty across all checked context anchors.

This shows TURF can distinguish civic-plus-everyday, civic-mobility,
mobility-commercial, postal-only, pharmacy-only, and empty checked-context
fields before adding more urban areas.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type transit_center --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-transit-center-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
duckdb -c ".read queries/ret-washington-anchor-field-transit-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
