# Alaska Arctic Remote Seed and Preflight

## Reusable Output

Raw seed:
`tables/alaska-arctic-remote-post-office-seed-2026-08-16.csv`.

Seed semantics:
`tables/alaska-arctic-remote-seed-semantics-review-2026-08-16.csv`.

Public seed:
`tables/alaska-arctic-remote-public-post-office-seed-2026-08-16.csv`.

Targets and preflight:

- `tables/alaska-arctic-remote-post-office-sample-targets-2026-08-16.csv`,
- `tables/alaska-arctic-remote-settlement-join-2026-08-16.csv`,
- `tables/alaska-arctic-remote-preflight-targets-2026-08-16.csv`,
- `tables/alaska-arctic-remote-preflight-enriched-targets-2026-08-16.csv`,
- `tables/alaska-arctic-remote-preflight-report-2026-08-16.csv`.

## Source

The Alaska row uses Geofabrik's Alaska GeoPackage source. The downloaded
`alaska-latest-free.gpkg.zip` had `Last-Modified:
2026-08-16T03:58:03Z` and extracted to `alaska.gpkg`.

Settlement context uses the Census 2020 PL Alaska geography archive
`ak2020.pl.zip`, specifically `akgeo2020.pl`, listed by Census with a
2021-08-12 directory timestamp.

## Result

The seed pass produced:

- 171 raw Geofabrik post-office rows,
- 108 reviewed public postal-anchor rows,
- 63 semantic-gated or non-public rows.

The deterministic sample seed `a1b-wave2-2026-08-16` selected 12 Alaska target
boxes.

The settlement preflight produced:

- 12 target rows,
- 12 enriched rows,
- settlement buckets: four `under_2500`, three `2500_to_9999`, two
  `10000_to_49999`, and three `50000_plus`.

## Boundary

The Alaska target boxes are post-office-centered sample probes. They are not
city, ZIP, ZCTA, borough, trade-area, or catchment boundaries, and they do not
authorize Arctic Remote or national frequency language.
