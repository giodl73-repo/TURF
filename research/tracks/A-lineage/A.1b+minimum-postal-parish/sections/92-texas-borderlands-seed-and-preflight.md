# Texas Borderlands Seed and Preflight

## Reusable Output

Raw seed:
`tables/texas-borderlands-post-office-seed-2026-08-16.csv`.

Seed semantics and public seed:

- `tables/texas-borderlands-seed-semantics-review-2026-08-16.csv`,
- `tables/texas-borderlands-public-post-office-seed-2026-08-16.csv`.

Targets and preflight:

- `tables/texas-borderlands-post-office-sample-targets-2026-08-16.csv`,
- `tables/texas-borderlands-settlement-join-2026-08-16.csv`,
- `tables/texas-borderlands-preflight-targets-2026-08-16.csv`,
- `tables/texas-borderlands-preflight-enriched-targets-2026-08-16.csv`,
- `tables/texas-borderlands-preflight-report-2026-08-16.csv`.

## Source

The Texas row uses Geofabrik's `texas-latest-free.gpkg.zip`. The downloaded
file had `Last-Modified: 2026-08-16T03:29:35Z` and extracted to `texas.gpkg`.

Settlement context uses the Census 2020 PL Texas geography archive
`tx2020.pl.zip`, specifically `txgeo2020.pl`, listed by Census with a
2021-08-12 directory timestamp.

## Result

The seed pass produced:

- 1,444 raw Geofabrik post-office rows,
- 826 reviewed public postal-anchor rows,
- 618 semantic-gated or non-public rows.

The deterministic sample seed `a1b-wave2-2026-08-16` selected 12 Texas target
boxes.

The settlement preflight produced:

- 12 target rows,
- 12 enriched rows,
- settlement buckets: two `under_2500`, two `2500_to_9999`, three
  `10000_to_49999`, and five `50000_plus`.

## Boundary

The Texas target boxes are post-office-centered sample probes, not city, ZIP,
ZCTA, county, trade-area, or catchment boundaries.
