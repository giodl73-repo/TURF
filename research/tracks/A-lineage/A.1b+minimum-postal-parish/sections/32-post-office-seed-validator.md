# Post-Office Seed Validator

## Reusable Output

Validator script:
`scripts/validate_post_office_seed.py`.

Smoke seed file:
`fixtures/civic/osm-post-office-washington-anchor-fields-review-2026-08-13.csv`.

## Purpose

The national or regional A.1b sample should only start from reviewed
packet-ready open post-office seed rows. The validator checks the seed table
before the sample builder runs.

The gate requires:

- the reviewed civic seed fields used by the sample builder,
- `facility_type=post_office`,
- `review_status=packet_ready`,
- `license_status=open`,
- nonblank source and rights provenance,
- valid latitude and longitude,
- unique packet-ready post-office `facility_id` values.

## Command

Smoke validation command:

```powershell
python scripts\validate_post_office_seed.py --seeds fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv
```

## Boundary

The validator checks reviewed seed contract shape and declared open-source
provenance. It does not create a national seed file, certify OSM completeness,
resolve source-gated endpoint behavior, infer a postal service area, or support
a national frequency claim.

## Next Gate

Run this validator before `scripts/build_post_office_sample_targets.py` on any
real national or regional post-office seed extract.
