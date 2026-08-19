# Northern California Seed and Preflight

## Reusable Output

Raw seed:
`tables/california-norcal-interior-post-office-seed-2026-08-16.csv`.

Seed semantics and public seed:

- `tables/california-norcal-interior-seed-semantics-review-2026-08-16.csv`,
- `tables/california-norcal-interior-public-post-office-seed-2026-08-16.csv`.

Targets and preflight:

- `tables/california-norcal-interior-post-office-sample-targets-2026-08-16.csv`,
- `tables/california-norcal-interior-settlement-join-2026-08-16.csv`,
- `tables/california-norcal-interior-preflight-targets-2026-08-16.csv`,
- `tables/california-norcal-interior-preflight-enriched-targets-2026-08-16.csv`,
- `tables/california-norcal-interior-preflight-report-2026-08-16.csv`.

## Source

The Northern California row uses Geofabrik's `norcal-latest-free.gpkg.zip`.
The downloaded file had `Last-Modified: 2026-08-16T00:08:49Z` and extracted
to `norcal.gpkg`.

Settlement context uses the Census 2020 PL California geography archive
`ca2020.pl.zip`, specifically `cageo2020.pl`, listed by Census with a
2021-08-12 directory timestamp.

## Result

The seed pass produced:

- 1,342 raw Geofabrik post-office rows,
- 927 reviewed public postal-anchor rows,
- 415 semantic-gated or non-public rows.

The deterministic sample seed `a1b-wave2-2026-08-16` selected 12 Northern
California target boxes.

The settlement preflight produced:

- 12 target rows,
- 12 enriched rows,
- settlement buckets: one `under_2500`, five `2500_to_9999`, three
  `10000_to_49999`, and three `50000_plus`.

## Boundary

The Northern California target boxes are post-office-centered sample probes,
not city, ZIP, ZCTA, county, trade-area, or catchment boundaries.
