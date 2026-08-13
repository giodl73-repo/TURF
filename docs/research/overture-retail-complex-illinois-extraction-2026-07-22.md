# Overture Illinois Retail Complex Extraction: 2026-07-22.0

## Scope

Illinois retail-complex candidate extract from Overture Places release
`2026-07-22.0`.

This layer is target-confirmation evidence for Chicago anchor fields. It does
not claim a complete Illinois mall or shopping-center census.

## Source Query

```powershell
duckdb -c ".read queries/overture-retail-complex-illinois-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-retail-complex-illinois-2026-07-22.csv
```

## Review Standard

The reviewed layer keeps high-confidence named complexes for the selected
Chicago fields and excludes tenant rows, businesses that merely contain a mall
or plaza word, duplicate aliases, and unrelated civic/service rows.

## Raw Counts

| Type | Rows |
|---|---:|
| Retail Center | 15972 |
| Retail District | 2497 |
| Retail Village | 2197 |
| Mall | 786 |
| Retail Plaza | 636 |
| Marketplace | 129 |
| Shopping Center | 104 |
| Total | 22321 |

## Review Counts

The reviewed layer is intentionally target-limited. It promotes only nine
high-confidence rows for the selected Chicago fields and excludes 142 matched
target-name rows as duplicate candidates or false positives.

| Status | Rows |
|---|---:|
| packet_ready | 9 |
| exclude | 142 |

## Packet-Ready Rows

| Field | Complex |
|---|---|
| Old Orchard / Skokie | Westfield Old Orchard Mall |
| Oakbrook widened | Oakbrook Center |
| Oakbrook widened | The District at Oakbrook Center |
| Woodfield / Schaumburg | Woodfield Mall |
| Woodfield / Schaumburg | Woodfield Village Green |
| Midway / Ford City | Ford City Mall |
| Midway / Ford City | Burbank Shopping Center |
| Orland Square | Orland Square Mall |
| Orland Square | Orland Square Shopping Center |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-illinois-review-2026-07-22.csv
```
