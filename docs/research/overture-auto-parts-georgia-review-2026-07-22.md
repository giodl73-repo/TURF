# Overture Georgia Auto Parts Review: 2026-07-22.0

## Scope

First review pass for the Georgia auto-parts candidate extract from Overture
Places release `2026-07-22.0`.

This review creates an auditable layer between raw candidate extraction and
packet-ready market analysis. It does not claim a final store census.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-auto-parts-georgia-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-auto-parts-georgia-review-2026-07-22.csv
```

## Review Rules

- Default rows are marked `packet_ready` with
  `review_reason=primary_store_candidate`.
- Exact duplicate `brand/address/city` rows after the first row are marked
  `exclude` with `review_reason=duplicate_candidate`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 734 |
| `exclude` | 5 |
| Total | 739 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Advance Auto Parts | 246 |
| AutoZone | 222 |
| NAPA Auto Parts | 17 |
| O'Reilly Auto Parts | 249 |
| Total | 734 |

## Geography Context

The packet-ready layer reaches:

- 278 ZIP-derived ZCTA candidates
- 125 Georgia counties

The ZCTA/county context is based on the Census 2020 ZCTA5 County relationship
file. County/CBSA context is based on the Census July 2023 CBSA delineation
file, with explicit `non_cbsa` fallback rows for Georgia counties outside CBSA
coverage.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-auto-parts-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-auto-parts-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-auto-parts-county-cbsa-2023.csv
```
