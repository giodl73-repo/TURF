# Pulse 214: Minimum Postal Parish Rhode Island Settlement Preflight

## Summary

Completed the first real next-wave breadth preflight for Rhode Island. A
Census-based settlement-size join was built for the 12 Rhode Island targets,
validated, and used in the full post-office sample preflight.

## Files

- `scripts/build_census_geocoder_settlement_join.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/38-rhode-island-settlement-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-settlement-join-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-preflight-targets-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-preflight-enriched-targets-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-preflight-report-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/rhode-island-new-england-preflight-manifest-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The settlement join has 12 rows, no unknown buckets, and resolves to 4
incorporated-place proxies and 8 county-subdivision proxies. The preflight
report records 70 validated seed rows, 12 target rows, 12 enriched rows, and
`target_id=12` settlement joins.

## Boundary

This pulse completes preflight only. It does not run sidecars, classify Rhode
Island minimum stacks, claim New England frequency, or claim national
frequency.

## Validation

```powershell
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-settlement-join-2026-08-15.csv
python scripts\run_post_office_sample_preflight.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-post-office-seed-2026-08-15.csv --settlement-join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-settlement-join-2026-08-15.csv --targets-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-preflight-targets-2026-08-15.csv --enriched-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-preflight-enriched-targets-2026-08-15.csv --report-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\rhode-island-new-england-preflight-report-2026-08-15.csv --sample-per-stratum 12 --max-total 12
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py
git diff --check
cargo fmt --check
cargo test --workspace
```
