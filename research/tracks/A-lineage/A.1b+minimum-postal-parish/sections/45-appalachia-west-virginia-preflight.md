# Appalachia West Virginia Preflight

## Reusable Output

Source metadata:
`tables/west-virginia-appalachia-seed-source-2026-08-16.csv`.

Reviewed seed output:
`tables/west-virginia-appalachia-post-office-seed-2026-08-16.csv`.

Sample targets:
`tables/west-virginia-appalachia-post-office-sample-targets-2026-08-16.csv`.

Settlement join:
`tables/west-virginia-appalachia-settlement-join-2026-08-16.csv`.

Preflight outputs:

- `tables/west-virginia-appalachia-preflight-targets-2026-08-16.csv`,
- `tables/west-virginia-appalachia-preflight-enriched-targets-2026-08-16.csv`,
- `tables/west-virginia-appalachia-preflight-report-2026-08-16.csv`,
- `tables/west-virginia-appalachia-preflight-manifest-2026-08-16.csv`.

## Source

West Virginia is the first Appalachia breadth state. The source archive is the
Geofabrik OpenStreetMap GeoPackage:
`https://download.geofabrik.de/north-america/us/west-virginia-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-14T20:21:03Z` and ODbL
licensing.

## Seed And Settlement

The Geofabrik post-office extraction produced 687 post-office review rows:

- 679 named packet-ready post-office rows,
- 8 unnamed excluded post-office rows.

The first Appalachia target sample has 12 bounded post-office target boxes.
The Census 2020 PL plus Census geocoder settlement join resolves 11 of 12:

- `10000_to_49999`: 3,
- `2500_to_9999`: 5,
- `under_2500`: 3,
- `unknown`: 1.

The unresolved settlement proxy is Addison. It remains a settlement-join source
gate, not an exclusion from sidecar review.

## Preflight

The full West Virginia preflight passes with:

- 679 validated packet-ready seed rows,
- 12 target rows,
- 12 enriched rows,
- 12 `target_id` settlement joins.

## Boundary

This preflight creates a West Virginia/Appalachia sample input. It may not
claim West Virginia frequency, Appalachia frequency, national frequency,
smallest postal parish, complete OSM coverage, service adequacy, trade areas,
catchments, income, spending, or customer behavior.
