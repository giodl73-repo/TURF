# Pulse 61: Washington Anchor-Field Targets

## Goal

Define the next bounded Washington mall/retail-complex fields before running a
broader extraction.

## Work

- Added `fixtures/geography/ret-washington-anchor-field-targets.csv`.
- Added `queries/ret-washington-anchor-field-targets.sql`.
- Generated `reports/ret-washington-anchor-field-targets.csv`.
- Added `reports/ret-washington-anchor-field-targets.md`.
- Updated README, wave state, and role review.

## Learning

The next Washington anchor comparison should be target-first. Bellevue,
Factoria, Southcenter/Tukwila, Tacoma Mall, Kitsap Mall/Silverdale, and South
Hill/Puyallup are now explicit extraction fields with bounded boxes and expected
anchor tests.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-anchor-field-targets.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
