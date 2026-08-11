# Overture Washington Mass Retail Review: 2026-07-22.0

## Scope

First review pass for the Washington mass-retail candidate extract from
Overture Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and RET
profile use. It does not claim a final store census.

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Exact duplicate `brand/address/city` rows after the first row are marked
  `exclude` with `review_reason=duplicate_candidate`.
- Pharmacy, optical, tire, warehouse, and distribution-center rows are marked
  `exclude` with `review_reason=brand_false_positive`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 115 |
| `exclude` | 16 |
| Total | 131 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Costco | 30 |
| Target | 36 |
| Walmart | 49 |
| Total | 115 |

## North-End Impact

In the North Seattle / South Snohomish focus zones:

- Lynnwood / Alderwood adds five mass-retail rows across Costco, Target, and
  Walmart.
- Everett adds Costco, Target, and Walmart.
- Northgate / Lake City adds one Target row.
- Shoreline adds one Costco row.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-washington-review-2026-07-22.csv
```
