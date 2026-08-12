# Overture Georgia Retail Complex Review: 2026-07-22.0

## Scope

First review pass for the Georgia retail-complex candidate extract from Overture
Places release `2026-07-22.0`.

This review keeps high-confidence named complexes for selected Atlanta
comparison places. It does not claim a complete Georgia mall or shopping-center
census.

## Review Rules

- High-confidence named complexes are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Complex aliases and tenant rows after the preferred row are marked `exclude`
  with `review_reason=duplicate_candidate`.
- Other name-match noise is marked `exclude` with
  `review_reason=brand_false_positive`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 13 |
| `exclude` | 2461 |
| Total | 2474 |

## Packet-Ready Rows

| City | Complex |
|---|---|
| Atlanta | Ansley Mall |
| Atlanta | Buckhead Village District - Lot F |
| Atlanta | East Atlanta Village Farmers Market |
| Atlanta | Emory Village |
| Atlanta | Greenbriar Mall |
| Atlanta | Lenox Mall Buckhead Atlanta |
| Atlanta | Northlake Mall |
| Atlanta | Perimeter Mall |
| Atlanta | Phipps Plaza |
| Alpharetta | North Point Mall |
| East Point | Camp Creek Marketplace |
| Atlanta | Cumberland Mall |
| Smyrna | Cumberland Marketplace |

## Review Correction

The Cumberland Mall review keeps the in-district Atlanta point at `2860
Cumberland Mall SE` and excludes the outlying Marietta duplicate. This matters
for the Atlanta district anchor profile because Cumberland/Vinings should carry
both Cumberland Mall and Cumberland Marketplace.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-georgia-review-2026-07-22.csv
```
