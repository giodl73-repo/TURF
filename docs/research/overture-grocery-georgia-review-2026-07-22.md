# Overture Georgia Grocery Review: 2026-07-22.0

## Scope

First review pass for the Georgia grocery candidate extract from Overture
Places release `2026-07-22.0`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 502 |
| `exclude` | 130 |
| Total | 632 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Publix | 217 |
| Kroger | 103 |
| ALDI | 91 |
| Food Depot | 42 |
| Sprouts Farmers Market | 16 |
| Whole Foods Market | 12 |
| Piggly Wiggly | 9 |
| Trader Joe's | 9 |
| Winn-Dixie | 3 |
| Total | 502 |

## Atlanta District Impact

Grocery changes the Atlanta district read:

- Buckhead / Lenox / Phipps becomes an `urban_mall_grocery_grid`.
- Northlake becomes a `legacy_mall_grocery_service_grid`.
- Decatur / Emory gains grocery depth around Emory Village.
- Cumberland / Vinings gains grocery and mass-retail support, but the district
  still needs refined geometry to capture Cumberland Mall and Cumberland
  Marketplace together.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-georgia-review-2026-07-22.csv
```
