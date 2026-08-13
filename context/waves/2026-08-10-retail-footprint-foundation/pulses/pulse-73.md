# Pulse 73: Library Civic Anchor Layer

## Goal

Add a second reviewed civic-anchor signal before scaling the anchor-field
context model to more urban areas.

## Work

- Generalized the OSM civic fetcher into `scripts/fetch_osm_civic.py`.
- Kept `scripts/fetch_osm_post_offices.py` as a compatibility wrapper.
- Added reviewed OSM library rows for the six Puget Sound anchor fields.
- Added `queries/ret-washington-anchor-field-library-summary.sql`.
- Wired library rows into Anchor Field Context v0.
- Regenerated context dimension, library, and Washington anchor-field context
  reports.
- Updated README, OSM source policy, wave state, and role review.

## Learning

The library layer reinforces a three-way split:

- Bellevue core and Kitsap Mall / Silverdale have all three checked context
  anchors: library, post office, and pharmacy.
- Southcenter / Tukwila has both civic anchors but no checked pharmacy row,
  suggesting civic/retail overlap without the same everyday pharmacy signal.
- Factoria has post office but no library or pharmacy in the current box.
- Tacoma Mall has none of the checked context anchors.
- South Hill / Puyallup has pharmacy but no library or civic post office in the
  current box.

This makes the enclave profile more interesting before scaling: we are not just
counting stores, we are starting to see civic-service, postal-service, and
commercial-service fields separate.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type library --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-library-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
duckdb -c ".read queries/ret-washington-anchor-field-library-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
