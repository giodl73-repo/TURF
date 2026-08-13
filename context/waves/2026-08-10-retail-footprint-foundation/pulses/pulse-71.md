# Pulse 71: Anchor Field Context v0

## Goal

Start the Civic + Everyday Anchors layer for the six Puget Sound anchor fields
before scaling to more urban areas.

## Work

- Added `fixtures/geography/anchor-field-context-dimensions.csv`.
- Added `queries/ret-anchor-field-context-dimensions.sql`.
- Added `queries/ret-washington-anchor-field-context-v0.sql`.
- Added `queries/ret-washington-anchor-field-context-summary.sql`.
- Generated context dimension and Washington anchor-field context reports.
- Updated README, wave state, and role review.

## Learning

The reusable context shape has 11 dimensions: four civic anchors and seven
everyday anchors. Pharmacy is the first active checked proxy, using the reviewed
Washington drugstore layer. Post offices, libraries, parks, transit centers,
banks, gyms, laundromats, gas/convenience, dollar stores, and hardware stores
remain source-gated.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
