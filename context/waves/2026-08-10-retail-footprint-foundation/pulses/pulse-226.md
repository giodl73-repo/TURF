# Pulse 226: Minimum Postal Parish Mountain West Wyoming Sidecar Pass

## Summary

Ran the Wyoming/Mountain West local Geofabrik sidecar pass and applied the
current-postal-anchor gate to the two postal-only candidates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/50-mountain-west-wyoming-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-mountain-west-minimum-stack-classification-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-mountain-west-sidecar-synthesis-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-mountain-west-depth-candidates-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/wyoming-current-postal-anchor-review-2026-08-16.csv`

## Evidence

The 12-target classification has 10 postal everyday-service minimums and two
postal-only candidates: Auburn and Carpenter WY. Both candidates pass the
current-anchor gate with USPS current anchors geocoded inside their target
boxes.

## Boundary

The two targets are candidates, not confirmed postal-only minimum stacks. The
pass does not support Wyoming, Mountain West, or national frequency claims.

## Validation

```powershell
python scripts\validate_current_postal_anchor_review.py --review research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\wyoming-current-postal-anchor-review-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
