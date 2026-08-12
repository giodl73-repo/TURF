# Overture Georgia Mass Retail Review: 2026-07-22.0

## Scope

First review pass for the Georgia mass-retail candidate extract from Overture
Places release `2026-07-22.0`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 231 |
| `exclude` | 9 |
| Total | 240 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Walmart | 143 |
| Target | 52 |
| Sam's Club | 21 |
| Costco | 15 |
| Total | 231 |

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-georgia-review-2026-07-22.csv
```
