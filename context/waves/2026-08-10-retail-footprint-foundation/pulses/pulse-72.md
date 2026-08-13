# Pulse 72: Post Office Civic Anchor Gate

## Goal

Try to fill the first source-gated civic anchor before scaling the anchor-field
context model to more urban areas.

## Work

- Added `queries/overture-post-office-washington-anchor-fields-2026-07-22.sql`.
- Attempted the target-bounded Overture post-office extraction.
- Documented the timeout and source boundary in
  `docs/research/overture-post-office-washington-anchor-fields-extraction-2026-07-22.md`.
- Added OSM/Overpass civic source policy and fetch script.
- Added a reviewed OSM post-office civic fixture for the six Puget Sound anchor
  fields.
- Added post-office summary output and wired packet-ready civic rows into
  Anchor Field Context v0.
- Updated README, wave state, and role review.

## Learning

Post offices remain the best first civic-anchor test: they connect directly to
postal identity, ZCTA/ZIP thinking, and everyday administrative geography.

The attempted remote Overture query timed out after 4 minutes and produced only
a zero-byte placeholder, so no Overture rows were retained.

OSM/Overpass filled the civic layer quickly. The reviewed fixture found
packet-ready post-office rows in Bellevue core, Factoria, Southcenter/Tukwila,
and Kitsap Mall/Silverdale. Tacoma Mall and South Hill/Puyallup only showed
private shipping counters inside the current boxes, so no civic post-office row
is counted there.

This is real signal: some mall/service fields overlap postal civic anchors, and
some appear more purely commercial under the current geometry.

## Validation

```powershell
duckdb -c ".read queries/overture-post-office-washington-anchor-fields-2026-07-22.sql"
python scripts\fetch_osm_post_offices.py --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13
duckdb -c ".read queries/ret-washington-anchor-field-post-office-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
