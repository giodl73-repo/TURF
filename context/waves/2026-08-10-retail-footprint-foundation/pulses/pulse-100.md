# Pulse 100: Chicago Gym Source Gate

## Goal

Test whether a dense OSM category resolves Chicago target fields better than
post office.

## Work

- Attempted bounded OSM/Overpass gym fetches for all seven Chicago anchor
  fields.
- Attempted a Loop / River North fallback against the main Overpass endpoint.
- Added an empty reviewed Chicago gym fixture with the standard civic review
  headers.
- Added a seven-field source-gate fixture.
- Added `queries/ret-chicago-anchor-field-gym-summary.sql`.
- Generated `reports/ret-chicago-anchor-field-gym-summary.csv`.
- Added `reports/ret-chicago-anchor-field-gym-summary.md`.
- Updated README, wave state, and role review.

## Learning

Chicago's source issue is broader than post office. Gym is dense and productive
in Washington and Atlanta, but every Chicago target timed out in this pass.

The right next step is not to grind through all OSM dimensions blindly. TURF
should either retry Chicago during a better Overpass window, reduce query
complexity, or use a non-Overpass reviewed open source for a category such as
pharmacy before continuing the full Chicago pass.

## Validation

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-gym-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
