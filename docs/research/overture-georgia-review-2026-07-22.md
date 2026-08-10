# Overture Georgia Candidate Review: 2026-07-22.0

## Scope

First review pass for the Georgia Home Depot and Lowe's candidate extract from
Overture Places release `2026-07-22.0`.

This review does not claim a final store census. It creates an auditable layer
between raw candidate extraction and future packet generation.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-home-improvement-georgia-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv
```

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Names containing `Garden Center` are marked `needs_review` with
  `review_reason=garden_center_candidate`.
- Names containing `Rental` or `ProServices` are marked `needs_review` with
  `review_reason=rental_or_proservices_candidate`.
- Names containing `Foundation` are marked `exclude` with
  `review_reason=foundation_or_office_candidate`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 132 |
| `needs_review` | 3 |
| `exclude` | 1 |
| Total | 136 |

## Outlier Rows

| Brand | Store name | City | Review status | Review reason |
|---|---|---|---|---|
| Home Depot | The Home Depot Foundation | Atlanta | `exclude` | `foundation_or_office_candidate` |
| Home Depot | The Home Depot Rental | Lovejoy | `needs_review` | `rental_or_proservices_candidate` |
| Lowe's | Lowe's ProServices | Norcross | `needs_review` | `rental_or_proservices_candidate` |
| Lowe's | Lowe's Garden Center | Woodstock | `needs_review` | `garden_center_candidate` |

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
```
