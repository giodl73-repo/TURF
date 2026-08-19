# Pulse 213: Minimum Postal Parish New England Rhode Island Seed

## Summary

Started the breadth-first phase with a real open New England seed extract.
After live Overpass state/bounding-box attempts timed out, Rhode Island was
downloaded from Geofabrik as an OSM GeoPackage extract and parsed locally for
post-office features.

## Files

- `scripts/extract_geofabrik_post_office_seed.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/37-new-england-rhode-island-seed.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-seed-source-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-post-office-seed-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-post-office-sample-targets-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The Rhode Island seed validates with 70 packet-ready post-office rows, all in
RI, from the Geofabrik OpenStreetMap GeoPackage extract. The target builder
writes a 12-row bounded sample with `settlement_size_proxy=not_joined`.

## Boundary

This pulse creates seed and target artifacts only. It does not create a
settlement-size join, run full preflight, run sidecars, claim New England
frequency, or claim national frequency.

## Validation

```powershell
python scripts\extract_geofabrik_post_office_seed.py --gpkg tmp\rhode-island-gpkg\rhode-island.gpkg --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-post-office-seed-2026-08-15.csv --state RI --source-date 2026-08-15T20:21:20Z
python scripts\validate_post_office_seed.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-post-office-seed-2026-08-15.csv
python scripts\build_post_office_sample_targets.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-post-office-seed-2026-08-15.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-post-office-sample-targets-2026-08-15.csv --sample-per-stratum 12 --max-total 12
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py
git diff --check
cargo fmt --check
cargo test --workspace
```
