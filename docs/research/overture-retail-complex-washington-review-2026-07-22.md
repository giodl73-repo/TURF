# Overture Washington Retail Complex Review: 2026-07-22.0

## Scope

First review pass for the Washington retail-complex candidate extract from
Overture Places release `2026-07-22.0`.

This review keeps only high-confidence named retail complexes for RET anchor
evidence. It does not claim a complete mall or shopping-center census.

## Review Rules

- High-confidence named complexes are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Complex aliases after the preferred row are marked `exclude` with
  `review_reason=duplicate_candidate`.
- Tenants, non-retail facilities, apartments, churches, clinics, offices, and
  other name-match noise are marked `exclude` with
  `review_reason=brand_false_positive`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 15 |
| `exclude` | 1669 |
| Total | 1684 |

## North-End Packet-Ready Rows

| City | Complex |
|---|---|
| Seattle | Northgate Mall |
| Lynnwood | Alderwood Mall |
| Everett | Everett Mall |
| Everett | Andersons Shopping Center |
| Everett | Cascade Plaza |
| Everett | Mariner Marketplace |
| Lynnwood | Alderwood Plaza |
| Lynnwood | Crossroads Shopping Center |
| Lynnwood | James Village Shopping Center |
| Mountlake Terrace | Alderwood Plaza |
| Mountlake Terrace | Mountlake Terrace Plaza |
| Mountlake Terrace | West Plaza Marketplace MLT |
| Edmonds | Aurora Marketplace |
| Edmonds | The Village at Westgate |
| Bothell | North Creek Plaza |

## North-End Impact

The retail-complex layer supports the anchor vocabulary:

- Lynnwood / Alderwood gains four retail-complex rows, including Alderwood Mall.
- Everett gains four retail-complex rows, including Everett Mall.
- Northgate / Lake City gains a legacy mall signal from Northgate Mall, but its
  store stack still reads as neighborhood grocery-service rather than a current
  regional anchor.
- Edmonds and Mountlake Terrace gain smaller plaza/marketplace rows, supporting
  edge-service evidence rather than regional-anchor evidence.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-washington-review-2026-07-22.csv
```
