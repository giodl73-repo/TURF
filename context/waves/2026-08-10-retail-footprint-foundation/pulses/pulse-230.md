# Pulse 230: Minimum Postal Parish New Mexico Depth Review

## Summary

Depth-reviewed the two New Mexico/Southwest Borderlands postal-only candidates.
Algodones is rejected by inside-box grocery retail evidence, while Amistad
remains a strict target-box survivor.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/54-new-mexico-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-depth-review-decision-2026-08-16.csv`

## Evidence

Algodones Market geocodes inside the Algodones target box as grocery retail.
Black Mesa Travel Center is nearby but outside the sampled Algodones box.
Reviewed Amistad services outside the postal anchor remain outside the sampled
target box or civic-only.

## Boundary

The review does not support New Mexico, Southwest Borderlands, or national
frequency claims. It only updates the two sampled candidate statuses.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
