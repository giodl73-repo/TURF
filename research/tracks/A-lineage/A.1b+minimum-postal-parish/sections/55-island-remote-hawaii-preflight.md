# Island Remote Hawaii Preflight

## Reusable Output

Source metadata:
`tables/hawaii-island-remote-seed-source-2026-08-16.csv`.

Reviewed seed output:
`tables/hawaii-island-remote-post-office-seed-2026-08-16.csv`.

Sample targets:
`tables/hawaii-island-remote-post-office-sample-targets-2026-08-16.csv`.

Settlement join:
`tables/hawaii-island-remote-settlement-join-2026-08-16.csv`.

Preflight outputs:

- `tables/hawaii-island-remote-preflight-targets-2026-08-16.csv`,
- `tables/hawaii-island-remote-preflight-enriched-targets-2026-08-16.csv`,
- `tables/hawaii-island-remote-preflight-report-2026-08-16.csv`,
- `tables/hawaii-island-remote-preflight-manifest-2026-08-16.csv`.

## Source

Hawaii is the first Island and Remote breadth state. The source archive is the
Geofabrik OpenStreetMap GeoPackage:
`https://download.geofabrik.de/north-america/us/hawaii-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-14T20:21:03Z` and ODbL
licensing.

The Census settlement proxy uses Hawaii 2020 PL 94-171 geography:
`https://www2.census.gov/programs-surveys/decennial/2020/data/01-Redistricting_File--PL_94-171/Hawaii/hi2020.pl.zip`.

California Interior was considered as the next roadmap stratum, but Geofabrik
does not currently publish a California `.gpkg.zip` on the U.S. state download
index. The Hawaii run keeps the current GeoPackage workflow unchanged.

## Seed And Settlement

The Geofabrik post-office extraction produced 97 post-office review rows:

- 79 named packet-ready post-office rows,
- 18 unnamed excluded post-office rows.

The first Island and Remote target sample has 12 bounded post-office target
boxes. The Census 2020 PL plus Census geocoder settlement join resolves all 12:

- `50000_plus`: 6,
- `10000_to_49999`: 3,
- `2500_to_9999`: 3.

## Preflight

The full Hawaii preflight passes with:

- 79 validated packet-ready seed rows,
- 12 target rows,
- 12 enriched rows,
- zero unresolved settlement proxies.

## Boundary

This preflight creates a Hawaii/Island and Remote sample input. It may not
claim Hawaii frequency, Island and Remote frequency, national frequency,
smallest postal parish, complete OSM coverage, service adequacy, trade areas,
catchments, income, spending, or customer behavior.
