# Dallas/Fort Worth QSR / Auto-Parts Comparison

## Scope

This report compares the standardized sidecar layers across the same eight
Dallas/Fort Worth anchor fields:

- QSR: McDonald's, Burger King, Wendy's, Taco Bell.
- Auto parts: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, Advance Auto
  Parts.

Evidence sources:

```text
reports/ret-dallas-anchor-field-qsr-summary.csv
reports/ret-dallas-anchor-field-auto-parts-summary.csv
```

## Field Comparison

| Field | QSR Rows | QSR Brands | Auto Rows | Auto Brands | Auto / QSR | Read |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Downtown / Uptown Dallas | 5 | 4 | 0 | 0 | 0.00 | daily-trip corridor without auto-service signal |
| NorthPark / Preston Hollow | 4 | 2 | 2 | 2 | 0.50 | QSR service node plus small auto-service node |
| Galleria / Addison | 6 | 4 | 2 | 2 | 0.33 | QSR corridor plus small auto-service node |
| Legacy / Frisco / Plano | 7 | 4 | 1 | 1 | 0.14 | QSR corridor with light auto-service signal |
| Las Colinas / Irving | 7 | 3 | 1 | 1 | 0.14 | airport-office QSR corridor with light auto-service signal |
| Arlington / Grand Prairie | 16 | 4 | 13 | 3 | 0.81 | strongest combined daily-trip and auto-service field |
| Southlake Town Square | 1 | 1 | 0 | 0 | 0.00 | light sidecar signal inside the town-center box |
| Fort Worth Cultural / West 7th | 1 | 1 | 1 | 1 | 1.00 | sparse QSR and sparse auto-service anchors |

## Learning

The Dallas/Fort Worth sidecars converge most strongly in Arlington / Grand
Prairie. It is the only four-brand dense QSR grid and the only dense
multi-brand auto-service grid, making it the clearest combined daily-trip,
event/power-retail, and trade/car-service field in the selected metroplex
targets.

The north Dallas and north-suburban fields split by sidecar intensity.
Galleria / Addison, Legacy / Frisco / Plano, and Las Colinas / Irving have
multi-brand QSR corridor signal, but only Galleria / Addison reaches a small
two-brand auto-service node. Legacy and Las Colinas are QSR-forward in these
boxes.

Downtown / Uptown Dallas has four-brand QSR without auto-parts signal, which is
closer to Chicago Loop / River North than to LA's car-service-rich urban fields.
Southlake Town Square stays light on both sidecars, supporting the planned
affluent town-center interpretation rather than a service-grid upgrade.

## Decision

Dallas/Fort Worth completes the standardized sidecar backfill pair. QSR and auto
parts are useful enough to keep as sidecar evidence, but the next decision
should compare all sidecars against civic/postal and common-store layers before
promoting them into the core type-discovery profile.

## Guardrail

This is public commercial footprint evidence, not a claim about official chain
territories, customer demographics, or individual behavior.
