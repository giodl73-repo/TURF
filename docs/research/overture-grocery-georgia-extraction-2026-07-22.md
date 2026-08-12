# Overture Georgia Grocery Extraction: 2026-07-22.0

## Scope

Georgia grocery extract from Overture Places release `2026-07-22.0`.

This mirrors the Washington grocery layer with Georgia-relevant grocery brands.

## Included Brands

- ALDI
- Food Depot
- Ingles
- Kroger
- Piggly Wiggly
- Publix
- Sprouts Farmers Market
- Trader Joe's
- Whole Foods Market
- Winn-Dixie

## Raw Counts

| Brand | Rows |
|---|---:|
| Kroger | 227 |
| Publix | 219 |
| ALDI | 92 |
| Food Depot | 42 |
| Sprouts Farmers Market | 16 |
| Whole Foods Market | 12 |
| Piggly Wiggly | 9 |
| Trader Joe's | 9 |
| Ingles | 3 |
| Winn-Dixie | 3 |
| Total | 632 |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-georgia-2026-07-22.csv
```
