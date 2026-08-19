# Post-Office Sample Preflight

## Reusable Output

Preflight script:
`scripts/run_post_office_sample_preflight.py`.

Smoke target output:
`tables/national-post-office-sample-targets-preflight-smoke-2026-08-15.csv`.

Smoke enriched output:
`tables/national-post-office-sample-targets-preflight-smoke-enriched-2026-08-15.csv`.

Smoke report:
`tables/national-post-office-sample-preflight-smoke-report-2026-08-15.csv`.

## Purpose

The national or regional A.1b sample needs one reproducible gate that runs the
seed validator, target-box builder, settlement-join validator, and enrichment
step in sequence. The preflight script does that with explicit output files for
each artifact.

## Command

Smoke preflight command:

```powershell
python scripts\run_post_office_sample_preflight.py --seeds fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv --settlement-join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\settlement-size-proxy-smoke-join-2026-08-15.csv --targets-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-targets-preflight-smoke-2026-08-15.csv --enriched-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-targets-preflight-smoke-enriched-2026-08-15.csv --report-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-preflight-smoke-report-2026-08-15.csv --sample-per-stratum 3 --max-total 3
```

## Smoke Result

The smoke preflight writes three target boxes and three enriched rows from the
validated Washington seed file. All three enriched rows join to the manual
settlement fixture by `target_id`.

## Boundary

The smoke preflight validates workflow wiring only. It is not a national
post-office sample, national settlement join, complete post-office inventory,
or national frequency estimate.

## Next Gate

Run the preflight against a reviewed open regional or national post-office seed
extract and a versioned open settlement-size join before any sidecar
classification.
