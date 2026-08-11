# Overture Georgia QSR Extraction: 2026-07-22.0

## Scope

Bounded extraction of QSR candidate places in Georgia from Overture Places
release `2026-07-22.0`.

This is a candidate layer, not a verified final store census.

## Source

- Release path:
  `2026-07-22.0/theme=places/type=place/`
- Source docs:
  - https://docs.overturemaps.org/guides/places/
  - https://docs.overturemaps.org/getting-data/cloud-sources/
  - https://docs.overturemaps.org/getting-data/duckdb/
  - https://docs.overturemaps.org/schema/reference/places/place/
  - https://docs.overturemaps.org/attribution/

## Query

The runnable DuckDB query is:

```text
queries/overture-qsr-georgia-2026-07-22.sql
```

It uses:

- Georgia address region: `addresses[1].region = 'GA'`
- Georgia bbox guard: longitude from `-85.7` to `-80.8`; latitude from `30.3`
  to `35.1`
- Overture brand metadata, not fallback place name matching
- open operating status
- non-empty address, city, state, and postal code fields

## Output

Output file:

```text
fixtures/stores/overture-qsr-georgia-2026-07-22.csv
```

Validated raw row count:

| Brand | Rows |
|---|---:|
| Burger King | 271 |
| McDonald's | 452 |
| Taco Bell | 256 |
| Wendy's | 290 |
| Total | 1269 |

## Caveats

- Rows are public POI candidates, not official franchise territories.
- Official restaurant locators may be used only for allowed manual validation.
- Airport, military, PO box, and non-ZCTA ZIP rows need review before county or
  CBSA joins.

## Validation

```powershell
duckdb -c ".read queries/overture-qsr-georgia-2026-07-22.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-qsr-georgia-2026-07-22.csv
```
