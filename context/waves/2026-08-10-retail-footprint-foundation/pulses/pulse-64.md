# Pulse 64: Washington Anchor-Field Local Candidates

## Goal

Bypass the remote Overture timeout by assigning the existing statewide
Washington retail-complex candidate extract to the bounded anchor fields.

## Work

- Added `queries/ret-washington-anchor-field-candidates-from-statewide.sql`.
- Generated
  `fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv`.
- Added `queries/ret-washington-anchor-field-candidate-summary.sql`.
- Generated `reports/ret-washington-anchor-field-candidate-summary.csv`.
- Added `reports/ret-washington-anchor-field-candidate-summary.md`.
- Updated README, research note, wave state, and role review.

## Learning

The existing statewide candidate extract can seed the targeted review. It
assigns 63 candidate rows across Bellevue, Factoria, Southcenter/Tukwila, Tacoma
Mall, Kitsap Mall/Silverdale, and South Hill/Puyallup.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-anchor-field-candidates-from-statewide.sql"
duckdb -c ".read queries/ret-washington-anchor-field-candidate-summary.sql"
duckdb -c "SELECT count(*) AS rows, count(DISTINCT target_id) AS targets, sum(CASE WHEN target_id IS NULL OR store_id IS NULL OR latitude IS NULL OR longitude IS NULL THEN 1 ELSE 0 END) AS incomplete_rows FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv', all_varchar=true);"
cargo fmt --check
cargo test --workspace
git diff --check
```
