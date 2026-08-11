# Overture Georgia Auto Parts Extraction: 2026-07-22.0

## Scope

Bounded extraction of auto-parts candidate places in Georgia from Overture
Places release `2026-07-22.0`.

This is a candidate layer, not a verified final store census.

## Source

- Overture Places release:
  `2026-07-22.0/theme=places/type=place/`
- Source docs:
  - https://docs.overturemaps.org/guides/places/
  - https://docs.overturemaps.org/getting-data/cloud-sources/
  - https://docs.overturemaps.org/getting-data/duckdb/
  - https://docs.overturemaps.org/schema/reference/places/place/
  - https://docs.overturemaps.org/attribution/

## Filter

The extract used:

- Georgia address region: `addresses[1].region = 'GA'`
- Georgia bbox guard: longitude from `-85.7` to `-80.8`; latitude from `30.3`
  to `35.1`
- Brand filters:
  - `autozone%`
  - `o'reilly auto parts`
  - `oreilly auto parts`
  - `napa auto parts%`
  - `westbay napa autoparts`
  - `advance auto parts`

The NAPA filter remains intentionally narrow because broad `napa` matching can
pull unrelated place names.

## Output

Output file:

```text
fixtures/stores/overture-auto-parts-georgia-2026-07-22.csv
```

Validated raw row count:

| Brand | Rows |
|---|---:|
| Advance Auto Parts | 246 |
| AutoZone | 227 |
| NAPA Auto Parts | 17 |
| O'Reilly Auto Parts | 249 |
| Total | 739 |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-auto-parts-georgia-2026-07-22.csv
```
