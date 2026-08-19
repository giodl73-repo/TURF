# Pulse 200: Minimum Postal Parish Illinois Post-Office Gate

## Summary

Ran bounded post-office verification for the 20-target Illinois third pilot.
The initial alternate Overpass zero result was contradicted by the OSM API map
fallback, so the final status is eight observed targets, two checked-absent
targets, and ten source-gated targets.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/24-illinois-post-office-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-post-office-illinois-third-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/illinois-post-office-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Observed post-office targets are Fairbury, Greenup, Mount Carmel, Virden,
Winthrop Harbor, Albion, Altamont, and Arcola. Petersburg and Henry are
checked absent in the bounded fallback pass. Ten dense targets remain
source-gated because the OSM map API hit an API limit after the alternate
Overpass endpoint returned unreliable zero rows.

## Boundary

This pulse may say Illinois post-office evidence is observed, checked absent,
or source-gated inside bounded target boxes. It may not claim citywide, ZIP,
ZCTA, CDP, county, postal-locality, trade-area, or catchment post-office
absence, and it may not assign Illinois minimum-stack classes yet.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
