# Philadelphia / South Jersey Anchor-Field Post-Office Summary

## Scope

This report starts the Philadelphia / South Jersey pre-scale stack with the
postal civic anchor layer.

Generated output:

```text
reports/ret-philadelphia-anchor-field-post-office-summary.csv
```

Source fixtures:

```text
fixtures/civic/osm-post-office-philadelphia-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-philadelphia-anchor-fields-source-gates-2026-08-13.csv
```

## Current Read

| Field | Raw Rows | Post-Office Rows | Private Counters Excluded | Signal | Gate |
| --- | ---: | ---: | ---: | --- | --- |
| Center City / Market East | 10 | 7 | 3 | `observed` |  |
| University City / 30th Street | 4 | 3 | 1 | `observed` |  |
| King of Prussia | 1 | 1 | 0 | `observed` |  |
| Northeast Philadelphia / Roosevelt Boulevard | 8 | 8 | 0 | `observed` |  |
| Conshohocken / Plymouth Meeting | 3 | 3 | 0 | `observed` |  |
| South Philadelphia Sports / Port | 1 | 1 | 0 | `observed` |  |
| Camden Waterfront / Cooper | 3 | 2 | 1 | `observed` |  |
| Cherry Hill / Moorestown | 6 | 4 | 2 | `observed` |  |

## Learning

Philadelphia / South Jersey starts with unusually complete postal civic signal:
all eight bounded fields have observed post-office rows and no source-gated
targets in this pass.

Center City / Market East and Northeast Philadelphia / Roosevelt Boulevard are
the densest postal fields. Center City has seven packet-ready rows after
excluding three UPS counters. Northeast Roosevelt has eight packet-ready rows,
supporting the older inner-suburban corridor hypothesis before common-store
layers are added.

University City / 30th Street and Camden Waterfront / Cooper both show civic
postal signal near institutional, rail, and cross-river service terrain. King of
Prussia and South Philadelphia Sports / Port are lighter but still observed,
which is enough to start the pre-scale stack without a postal source gate.

Cherry Hill / Moorestown shows South Jersey postal signal across mall-corridor
terrain while excluding FedEx/UPS private counters. That gives the sixth metro
an immediate cross-state civic baseline.

## Guardrail

Rows are OpenStreetMap Overpass candidates reviewed as public civic footprint
evidence. They are not USPS official facility records and should not be treated
as final postal service-area boundaries.
