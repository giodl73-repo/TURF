# Southwest Borderlands New Mexico Preflight

## Reusable Output

Source metadata:
`tables/new-mexico-southwest-borderlands-seed-source-2026-08-16.csv`.

Reviewed seed output:
`tables/new-mexico-southwest-borderlands-post-office-seed-2026-08-16.csv`.

Sample targets:
`tables/new-mexico-southwest-borderlands-post-office-sample-targets-2026-08-16.csv`.

Settlement join:
`tables/new-mexico-southwest-borderlands-settlement-join-2026-08-16.csv`.

Preflight outputs:

- `tables/new-mexico-southwest-borderlands-preflight-targets-2026-08-16.csv`,
- `tables/new-mexico-southwest-borderlands-preflight-enriched-targets-2026-08-16.csv`,
- `tables/new-mexico-southwest-borderlands-preflight-report-2026-08-16.csv`,
- `tables/new-mexico-southwest-borderlands-preflight-manifest-2026-08-16.csv`.

## Source

New Mexico is the first Southwest Borderlands breadth state. The source archive
is the Geofabrik OpenStreetMap GeoPackage:
`https://download.geofabrik.de/north-america/us/new-mexico-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-15T20:21:20Z` and ODbL
licensing.

The Census settlement proxy uses New Mexico 2020 PL 94-171 geography:
`https://www2.census.gov/programs-surveys/decennial/2020/data/01-Redistricting_File--PL_94-171/New_Mexico/nm2020.pl.zip`.

## Seed And Settlement

The Geofabrik post-office extraction produced 422 post-office review rows:

- 395 named packet-ready post-office rows,
- 27 unnamed excluded post-office rows.

The first Southwest Borderlands target sample has 12 bounded post-office target
boxes. The Census 2020 PL plus Census geocoder settlement join resolves all 12:

- `50000_plus`: 5,
- `10000_to_49999`: 2,
- `2500_to_9999`: 5.

## Preflight

The full New Mexico preflight passes with:

- 395 validated packet-ready seed rows,
- 12 target rows,
- 12 enriched rows,
- zero unresolved settlement proxies.

## Boundary

This preflight creates a New Mexico/Southwest Borderlands sample input. It may
not claim New Mexico frequency, Southwest Borderlands frequency, national
frequency, smallest postal parish, complete OSM coverage, service adequacy,
trade areas, catchments, income, spending, or customer behavior.
