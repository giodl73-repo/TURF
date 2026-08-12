# Overture Washington Drugstore Extraction: 2026-07-22.0

## Scope

First Washington exact-brand drugstore extract from Overture Places release
`2026-07-22.0`.

This layer is intentionally narrow. It captures brands exposed cleanly through
`brand.names.primary` and does not claim to be a complete pharmacy access
dataset.

## Included Brands

- Bartell Drugs
- CVS Pharmacy
- Walgreens

## Source Query

```powershell
duckdb -c ".read queries/overture-drugstore-washington-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-drugstore-washington-2026-07-22.csv
```

## Raw Counts

| Brand | Rows |
|---|---:|
| CVS Pharmacy | 32 |
| Bartell Drugs | 6 |
| Walgreens | 2 |
| Total | 40 |

## Coverage Caveat

Overture's exact brand field undercounts this category in Washington. Rite Aid
did not appear as a clean exact-brand row in this release, and many supermarket,
Costco, Walmart, Target, and independent pharmacy rows appear through store
names, categories, or parent store brands rather than the narrow drugstore brand
filter.

For RET, this layer should be read as a clean drugstore-brand signal, not as a
complete pharmacy-access model.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-washington-2026-07-22.csv
```
