# Pulse 66: Washington Anchor-Field Profile Impact

## Goal

Measure how the reviewed Washington anchor-field complex layer changes anchor
profile interpretation across the six bounded Puget Sound fields.

## Work

- Added `queries/ret-washington-anchor-field-profile.sql`.
- Generated `reports/ret-washington-anchor-field-profile.csv`.
- Added `reports/ret-washington-anchor-field-profile.md`.
- Updated README, wave state, and role review.

## Learning

The new reviewed complex layer identifies Kitsap Mall / Silverdale and South
Hill / Puyallup as active regional mall anchors. Southcenter / Tukwila and
Tacoma Mall classify as urban mall service grids. Bellevue core is flagged as
under-captured because the checked candidate source does not surface Bellevue
Square or Lincoln Square as reviewed complex rows.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-anchor-field-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
