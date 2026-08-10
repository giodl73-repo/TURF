# Overture Georgia Extraction: 2026-07-22.0

## Scope

Bounded extraction of Home Depot and Lowe's candidate places in Georgia from
Overture Places release `2026-07-22.0`.

This is the first live Overture-derived store candidate file in TURF. It is not
yet a verified final store list.

## Source

- Release path verified through Azure blob listing:
  `2026-07-22.0/theme=places/type=place/`
- Schema probed with DuckDB against one release part.
- Source docs:
  - https://docs.overturemaps.org/guides/places/
  - https://docs.overturemaps.org/getting-data/cloud-sources/
  - https://docs.overturemaps.org/getting-data/duckdb/
  - https://docs.overturemaps.org/schema/reference/places/place/
  - https://docs.overturemaps.org/attribution/

## Verified Fields

The active release exposes the fields TURF needs for this candidate pass:

- `id`
- `brand.names.primary`
- `names.primary`
- `addresses[1].freeform`
- `addresses[1].locality`
- `addresses[1].region`
- `addresses[1].postcode`
- `bbox.ymin`
- `bbox.xmin`
- `operating_status`
- `basic_category`

## Filter

The extract used:

- Georgia address region: `addresses[1].region = 'GA'`
- Georgia bbox guard: longitude from `-85.7` to `-80.8`; latitude from `30.3`
  to `35.1`
- Brand names:
  - `home depot`
  - `the home depot`
  - `lowe's`
  - `lowes`
  - `lowe's home improvement`

## Output

Output file:

```text
fixtures/stores/overture-home-improvement-georgia-2026-07-22.csv
```

Validated row count:

| Brand | Rows |
|---|---:|
| Home Depot | 92 |
| Lowe's | 44 |
| Total | 136 |

Every row carries:

- `source`: `Overture Places 2026-07-22.0`
- `source_date`: `2026-07-22`
- `license_status`: `open`

## Caveats

- Rows are candidates, not a final verified store census.
- Candidate review must check duplicate records, stale locations, garden centers,
  distribution centers, offices, and other brand false positives.
- Address text was normalized to remove commas because TURF's current CSV parser
  is intentionally simple and does not support quoted CSV fields yet.
- This extract should feed a review packet before any broader Southeast or
  national extraction.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-georgia-2026-07-22.csv
```
