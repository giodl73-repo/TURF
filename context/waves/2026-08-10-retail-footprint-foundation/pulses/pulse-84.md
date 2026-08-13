# Pulse 84: Atlanta Post-Office Civic Layer

## Goal

Start the Atlanta context backfill with the civic layer that best matches the
USPS-as-original-TURF theory: post offices inside bounded retail fields.

## Work

- Fetched target-by-target OSM/Overpass post-office rows for Atlanta fields.
- Added
  `fixtures/civic/osm-post-office-atlanta-anchor-fields-review-2026-08-13.csv`.
- Added
  `fixtures/civic/osm-post-office-atlanta-anchor-fields-source-gates-2026-08-13.csv`.
- Tightened post-office review rules to exclude UPS Customer Center, Mail Boxes
  Etc., and PostalAnnex private-counter rows in addition to UPS Store and FedEx.
- Added `queries/ret-atlanta-anchor-field-post-office-summary.sql`.
- Added `reports/ret-atlanta-anchor-field-post-office-summary.md`.
- Updated README, source policy, wave state, and role review.

## Learning

The fetched Atlanta layer shows post offices inside five of seven target fields:

- Cumberland / Vinings: 3 post-office rows and 4 excluded private counters.
- Buckhead / Lenox / Phipps: 3 post-office rows and 1 excluded private counter.
- Perimeter widened: 4 post-office rows and no private counters.
- North Point / Alpharetta widened: 1 post-office row and 3 excluded private
  counters.
- Decatur / Emory: 2 post-office rows and 3 excluded private counters.

Camp Creek and Northlake remain source-gated because both full-fixture and
target-only Overpass attempts timed out. They are not counted as post-office
absences.

The first Atlanta signal supports the theory that postal civic points are
foundational, but it also sharpens the source boundary: OSM post-office tagging
mixes USPS-style civic anchors with private shipping storefronts unless review
rules separate them.

## Validation

```powershell
python scripts\fetch_osm_post_offices.py --target-id cumberland-vinings --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-post-office-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --retries 2 --request-timeout-seconds 30 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_post_offices.py --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-post-office-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --review-existing
duckdb -c ".read queries/ret-atlanta-anchor-field-post-office-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```

The `--review-existing` command was applied to each successful temporary
target file before the promoted audit fixture was merged.
