# Pulse 219: Minimum Postal Parish South Dakota Depth Review

## Summary

Depth-reviewed the seven South Dakota postal-only candidates against alternate
open sources. The queue narrows sharply: Alcester, Alexandria, Astoria, and
Avon are rejected by inside-box everyday-service evidence; Badger is rejected
as clean postal-only by an inside-box trade-service signal; Allen is weakened
but exact-storefront geocode-gated; Artesian survives as the only strict
target-box candidate.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/43-south-dakota-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/south-dakota-depth-review-decision-2026-08-16.csv`

## Evidence

The review uses city business directories, brand locators, South Dakota state
tax context, local institution pages, and Census/Nominatim geocoding to
separate inside-box contradictions from nearby or community-level service
evidence.

## Boundary

This pulse revises candidate status only. It does not support South Dakota,
Great Plains, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py
git diff --check
cargo fmt --check
cargo test --workspace
```
