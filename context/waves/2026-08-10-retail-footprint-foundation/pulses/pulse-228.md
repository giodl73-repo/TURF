# Pulse 228: Minimum Postal Parish Southwest Borderlands New Mexico Preflight

## Summary

Extracted and validated the first New Mexico/Southwest Borderlands open
post-office seed, joined Census settlement proxies, and completed a 12-target
breadth preflight.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/52-southwest-borderlands-new-mexico-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-southwest-borderlands-seed-source-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-southwest-borderlands-post-office-seed-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-southwest-borderlands-post-office-sample-targets-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-southwest-borderlands-settlement-join-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/new-mexico-southwest-borderlands-preflight-manifest-2026-08-16.csv`

## Evidence

The Geofabrik extract produced 395 named packet-ready New Mexico post-office
rows and 27 unnamed excluded rows. The Census settlement proxy join resolves all
12 sampled target boxes.

## Boundary

The preflight is a sample-frame artifact only. It does not support New Mexico,
Southwest Borderlands, or national frequency claims.

## Validation

```powershell
python scripts\validate_post_office_seed.py research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\new-mexico-southwest-borderlands-post-office-seed-2026-08-16.csv --expected-packet-ready 395
python scripts\validate_settlement_proxy_join.py research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\new-mexico-southwest-borderlands-settlement-join-2026-08-16.csv --expected-targets 12
```
