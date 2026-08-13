# Pulse 69: RET Anchor Profile v1 Delta

## Goal

Make the Anchor Profile v0-to-v1 change measurable with a checked delta report.

## Work

- Added `queries/ret-anchor-profile-v1-delta.sql`.
- Generated `reports/ret-anchor-profile-v1-delta.csv`.
- Added `reports/ret-anchor-profile-v1-delta.md`.
- Updated README, wave state, and role review.

## Learning

V1 is additive. It adds six Puget Sound `district_field` rows, increasing active
regional mall anchors from 2 to 4 and urban mall service grids from 1 to 3. The
v0 North Seattle and Atlanta rows are unchanged.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-profile-v1-delta.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
