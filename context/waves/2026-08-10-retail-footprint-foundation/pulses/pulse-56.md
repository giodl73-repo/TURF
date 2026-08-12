# Pulse 56: RET Anchor Profile v0

## Goal

Combine the separate anchor modifier and pressure-case outputs into one
cross-region anchor profile table with explicit geography scope.

## Work

- Added `queries/ret-anchor-profile-v0.sql`.
- Generated `reports/ret-anchor-profile-v0.csv`.
- Added `reports/ret-anchor-profile-v0.md`.
- Updated README, wave state, role review, and anchor-modifier docs.

## Learning

Anchor modifiers need their own profile grain. City profiles are too coarse for
mall fields, corridors, and district slices. The v0 anchor profile keeps
`district_core` and `district_wide` rows together so Perimeter and North Point /
Alpharetta can show both the tight-box pressure case and the wider edge-city
mall service grid.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-profile-v0.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
