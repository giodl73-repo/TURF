# Post-Office Sample Builder

## Reusable Output

Builder script:
`scripts/build_post_office_sample_targets.py`.

Smoke-test target file:
`tables/national-post-office-sample-targets-smoke-2026-08-15.csv`.

Sample-frame contract:
`tables/national-post-office-sample-frame-contract-2026-08-15.csv`.

## Purpose

The national A.1b sample needs a reproducible way to turn reviewed open
post-office seed rows into bounded target boxes. The new builder does that
without running a national sample or making a national claim.

It accepts a reviewed post-office seed CSV with the standard civic review
schema, filters to packet-ready `facility_type=post_office` rows with
coordinates, and writes target boxes using the same geometry fields expected by
`scripts/fetch_osm_civic.py`.

## Command

Example smoke-test command:

```powershell
python scripts\build_post_office_sample_targets.py --seeds fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-targets-smoke-2026-08-15.csv --sample-per-stratum 3 --max-total 3
```

The smoke file proves the contract against existing reviewed Washington
post-office rows. It is not a national sample.

## Output Fields

The builder emits:

- target-box fields used by the civic fetcher,
- seed provenance fields,
- `sample_stratum`,
- `settlement_size_proxy`.

The settlement-size proxy is currently `not_joined` in the smoke output. A real
national sample still needs a population or settlement-size join before
frequency claims.

## Boundary

This builder may create reproducible target-box inputs from reviewed open
post-office seeds. It may not source a national seed file by itself, claim
national frequency, claim smallest postal parishes, or infer service adequacy,
trade areas, catchments, income, spending, or customer behavior.
