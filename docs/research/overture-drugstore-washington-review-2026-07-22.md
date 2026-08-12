# Overture Washington Drugstore Review: 2026-07-22.0

## Scope

First review pass for the Washington exact-brand drugstore candidate extract
from Overture Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and RET
profile use. It does not claim a final pharmacy census.

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Exact duplicate `brand/address/city` rows after the first row are marked
  `exclude` with `review_reason=duplicate_candidate`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 38 |
| `exclude` | 2 |
| Total | 40 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| CVS Pharmacy | 30 |
| Bartell Drugs | 6 |
| Walgreens | 2 |
| Total | 38 |

## North-End Impact

The exact-brand drugstore layer is sparse but useful:

- Everett gains three drugstore rows across two brands.
- Lynnwood / Alderwood, Shoreline, and Bothell each gain one drugstore row.
- Aurora, Northgate / Lake City, Edmonds, Mountlake Terrace, Kenmore, and Mill
  Creek do not gain clean exact-brand drugstore rows in this release.

That means the layer supports service-completeness evidence where it appears,
but absence should not be treated as proof of no pharmacy access.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-washington-review-2026-07-22.csv
```
