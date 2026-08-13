# Overture Texas Retail-Complex Extraction: 2026-07-22.0

## Scope

Texas retail-complex candidate extract from Overture Places release
`2026-07-22.0`.

This layer is target-confirmation evidence for Dallas/Fort Worth anchor fields.
It does not claim a complete Texas mall or shopping-center census.

## Source Query

```powershell
duckdb -c ".read queries/overture-retail-complex-texas-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-retail-complex-texas-2026-07-22.csv
```

## Raw Counts

| Type | Rows |
|---|---:|
| Retail Center | 36711 |
| Retail Village | 3014 |
| Retail District | 2441 |
| Mall | 1679 |
| Retail Plaza | 1651 |
| Shopping Center | 350 |
| Marketplace | 321 |
| Total | 46167 |

## Review Standard

The raw candidate layer is broad and noisy because terms such as `center`,
`village`, and `plaza` match medical, civic, service, tenant, and office names.
The reviewed layer is intentionally target-limited. It promotes only
high-confidence named complexes for the selected Dallas/Fort Worth fields and
keeps selected rejected rows as duplicate-candidate review evidence.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-texas-review-2026-07-22.csv
```
