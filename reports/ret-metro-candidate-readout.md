# RET Metro Candidate Readout

## Scope

This report records the first rule-based Retail Enclave Typology candidate pass.
The command is conservative and feature-based. It suggests RET labels from
packet-ready metro features, but the checked-in examples remain the reviewed
source of truth.

Command shape:

```powershell
cargo run -p turf-cli -- suggest-ret-metro <category> <reviewed-stores.csv> <zcta-county.csv> <county-cbsa.csv>
```

Generated outputs:

```text
reports/ret-home-improvement-washington-metro-candidates.csv
reports/ret-auto-parts-washington-metro-candidates.csv
```

## Features

The first candidate pass uses:

- total packet-ready stores
- brand count
- leader / primary brand
- leader share
- nearest opposite-brand spacing
- category hint
- metro / non-CBSA geography context

## Rule Shape

Home improvement is treated as a destination big-box category. Two-brand
home-improvement metros are suggested as `anchor_market`.

Auto parts is treated as a local service category:

- large, multi-brand, low-leader-share metros become `contested_service_grid`
- multi-brand metros with a clear leader become `brand_led_service_mesh`
- smaller multi-brand service geographies become `service_mesh`
- very small metros remain `anchor_market` until more category-specific rules
  exist

## Washington Results

Home improvement:

| Suggested type | Metros/regions |
|---|---:|
| `anchor_market` | 18 |

Auto parts:

| Suggested type | Metros/regions |
|---|---:|
| `anchor_market` | 9 |
| `brand_led_service_mesh` | 5 |
| `contested_service_grid` | 6 |
| `service_mesh` | 4 |

## Key Examples

| Category | Geography | Suggested type | Evidence |
|---|---|---|---|
| Home improvement | Seattle-Tacoma-Bellevue WA | `anchor_market` | 42 stores, 2 brands, Home Depot leader share 0.619. |
| Auto parts | Seattle-Tacoma-Bellevue WA | `contested_service_grid` | 197 stores, 4 brands, O'Reilly leader share 0.452, nearest opposite brand 0.01 miles. |
| Home improvement | Bremerton-Silverdale-Port Orchard WA | `anchor_market` | 4 stores, 2 brands, tied leader share 0.500. |
| Auto parts | Bremerton-Silverdale-Port Orchard WA | `brand_led_service_mesh` | 17 stores, 3 brands, NAPA leader share 0.529, nearest opposite brand 0.06 miles. |

## Interpretation

The candidate pass now makes the spread difference machine-readable. Home
improvement stays in the destination-anchor frame. Auto parts breaks into
multiple local service morphologies across Washington.

This is still not final classification. The next RET step should compare
candidate labels against `fixtures/geography/ret-washington-examples.csv` and
record where the rule engine agrees, misses, or needs a ferry/barrier override.
