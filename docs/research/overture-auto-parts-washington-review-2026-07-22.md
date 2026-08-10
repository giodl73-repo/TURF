# Overture Washington Auto Parts Review: 2026-07-22.0

## Scope

First review pass for the Washington auto-parts candidate extract from Overture
Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and
packet-ready market analysis. It does not claim a final store census.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-auto-parts-washington-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv
```

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Exact duplicate `brand/address/city` rows after the first row are marked
  `exclude` with `review_reason=duplicate_candidate`.
- Obvious distribution or non-store rows are marked `exclude` with
  `review_reason=brand_false_positive`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 507 |
| `exclude` | 18 |
| Total | 525 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 27 |
| AutoZone | 106 |
| NAPA Auto Parts | 190 |
| O'Reilly Auto Parts | 184 |
| Total | 507 |

## Outlier Counts

| Review reason | Rows |
|---|---:|
| `duplicate_candidate` | 17 |
| `brand_false_positive` | 1 |

The one obvious false-positive row is `Autozone Distribution Pasco Washington`.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
```
