# Pulse 60: Washington Retail-Complex Coverage Audit

## Goal

Check whether the existing Washington retail-complex layer can support a second
Puget Sound anchor-profile test.

## Work

- Added `queries/ret-washington-retail-complex-coverage.sql`.
- Generated `reports/ret-washington-retail-complex-coverage.csv`.
- Added `reports/ret-washington-retail-complex-coverage.md`.
- Updated README, wave state, and role review.

## Learning

The current Washington retail-complex layer is not statewide. Its 15
packet-ready rows are all in the North Seattle / South Snohomish experiment.
That prevents a fair Bellevue, Southcenter, Tacoma Mall, Kitsap Mall, or South
Hill anchor-profile comparison until another bounded complex extraction and
review pass is done.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-retail-complex-coverage.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
