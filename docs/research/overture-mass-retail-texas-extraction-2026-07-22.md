# Overture Texas Mass-Retail Extraction: 2026-07-22.0

## Scope

Texas Target / Walmart / Costco / Sam's Club extract from Overture Places
release `2026-07-22.0`.

This layer supports the Dallas/Fort Worth pre-scale stack by testing
household-trip and big-box anchor signal after grocery proved all target
fields carry everyday-service texture.

## Included Brands

- Costco
- Sam's Club
- Target
- Walmart

## Raw Counts

| Brand | Rows |
|---|---:|
| Walmart | 434 |
| Target | 165 |
| Sam's Club | 79 |
| Costco | 44 |
| Total | 722 |

## Review Rule

The reviewed layer keeps primary banner-matching store candidates and excludes
pharmacy, optical, vision, fuel, gas, tire, auto, distribution, fulfillment,
non-Costco warehouse, photo, bakery, garden-center, and brand/name mismatch
rows.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-texas-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-texas-review-2026-07-22.csv
```
