# Overture Texas Retail-Complex Review: 2026-07-22.0

## Scope

Target-limited Texas retail-complex review for the Dallas/Fort Worth pre-scale
stack.

Generated output:

```text
fixtures/stores/overture-retail-complex-texas-review-2026-07-22.csv
```

## Review Counts

| Status | Rows |
|---|---:|
| `packet_ready` | 12 |
| `exclude` | 277 |

## Packet-Ready Rows

| Field | Complex |
|---|---|
| Downtown / Uptown Dallas | West Village |
| NorthPark / Preston Hollow | NorthPark Center |
| NorthPark / Preston Hollow | The Plaza At Preston Center |
| Galleria / Addison | Addison Walk Shopping Center |
| Legacy / Frisco / Plano | Legacy West Shopping Center |
| Legacy / Frisco / Plano | Stonebriar Mall |
| Las Colinas / Irving | Las Colinas Urban Center |
| Arlington / Grand Prairie | Lincoln Square Shopping Center |
| Southlake Town Square | Park Village |
| Fort Worth Cultural / West 7th | Montgomery Plaza |
| Fort Worth Cultural / West 7th | West 7th Plaza |

The reviewed fixture contains 12 packet-ready rows because one packet-ready
Irving Mall row sits outside the current Las Colinas / Irving target box and is
therefore not counted in the Dallas field summary.

## Use

The first consuming report is:

```text
reports/ret-dallas-anchor-field-retail-complex-summary.md
```
