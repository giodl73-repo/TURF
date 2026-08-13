# Overture Texas Grocery Extraction: 2026-07-22.0

## Scope

Texas grocery extract from Overture Places release `2026-07-22.0`.

This layer supports the Dallas/Fort Worth pre-scale stack with an open,
non-Overpass everyday-service source after the first post-office layer exposed
several Overpass target timeouts.

## Included Brands

- ALDI
- Albertsons
- Central Market
- Fiesta Mart
- H-E-B
- Kroger
- Market Street
- Sprouts Farmers Market
- Tom Thumb
- Trader Joe's
- Whole Foods Market

## Raw Counts

| Brand | Rows |
|---|---:|
| H-E-B | 501 |
| Kroger | 293 |
| ALDI | 136 |
| Fiesta Mart | 88 |
| Tom Thumb | 78 |
| Sprouts Farmers Market | 55 |
| Albertsons | 50 |
| Whole Foods Market | 30 |
| Trader Joe's | 25 |
| Market Street | 20 |
| Central Market | 11 |
| Total | 1287 |

## Review Rule

The reviewed layer excludes brand-attached service rows whose names indicate
pharmacy, fuel, gas, floral, pickup, delivery, office, division, or express
formats. The remaining rows are packet-ready primary grocery candidates.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-texas-review-2026-07-22.csv
```
