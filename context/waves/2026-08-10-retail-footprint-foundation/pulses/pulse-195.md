# Pulse 195: Minimum Postal Parish Georgia Post-Office Gate

## Summary

Ran bounded OSM post-office verification for the 20-target Georgia second pilot.
The pass completed with two observed targets, 18 checked-absent targets, and no
source gates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/20-georgia-post-office-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-post-office-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-post-office-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Ball Ground and Cohutta have observed OSM post-office rows inside the bounded
target boxes. The other 18 Georgia targets are checked absent for this bounded
OSM pass and should not receive postal minimum-stack classes unless another
approved post-office source or target definition is added.

## Boundary

This pulse may say bounded OSM post-office evidence is observed or checked
absent inside the target boxes. It may not claim citywide, ZIP, ZCTA, CDP,
county, postal-locality, trade-area, or catchment post-office absence, and it
may not classify Georgia targets nationally.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
