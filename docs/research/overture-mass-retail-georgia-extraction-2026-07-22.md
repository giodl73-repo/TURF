# Overture Georgia Mass Retail Extraction: 2026-07-22.0

## Scope

Georgia mass-retail extract from Overture Places release `2026-07-22.0`.

This mirrors the Washington mass-retail layer so Atlanta district anchor
profiles can compare against the same category family.

## Included Brands

- Costco
- Sam's Club
- Target
- Walmart

## Raw Counts

| Brand | Rows |
|---|---:|
| Walmart | 149 |
| Target | 53 |
| Sam's Club | 21 |
| Costco | 17 |
| Total | 240 |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-georgia-2026-07-22.csv
```
