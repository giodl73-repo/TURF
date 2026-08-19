# Pulse 223: Minimum Postal Parish West Virginia Depth Review

## Summary

Depth-reviewed the nine West Virginia/Appalachia postal-only candidates with
alternate open sources. The queue narrowed sharply: one strict survivor, one
weakened trade-service/geocode-gated candidate, two everyday-service
rejections, and five current-postal-anchor gates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/47-west-virginia-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-depth-review-decision-2026-08-16.csv`

## Evidence

Amherstdale and Amma are rejected by inside-box everyday-service evidence.
Alum Bridge remains the only strict target-box survivor. Alkol remains a
weakened candidate because the trade-service lead geocodes only to a road-level
fallback. Advent, Alvy, Ameagle, Annamoriah, and Anthony are not usable as
current postal-only candidates until their current post-office anchor is
verified.

## Boundary

The review does not support West Virginia, Appalachia, or national frequency
claims. It only updates the nine sampled candidate statuses.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
