# Pulse 221: Minimum Postal Parish Appalachia West Virginia Preflight

## Summary

Started the Appalachia breadth stratum with West Virginia. A Geofabrik OSM
GeoPackage was downloaded and parsed locally for post-office seed rows, then a
Census-based settlement join and full preflight were completed for a 12-target
sample.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/45-appalachia-west-virginia-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-seed-source-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-post-office-seed-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-post-office-sample-targets-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-settlement-join-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-preflight-report-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-appalachia-preflight-manifest-2026-08-16.csv`

## Evidence

The seed validator accepts 679 packet-ready named post-office rows. The
preflight writes 12 targets and 12 enriched rows. The settlement join resolves
11 of 12 targets and leaves Addison as `unknown`.

## Boundary

This pulse completes sample preflight only. It does not support West Virginia,
Appalachia, or national frequency claims.

## Validation

```powershell
python scripts\validate_post_office_seed.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-post-office-seed-2026-08-16.csv
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-settlement-join-2026-08-16.csv
python scripts\run_post_office_sample_preflight.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-post-office-seed-2026-08-16.csv --settlement-join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-settlement-join-2026-08-16.csv --targets-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-preflight-targets-2026-08-16.csv --enriched-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-preflight-enriched-targets-2026-08-16.csv --report-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-appalachia-preflight-report-2026-08-16.csv --sample-per-stratum 12 --max-total 12
```
