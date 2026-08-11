# Overture Washington Grocery Review: 2026-07-22.0

## Scope

First review pass for the Washington grocery candidate extract from Overture
Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and RET
profile use. It does not claim a final store census.

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Exact duplicate `brand/address/city` rows after the first row are marked
  `exclude` with `review_reason=duplicate_candidate`.
- Pharmacy, fuel, gas, distribution, warehouse, liquor, and deli rows are marked
  `exclude` with `review_reason=brand_false_positive`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 394 |
| `exclude` | 84 |
| Total | 478 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Albertsons | 18 |
| Fred Meyer | 34 |
| Grocery Outlet | 79 |
| Metropolitan Market | 9 |
| QFC | 48 |
| Safeway | 166 |
| Trader Joe's | 30 |
| Whole Foods Market | 10 |
| Total | 394 |

## North-End Impact

Grocery sharpens the neighborhood-service read:

- Northgate / Lake City gains four grocery brands and becomes
  `neighborhood_grocery_service_grid`.
- Lynnwood / Alderwood gains eight grocery rows across six brands, reinforcing
  `regional_anchor_absorber`.
- Everett gains 11 grocery rows across five brands, reinforcing
  `regional_anchor_node`.
- Mountlake Terrace and Kenmore are no longer pure thin rows; they have grocery
  service capacity even where big-box anchors are absent.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-washington-review-2026-07-22.csv
```
