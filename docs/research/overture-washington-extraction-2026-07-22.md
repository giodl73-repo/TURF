# Overture Washington Extraction: 2026-07-22.0

## Scope

Bounded extraction of Home Depot and Lowe's candidate places in Washington from
Overture Places release `2026-07-22.0`.

This is a candidate layer, not a verified final store census.

## Source

- Release path verified through Azure blob listing:
  `2026-07-22.0/theme=places/type=place/`
- Source docs:
  - https://docs.overturemaps.org/guides/places/
  - https://docs.overturemaps.org/getting-data/cloud-sources/
  - https://docs.overturemaps.org/getting-data/duckdb/
  - https://docs.overturemaps.org/schema/reference/places/place/
  - https://docs.overturemaps.org/attribution/

## Filter

The extract used:

- Washington address region: `addresses[1].region = 'WA'`
- Washington bbox guard: longitude from `-125.0` to `-116.8`; latitude from
  `45.5` to `49.1`
- Brand names:
  - `home depot`
  - `the home depot`
  - `lowe's`
  - `lowes`
  - `lowe's home improvement`

## Output

Output file:

```text
fixtures/stores/overture-home-improvement-washington-2026-07-22.csv
```

Validated row count:

| Brand | Rows |
|---|---:|
| Home Depot | 59 |
| Lowe's | 41 |
| Total | 100 |

Every row carries:

- `source`: `Overture Places 2026-07-22.0`
- `source_date`: `2026-07-22`
- `license_status`: `open`

## Caveats

- Rows are public POI candidates, not official retailer territory claims.
- Candidate review must remove garden centers, rentals, offices, corporate
  records, stale records, and duplicated service points.
- Address text was normalized to remove commas because TURF's current CSV parser
  is intentionally simple and does not support quoted CSV fields yet.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-washington-2026-07-22.csv
```
