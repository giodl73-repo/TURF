# Pulse 231: Minimum Postal Parish Island Remote Hawaii Preflight

## Summary

Extracted and validated the first Hawaii/Island and Remote open post-office
seed, joined Census settlement proxies, and completed a 12-target breadth
preflight.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/55-island-remote-hawaii-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-seed-source-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-post-office-seed-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-post-office-sample-targets-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-settlement-join-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/hawaii-island-remote-preflight-manifest-2026-08-16.csv`

## Evidence

The Geofabrik extract produced 79 named packet-ready Hawaii post-office rows
and 18 unnamed excluded rows. The Census settlement proxy join resolves all 12
sampled target boxes.

## Boundary

The preflight is a sample-frame artifact only. It does not support Hawaii,
Island and Remote, or national frequency claims.

## Validation

```powershell
python scripts\validate_post_office_seed.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\hawaii-island-remote-post-office-seed-2026-08-16.csv
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\hawaii-island-remote-settlement-join-2026-08-16.csv
```
