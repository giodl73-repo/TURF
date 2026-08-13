# Chicago QSR / Auto-Parts Comparison

## Scope

This report compares the standardized sidecar layers across the same seven
Chicago anchor fields:

- QSR: McDonald's, Burger King, Wendy's, Taco Bell.
- Auto parts: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, Advance Auto
  Parts.

Evidence sources:

```text
reports/ret-chicago-anchor-field-qsr-summary.csv
reports/ret-chicago-anchor-field-auto-parts-summary.csv
```

## Field Comparison

| Field | QSR Rows | QSR Brands | Auto Rows | Auto Brands | Auto / QSR | Read |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Loop / River North | 11 | 3 | 0 | 0 | 0.00 | daily-trip corridor without auto-service signal |
| Lincoln Park / Lakeview | 12 | 4 | 0 | 0 | 0.00 | four-brand QSR grid without auto-service signal |
| Old Orchard / Skokie | 1 | 1 | 1 | 1 | 1.00 | light QSR and single auto-parts anchor |
| Oakbrook widened | 3 | 2 | 0 | 0 | 0.00 | light QSR service node without auto-service signal |
| Woodfield / Schaumburg | 6 | 3 | 2 | 2 | 0.33 | QSR corridor plus small auto-service node |
| Midway / Ford City | 10 | 4 | 4 | 3 | 0.40 | strongest combined QSR and auto-service sidecar |
| Orland Square | 3 | 3 | 0 | 0 | 0.00 | QSR service node without auto-service signal |

## Learning

QSR and auto parts sharply separate Chicago field types.

Lincoln Park / Lakeview and Loop / River North have strong everyday-food signal
but no auto-parts rows in the bounded fields. They read as daily-service urban
and inner-neighborhood fields, not trade corridors.

Ford City is the standout sidecar convergence. It has four-brand QSR and the
only multi-brand auto-service corridor, reinforcing the airport-edge power and
service-field interpretation.

Woodfield / Schaumburg has enough QSR and auto-parts signal to stay an
edge-city service field, but the auto-service depth is much lighter than Ford
City.

Old Orchard remains a confirmed mall/grocery field with limited daily-QSR and
auto-service sidecar signal.

## Decision

Chicago QSR and auto parts support the sidecar standardization decision. The
sidecars should remain outside the core profile until Dallas/Fort Worth is
backfilled, but they already clarify Chicago interpretation by separating
everyday-food corridors from trade/car-service corridors.

## Guardrail

This is public commercial footprint evidence, not a claim about official chain
territories, customer demographics, or individual behavior.
