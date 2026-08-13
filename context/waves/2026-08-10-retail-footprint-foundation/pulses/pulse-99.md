# Pulse 99: Chicago Post-Office Layer

## Goal

Start the Chicago 11-dimension context pass with the post-office civic layer.

## Work

- Attempted bounded OSM/Overpass post-office fetches for all seven Chicago
  anchor fields.
- Promoted the successful Oakbrook widened response.
- Added a six-field source-gate fixture for timeout fields.
- Added `queries/ret-chicago-anchor-field-post-office-summary.sql`.
- Generated `reports/ret-chicago-anchor-field-post-office-summary.csv`.
- Added `reports/ret-chicago-anchor-field-post-office-summary.md`.
- Updated README, wave state, and role review.

## Learning

Oakbrook widened has one checked post-office row: Oak Brook Post Office. The
same response included The UPS Store, which is excluded as a private shipping
counter.

The other six Chicago fields are source-gated from Overpass target timeouts.
This is a weak first extraction result, but it is still useful: Chicago starts
with an explicit source-quality warning rather than hidden false absence.

## Validation

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-post-office-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
