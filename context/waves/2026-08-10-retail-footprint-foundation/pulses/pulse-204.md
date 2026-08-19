# Pulse 204: Minimum Postal Parish Post-Office Sample Builder

## Summary

Added a reusable post-office sample target builder for A.1b national scale-out.
The script converts reviewed packet-ready post-office seed rows into bounded
target boxes and preserves seed provenance, sample stratum, and settlement-size
proxy fields. A three-row Washington smoke output proves the contract without
claiming a national sample.

## Files

- `scripts/build_post_office_sample_targets.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/28-post-office-sample-builder.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-targets-smoke-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The smoke output uses existing reviewed Washington OSM post-office rows and
produces three post-office-centered target boxes. The output is contract proof
only; `settlement_size_proxy` remains `not_joined`.

## Boundary

This pulse may say the seed-to-target-box builder exists and has a smoke-test
output. It may not claim a national sample, national frequency, smallest postal
parish, service adequacy, ZIP/ZCTA/CDP/county coverage, trade areas, catchments,
income, spending, or customer behavior.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
