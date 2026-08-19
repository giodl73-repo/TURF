# Southern California Seed and Preflight

## Reusable Output

Raw seed:
`tables/california-socal-interior-post-office-seed-2026-08-16.csv`.

Seed semantics and public seed:

- `tables/california-socal-interior-seed-semantics-review-2026-08-16.csv`,
- `tables/california-socal-interior-public-post-office-seed-2026-08-16.csv`.

Targets and preflight:

- `tables/california-socal-interior-post-office-sample-targets-2026-08-16.csv`,
- `tables/california-socal-interior-settlement-join-2026-08-16.csv`,
- `tables/california-socal-interior-preflight-targets-2026-08-16.csv`,
- `tables/california-socal-interior-preflight-enriched-targets-2026-08-16.csv`,
- `tables/california-socal-interior-preflight-report-2026-08-16.csv`.

## Source

The Southern California row uses Geofabrik's `socal-latest-free.gpkg.zip`.
The downloaded file had `Last-Modified: 2026-08-16T01:28:21Z` and extracted
to `socal.gpkg`.

Settlement context uses the Census 2020 PL California geography archive
`ca2020.pl.zip`, specifically `cageo2020.pl`, listed by Census with a
2021-08-12 directory timestamp.

## Result

The seed pass produced:

- 1,117 raw Geofabrik post-office rows,
- 704 reviewed public postal-anchor rows,
- 413 semantic-gated or non-public rows.

The deterministic sample seed `a1b-wave2-2026-08-16` selected 12 Southern
California target boxes.

The settlement preflight produced:

- 12 target rows,
- 12 enriched rows,
- settlement buckets: one `under_2500`, two `10000_to_49999`, and nine
  `50000_plus`.

## Boundary

The Southern California target boxes are post-office-centered sample probes,
not city, ZIP, ZCTA, county, trade-area, or catchment boundaries.
