# Minnesota Upper Midwest Seed and Preflight

## Reusable Output

Raw seed:
`tables/minnesota-upper-midwest-post-office-seed-2026-08-16.csv`.

Seed semantics and public seed:

- `tables/minnesota-upper-midwest-seed-semantics-review-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-public-post-office-seed-2026-08-16.csv`.

Targets and preflight:

- `tables/minnesota-upper-midwest-post-office-sample-targets-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-settlement-join-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-preflight-targets-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-preflight-enriched-targets-2026-08-16.csv`,
- `tables/minnesota-upper-midwest-preflight-report-2026-08-16.csv`.

## Source

The Minnesota row uses Geofabrik's `minnesota-latest-free.gpkg.zip`. The
downloaded file had `Last-Modified: 2026-08-16T02:16:42Z` and extracted to
`minnesota.gpkg`.

Settlement context uses the Census 2020 PL Minnesota geography archive
`mn2020.pl.zip`, specifically `mngeo2020.pl`, listed by Census with a
2021-08-12 directory timestamp.

## Result

The seed pass produced:

- 913 raw Geofabrik post-office rows,
- 682 reviewed public postal-anchor rows,
- 231 semantic-gated or non-public rows.

The deterministic sample seed `a1b-wave2-2026-08-16` selected 12 Minnesota
target boxes.

The settlement preflight produced:

- 12 target rows,
- 12 enriched rows,
- settlement buckets: nine `under_2500`, one `2500_to_9999`, and two
  `10000_to_49999`.

## Boundary

The Minnesota target boxes are post-office-centered sample probes, not city,
ZIP, ZCTA, county, trade-area, or catchment boundaries.
