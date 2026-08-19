# Pulse 227: Minimum Postal Parish Wyoming Depth Review

## Summary

Depth-reviewed the two Wyoming/Mountain West postal-only candidates. Auburn is
rejected as clean postal-only by an inside-box trade-service signal, while
Carpenter remains a strict target-box survivor.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/51-wyoming-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-depth-review-decision-2026-08-16.csv`

## Evidence

Star Valley Sod geocodes inside the Auburn target box as trade-service evidence.
Antelope Truck Stop and TA Cheyenne are fuel/food/laundry sources near
Carpenter, but both geocode outside the Carpenter target box.

## Boundary

The review does not support Wyoming, Mountain West, or national frequency
claims. It only updates the two sampled candidate statuses.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
