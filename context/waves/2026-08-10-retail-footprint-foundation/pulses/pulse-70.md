# Pulse 70: RET Anchor Profile v1 Examples

## Goal

Extract canonical examples from Anchor Profile v1 so each anchor modifier has
stable reference rows for later rule tuning and tests.

## Work

- Added `queries/ret-anchor-profile-v1-examples.sql`.
- Generated `reports/ret-anchor-profile-v1-examples.csv`.
- Added `reports/ret-anchor-profile-v1-examples.md`.
- Updated README, wave state, and role review.

## Learning

The examples report makes the typology easier to audit. Active regional-anchor
examples now span Lynnwood/Everett, Kitsap, and South Hill. Urban mall service
grid examples span Puget Sound and Atlanta. Bellevue core remains present only
as a source-limited caution example.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-profile-v1-examples.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
