# Pulse 232: Minimum Postal Parish Hawaii Sidecar And Semantics Pass

## Summary

Ran local Geofabrik everyday-service sidecars for Hawaii/Island and Remote,
finding all 12 sampled boxes as everyday-service observed and zero postal-only
candidates. Added a postal-semantics review because five sampled seed rows are
private-shipping labels.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/56-island-remote-hawaii-sidecar-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-postal-semantics-review-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-minimum-stack-classification-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-sidecar-synthesis-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-depth-candidates-2026-08-16.csv`

## Evidence

Food service and gas/convenience are observed in all 12 sampled target boxes;
hardware and laundromat evidence are each observed in nine. Dollar-store
evidence is absent. Five sampled OSM post-office seed labels are FedEx-related
and are gated from clean public-post-office denominators.

## Boundary

The pass classifies sampled target boxes only. It does not support Hawaii,
Island and Remote, or national frequency claims.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
