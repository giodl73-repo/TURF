# Overture Georgia Retail Complex Extraction: 2026-07-22.0

## Scope

First Georgia retail-complex candidate extract from Overture Places release
`2026-07-22.0`.

This mirrors the Washington retail-complex extract and tests whether malls,
shopping centers, plazas, marketplaces, and retail villages can support Atlanta
anchor modifiers.

## Included Name Signals

- `mall`
- `shopping center`
- `marketplace`
- `plaza`
- `village`

## Source Query

```powershell
duckdb -c ".read queries/overture-retail-complex-georgia-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-retail-complex-georgia-2026-07-22.csv
```

## Raw Counts

| Complex class | Rows |
|---|---:|
| Retail Village | 1075 |
| Mall | 797 |
| Retail Plaza | 337 |
| Marketplace | 144 |
| Shopping Center | 121 |
| Total | 2474 |

## Caveat

The raw name match is broad and noisy. It catches actual retail complexes, but
also tenants, apartments, professional offices, hotels, and other facilities
whose names contain `mall`, `plaza`, `village`, `marketplace`, or `shopping
center`.

The reviewed layer is the source of truth for RET profile use.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-georgia-2026-07-22.csv
```
