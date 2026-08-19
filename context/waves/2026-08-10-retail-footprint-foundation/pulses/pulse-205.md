# Pulse 205: Minimum Postal Parish Seed Source And Settlement Proxy

## Summary

Defined the acceptable national post-office seed-source paths and the required
settlement-size proxy contract for A.1b scale-out. The recommended source path
is a reviewed OSM post-office extract or state/region OSM extracts, not live
national Overpass. The settlement proxy remains gated before any national
frequency claim.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/29-national-seed-source-and-settlement-proxy.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-seed-source-options-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/settlement-size-proxy-contract-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The contract follows the pilot evidence: OSM-derived post-office rows are
compatible with the reviewed state pilots, while Illinois showed that live
endpoint zeroes and API limits need source-gate handling.

## Boundary

This pulse may define source and proxy requirements. It may not claim a national
sample exists, national frequency, smallest postal parish, complete inventory,
ZIP/ZCTA/CDP/county coverage, trade areas, catchments, service adequacy, income,
spending, or customer behavior.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
