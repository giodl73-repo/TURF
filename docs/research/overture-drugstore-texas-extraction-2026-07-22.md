# Overture Texas Drugstore Extraction: 2026-07-22.0

## Scope

Texas exact-brand drugstore extract from Overture Places release
`2026-07-22.0`.

This layer supports the Dallas/Fort Worth pre-scale stack as a health-errand
proxy after grocery and mass retail established everyday-service and big-box
signals.

## Included Brands

- CVS Pharmacy
- Good Neighbor Pharmacy
- Rite Aid
- Walgreens

## Raw Counts

| Brand | Rows |
|---|---:|
| CVS Pharmacy | 600 |
| Walgreens | 37 |
| Total | 637 |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-texas-2026-07-22.csv
```
