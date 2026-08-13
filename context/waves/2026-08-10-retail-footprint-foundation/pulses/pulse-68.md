# Pulse 68: RET Anchor Profile v1

## Goal

Promote the reviewed Washington anchor-field profile into an integrated Anchor
Profile v1 while keeping Anchor Profile v0 stable.

## Work

- Added `queries/ret-anchor-profile-v1.sql`.
- Generated `reports/ret-anchor-profile-v1.csv`.
- Added `reports/ret-anchor-profile-v1.md`.
- Extended the anchor-profile geography contract with `district_field`.
- Updated README, RET profile docs, wave state, and role review.

## Learning

Anchor Profile v1 adds six Puget Sound `district_field` rows. The integrated
profile now has four active regional mall anchors: Lynnwood / Alderwood,
Everett, Kitsap Mall / Silverdale, and South Hill / Puyallup. Bellevue core is
carried forward as source-limited, not as a final weak-anchor conclusion.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-profile-v1.sql"
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v1.csv
cargo run -p turf-cli -- summarize-anchor-profile reports\ret-anchor-profile-v1.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
