# Overture Washington Auto Parts Extraction: 2026-07-22.0

## Scope

Bounded extraction of auto-parts candidate places in Washington from Overture
Places release `2026-07-22.0`.

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
- Brand filters:
  - `autozone%`
  - `o'reilly auto parts`
  - `oreilly auto parts`
  - `napa auto parts%`
  - `westbay napa autoparts`
  - `advance auto parts`

The filter intentionally avoids broad `napa` matching because that pulls in
Napavine and other false-positive place names.

## Output

Output file:

```text
fixtures/stores/overture-auto-parts-washington-2026-07-22.csv
```

Validated row count:

| Brand | Rows |
|---|---:|
| Advance Auto Parts | 27 |
| AutoZone | 112 |
| NAPA Auto Parts | 199 |
| O'Reilly Auto Parts | 187 |
| Total | 525 |

Every row carries:

- `source`: `Overture Places 2026-07-22.0`
- `source_date`: `2026-07-22`
- `license_status`: `open`

## Caveats

- Rows are public POI candidates, not official corporate territory claims.
- NAPA requires extra review because affiliated, independent, and parent-company
  naming appears in the candidate set.
- Address text was normalized to remove commas because TURF's current CSV parser
  is intentionally simple and does not support quoted CSV fields yet.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-auto-parts-washington-2026-07-22.csv
```
