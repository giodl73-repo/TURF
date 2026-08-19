# Mountain West Wyoming Preflight

## Reusable Output

Source metadata:
`tables/wyoming-mountain-west-seed-source-2026-08-16.csv`.

Reviewed seed output:
`tables/wyoming-mountain-west-post-office-seed-2026-08-16.csv`.

Sample targets:
`tables/wyoming-mountain-west-post-office-sample-targets-2026-08-16.csv`.

Settlement join:
`tables/wyoming-mountain-west-settlement-join-2026-08-16.csv`.

Preflight outputs:

- `tables/wyoming-mountain-west-preflight-targets-2026-08-16.csv`,
- `tables/wyoming-mountain-west-preflight-enriched-targets-2026-08-16.csv`,
- `tables/wyoming-mountain-west-preflight-report-2026-08-16.csv`,
- `tables/wyoming-mountain-west-preflight-manifest-2026-08-16.csv`.

## Source

Wyoming is the first Mountain West breadth state. The source archive is the
Geofabrik OpenStreetMap GeoPackage:
`https://download.geofabrik.de/north-america/us/wyoming-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-15T20:21:20Z` and ODbL
licensing.

The Census settlement proxy uses Wyoming 2020 PL 94-171 geography:
`https://www2.census.gov/programs-surveys/decennial/2020/data/01-Redistricting_File--PL_94-171/Wyoming/wy2020.pl.zip`.

## Seed And Settlement

The Geofabrik post-office extraction produced 110 post-office review rows:

- 84 named packet-ready post-office rows,
- 26 unnamed excluded post-office rows.

The first Mountain West target sample has 12 bounded post-office target boxes.
The Census 2020 PL plus Census geocoder settlement join resolves all 12:

- `50000_plus`: 4,
- `10000_to_49999`: 1,
- `2500_to_9999`: 4,
- `under_2500`: 3.

## Preflight

The full Wyoming preflight passes with:

- 84 validated packet-ready seed rows,
- 12 target rows,
- 12 enriched rows,
- zero unresolved settlement proxies.

## Boundary

This preflight creates a Wyoming/Mountain West sample input. It may not claim
Wyoming frequency, Mountain West frequency, national frequency, smallest postal
parish, complete OSM coverage, service adequacy, trade areas, catchments,
income, spending, or customer behavior.
