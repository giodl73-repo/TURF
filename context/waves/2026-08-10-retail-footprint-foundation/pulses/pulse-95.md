# Pulse 95: Atlanta Laundromat Layer

## Goal

Add laundromat as a household-service everyday-anchor layer for Atlanta and
refresh the combined Atlanta context summary.

## Work

- Attempted bounded OSM/Overpass laundromat fetches for all seven Atlanta
  anchor fields.
- Promoted two Cumberland / Vinings packet-ready laundromat rows.
- Treated Perimeter widened and North Point / Alpharetta widened as checked
  absent after clean empty target responses.
- Added a four-field source-gate fixture for timeout fields.
- Added `queries/ret-atlanta-anchor-field-laundromat-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-laundromat-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-laundromat-summary.md`.
- Updated the combined Atlanta context summary to ten dimensions.
- Updated README, wave state, and role review.

## Learning

Cumberland / Vinings has two checked laundromat rows:

- Spring Road Laundry.
- Tiny Bubbles Coin Laundry.

That shifts Cumberland from a finance-dense mall/office edge to a
finance-plus-household-service field. Perimeter widened and North Point /
Alpharetta widened are checked absent for laundromats in this pass, while
Buckhead, Camp Creek, Northlake, and Decatur remain source-gated.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-laundromat-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
