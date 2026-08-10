# Overture Washington Candidate Review: 2026-07-22.0

## Scope

First review pass for the Washington Home Depot and Lowe's candidate extract
from Overture Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and
packet-ready market analysis. It does not claim a final store census.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-home-improvement-washington-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv
```

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Names containing `Garden Center` are marked `needs_review` with
  `review_reason=garden_center_candidate`.
- Names containing `Rental` or `ProServices` are marked `needs_review` with
  `review_reason=rental_or_proservices_candidate`.
- Names or addresses indicating corporate or office records are marked
  `exclude` with `review_reason=foundation_or_office_candidate`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 92 |
| `needs_review` | 6 |
| `exclude` | 2 |
| Total | 100 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Home Depot | 57 |
| Lowe's | 35 |
| Total | 92 |

## Outlier Rows

| Brand | Store name | City | Review status | Review reason |
|---|---|---|---|---|
| Home Depot | Compact Power Equipment Rental | Redmond | `needs_review` | `rental_or_proservices_candidate` |
| Home Depot | The Home Depot Rental | Vancouver | `needs_review` | `rental_or_proservices_candidate` |
| Lowe's | Lowe's Garden Center | Bremerton | `needs_review` | `garden_center_candidate` |
| Lowe's | Lowe's Garden Center | Federal Way | `needs_review` | `garden_center_candidate` |
| Lowe's | Lowe's | Lacey | `exclude` | `foundation_or_office_candidate` |
| Lowe's | Lowe's Home Improvement | Lacey | `exclude` | `foundation_or_office_candidate` |
| Lowe's | Lowe's Garden Center | Olympia | `needs_review` | `garden_center_candidate` |
| Lowe's | Lowe's Garden Center | Wenatchee | `needs_review` | `garden_center_candidate` |

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
```
