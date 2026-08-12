# Overture Washington Retail Complex Extraction: 2026-07-22.0

## Scope

First Washington retail-complex candidate extract from Overture Places release
`2026-07-22.0`.

This layer tests whether named malls, shopping centers, plazas, marketplaces,
and retail villages can support RET anchor evidence. It is a name-based
candidate extract and requires review before profile use.

## Included Name Signals

- `mall`
- `shopping center`
- `marketplace`
- `plaza`
- `village`

## Source Query

```powershell
duckdb -c ".read queries/overture-retail-complex-washington-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-retail-complex-washington-2026-07-22.csv
```

## Raw Counts

| Complex class | Rows |
|---|---:|
| Retail Village | 756 |
| Mall | 461 |
| Retail Plaza | 313 |
| Marketplace | 101 |
| Shopping Center | 53 |
| Total | 1684 |

## Caveat

The raw name match is intentionally broad and noisy. It catches actual retail
complexes, but also tenants, apartments, churches, event venues, clinics,
professional offices, and ordinary businesses whose names contain words such as
`mall`, `plaza`, or `village`.

The reviewed layer is the source of truth for RET profile use.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-washington-2026-07-22.csv
```
