# Pulse 216: Minimum Postal Parish Clayville Depth Review

## Summary

Depth-reviewed the Clayville postal-only candidate with alternate open sources.
The review found no inside-target-box everyday-service contradiction, but it did
find nearby services outside the sampled box. Clayville therefore remains a
postal-only depth candidate, not a confirmed postal-only minimum stack.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/40-clayville-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/clayville-depth-review-open-sources-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/clayville-depth-review-decision-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The Clayville post-office address geocodes inside the sampled target box.
Groundwater Cafe, Brigido's Fresh Market, Scituate Hardware, and Scituate
Lumber geocode outside the target box. A narrow OSM API map check around the
post-office point returned no everyday-service matches; the full target-box OSM
API request remained source-gated by bbox limits.

## Boundary

Clayville remains a candidate only. This pulse does not confirm a postal-only
minimum stack, define a catchment, claim broader service absence, or support
Rhode Island/New England frequency.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
