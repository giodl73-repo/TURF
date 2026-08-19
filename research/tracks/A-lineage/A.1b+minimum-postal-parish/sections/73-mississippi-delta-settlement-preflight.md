# Mississippi Delta Settlement Preflight

## Reusable Output

Settlement join:
`tables/mississippi-delta-settlement-join-2026-08-16.csv`.

Preflight outputs:

- `tables/mississippi-delta-preflight-targets-2026-08-16.csv`,
- `tables/mississippi-delta-preflight-enriched-targets-2026-08-16.csv`,
- `tables/mississippi-delta-preflight-report-2026-08-16.csv`.

Supporting script update:
`scripts/run_post_office_sample_preflight.py`.

## Purpose

This pass completes the settlement join and preflight for the Mississippi /
Deep South Delta wave-2 manifest row. It also updates the preflight wrapper so
the deterministic `--sample-seed` selection rule from the wave-2 frequency
controls is preserved during preflight.

## Settlement Join

The settlement-size join uses:

- U.S. Census Bureau 2020 PL 94-171 Mississippi geography file,
- Census coordinate geocoder for target centroids,
- incorporated place when available,
- county subdivision otherwise.

The join has 12 rows and no `unknown` bucket:

- `under_2500`: 8,
- `2500_to_9999`: 2,
- `10000_to_49999`: 2.

Geography levels:

- Incorporated Places: 7,
- County Subdivisions: 5.

## Preflight

The Mississippi preflight passes with:

- 184 validated public-post-office seed rows,
- 12 target rows,
- 12 enriched rows,
- all settlement joins resolved by `target_id`.

The preflight target IDs match
`tables/mississippi-delta-post-office-sample-targets-2026-08-16.csv`, confirming
that standalone target sampling and preflight sampling use the same deterministic
SHA256 seed.

## Remaining Execution Gates

Mississippi still needs:

- local sidecar extraction,
- sidecar classification,
- denominator rebuild,
- exclusion ledger,
- depth and truth dossiers for any candidates,
- synthesis update.

## Boundary

This preflight creates Mississippi / Deep South Delta sample inputs. It does
not claim Mississippi frequency, Deep South Delta frequency, national
frequency, complete service absence, catchment isolation, service adequacy,
trade areas, income, spending, or customer behavior.
