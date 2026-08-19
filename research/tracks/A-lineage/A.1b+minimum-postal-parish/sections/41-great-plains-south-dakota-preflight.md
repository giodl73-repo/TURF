# Great Plains South Dakota Preflight

## Reusable Output

Source metadata:
`tables/south-dakota-great-plains-seed-source-2026-08-15.csv`.

Reviewed seed output:
`tables/south-dakota-great-plains-post-office-seed-2026-08-15.csv`.

Sample targets:
`tables/south-dakota-great-plains-post-office-sample-targets-2026-08-15.csv`.

Settlement join:
`tables/south-dakota-great-plains-settlement-join-2026-08-15.csv`.

Preflight outputs:

- `tables/south-dakota-great-plains-preflight-targets-2026-08-15.csv`,
- `tables/south-dakota-great-plains-preflight-enriched-targets-2026-08-15.csv`,
- `tables/south-dakota-great-plains-preflight-report-2026-08-15.csv`,
- `tables/south-dakota-great-plains-preflight-manifest-2026-08-15.csv`.

## Source

South Dakota is the first Great Plains breadth state. The source archive is the
Geofabrik OpenStreetMap GeoPackage:
`https://download.geofabrik.de/north-america/us/south-dakota-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-15T20:21:20Z` and ODbL
licensing.

## Seed And Settlement

The Geofabrik post-office extraction produced 259 post-office review rows:

- 252 named packet-ready post-office rows,
- 7 unnamed excluded post-office rows.

The first Great Plains target sample has 12 bounded post-office target boxes.
The Census 2020 PL plus Census geocoder settlement join resolves all 12:

- `10000_to_49999`: 1,
- `under_2500`: 11.

## Preflight

The full South Dakota preflight passes with:

- 252 validated packet-ready seed rows,
- 12 target rows,
- 12 enriched rows,
- 12 `target_id` settlement joins.

## Boundary

This preflight creates a South Dakota/Great Plains sample input. It may not
claim South Dakota frequency, Great Plains frequency, national frequency,
smallest postal parish, complete OSM coverage, service adequacy, trade areas,
catchments, income, spending, or customer behavior.
