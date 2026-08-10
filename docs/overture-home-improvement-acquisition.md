# Overture Home Improvement Acquisition

This is TURF's first approved path toward national Home Depot and Lowe's store
coverage.

## Source

- Overture Places guide: https://docs.overturemaps.org/guides/places/
- Overture cloud data access: https://docs.overturemaps.org/getting-data/cloud-sources/
- Overture DuckDB access: https://docs.overturemaps.org/getting-data/duckdb/
- Overture place schema: https://docs.overturemaps.org/schema/reference/places/place/
- Overture attribution and licensing: https://docs.overturemaps.org/attribution/

## Policy

Use Overture Places as the first open POI research target. Do not use Home
Depot or Lowe's official store locators as the committed dataset source.

Overture extraction must:

- Query only the needed place records.
- Preserve source release/date.
- Preserve license status as `open`.
- Normalize into the national store intake contract.
- Validate with `turf-cli validate-stores`.
- Keep the raw bulk extract out of the repo unless a future pulse explicitly
  approves a small checked-in fixture.

## Candidate Filters

Initial brand filters:

- `Home Depot`
- `The Home Depot`
- `Lowe's`
- `Lowes`
- `Lowe's Home Improvement`

Candidate rows should be reviewed for:

- Duplicate records.
- Closed or stale stores.
- Distribution centers, offices, or unrelated branded facilities.
- Missing address or coordinate fields.
- Brand-name false positives.

## Target Output

The normalized output must use:

```text
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status
```

## Draft DuckDB Shape

This is a planning sketch, not a committed extractor:

```sql
select
  brand.names.primary as brand,
  id as store_id,
  names.primary as store_name,
  addresses[1].freeform as address,
  addresses[1].locality as city,
  addresses[1].region as state,
  addresses[1].postcode as postal_code,
  st_y(geometry) as latitude,
  st_x(geometry) as longitude,
  'Overture Places' as source,
  '<release-date>' as source_date,
  'open' as license_status
from read_parquet('<overture places release path>')
where lower(brand.names.primary) in (
  'home depot',
  'the home depot',
  'lowe''s',
  'lowes',
  'lowe''s home improvement'
);
```

The exact field paths must be verified against the active Overture release
before running a real extract.

## First Bounded Extract

The first bounded live extract is documented in
`docs/research/overture-georgia-extraction-2026-07-22.md`.
