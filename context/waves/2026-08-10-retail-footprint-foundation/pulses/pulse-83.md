# Pulse 83: Atlanta Context Scale Targets

## Goal

Set a concrete next goal before scaling TURF to more urban areas: run the
completed Washington anchor-field context contract against a bounded Atlanta
field set.

## Work

- Added `fixtures/geography/ret-atlanta-anchor-field-targets.csv`.
- Added `queries/ret-atlanta-anchor-field-targets.sql`.
- Added `reports/ret-atlanta-anchor-field-targets.md`.
- Updated README and wave state.

## Learning

Washington closed the pre-scale source gates. The next useful signal is not a
new industry yet; it is a comparable second-metro context pass.

Atlanta is a good next test because prior pulses already identified seven named
retail fields:

- Cumberland / Vinings.
- Buckhead / Lenox / Phipps.
- Perimeter widened.
- Camp Creek.
- Northlake.
- North Point / Alpharetta widened.
- Decatur / Emory.

The target set deliberately includes edge-city malls, legacy malls, a luxury
urban mall cluster, an airport-edge power center, and an inner service village.
That should tell us whether post offices, libraries, parks, transit, finance,
pharmacy, dollar stores, gas/convenience, gyms, hardware, and laundromats
produce recurring field types or Atlanta-specific types.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-targets.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
