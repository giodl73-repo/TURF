# New England Rhode Island Seed

## Reusable Output

Extraction script:
`scripts/extract_geofabrik_post_office_seed.py`.

Source metadata:
`tables/rhode-island-new-england-seed-source-2026-08-15.csv`.

Reviewed seed output:
`tables/rhode-island-new-england-post-office-seed-2026-08-15.csv`.

Sample target output:
`tables/rhode-island-new-england-post-office-sample-targets-2026-08-15.csv`.

## Source

The first next-wave breadth stratum is New England. Rhode Island is the first
implementation target because live Overpass state/bounding-box attempts timed
out, while the Geofabrik state GeoPackage extract is compact and reproducible.

The source archive is:
`https://download.geofabrik.de/north-america/us/rhode-island-latest-free.gpkg.zip`.

The archive README reports OSM data as of `2026-08-15T20:21:20Z` and ODbL
licensing.

## Extraction

The extractor reads `gis_osm_pois_free` and `gis_osm_pois_a_free` from the
GeoPackage and selects `fclass=post_office`. It emits the existing reviewed
civic seed schema used by the post-office sample builder.

The seed output has:

- 70 packet-ready post-office rows,
- 70 `RI` rows,
- zero duplicate packet-ready facility IDs,
- `review_reason=geofabrik_post_office_extract_address_limited`.

## Target Sample

The first Rhode Island target sample has 12 bounded post-office-centered target
boxes. These targets intentionally keep `settlement_size_proxy=not_joined`.

## Boundary

This pulse creates the first real next-wave open post-office seed extract and a
bounded target sample. It does not create a settlement-size join, run preflight,
run sidecar classification, claim New England frequency, or claim national
frequency.

## Next Gate

Build a versioned open settlement-size join for the Rhode Island seed or target
sample, validate it, then run the full preflight.
