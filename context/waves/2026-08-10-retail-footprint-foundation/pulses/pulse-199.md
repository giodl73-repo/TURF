# Pulse 199: Minimum Postal Parish Illinois Third Pilot Selection

## Summary

Selected Illinois as the A.1b third-state pilot and generated a 20-target
bounded post-office verification queue. The reviewed Illinois chain layers
produce 113 one-layer sparse city labels: 86 QSR, 10 auto-parts, nine grocery,
and eight pharmacy.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/23-illinois-third-pilot-selection.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-chain-sparse-city-candidates.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-third-pilot-candidate-queue-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-third-pilot-targets-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Illinois adds a Great Lakes/Midwest single-state pilot with the same reviewed
candidate layers used for Georgia: auto parts, grocery, pharmacy, and
four-brand QSR. The selected queue contains 10 auto-parts-only, four
grocery-only, four QSR-only, and two pharmacy-only sparse city labels.

## Boundary

This pulse may select bounded Illinois targets for post-office verification. It
may not assign Illinois minimum-stack classes or claim citywide, ZIP, ZCTA,
CDP, county, postal-locality, trade-area, or catchment service absence.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
