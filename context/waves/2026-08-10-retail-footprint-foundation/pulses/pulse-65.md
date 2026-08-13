# Pulse 65: Washington Anchor-Field Review

## Goal

Promote the Washington anchor-field retail-complex candidates into a reviewed
store layer that Anchor Profile work can safely consume.

## Work

- Added `queries/ret-washington-anchor-field-reviewed-complexes.sql`.
- Generated
  `fixtures/stores/overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv`.
- Added `queries/ret-washington-anchor-field-review-summary.sql`.
- Generated `reports/ret-washington-anchor-field-review-summary.csv`.
- Added `reports/ret-washington-anchor-field-review-summary.md`.
- Updated README, wave state, and role review.

## Learning

The 63 candidate rows produce 16 packet-ready retail-complex rows, 10 duplicate
mentions, and 37 false positives. Southcenter, Tacoma, Kitsap, and South Hill
now have reviewed anchor-complex signals. Bellevue core remains under-captured
by this source because it does not surface Bellevue Square or Lincoln Square as
packet-ready complex rows.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-anchor-field-reviewed-complexes.sql"
duckdb -c ".read queries/ret-washington-anchor-field-review-summary.sql"
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
