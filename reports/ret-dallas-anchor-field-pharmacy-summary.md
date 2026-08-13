# Dallas/Fort Worth Anchor-Field Pharmacy Summary

## Scope

This report adds exact-brand drugstore signal to the Dallas/Fort Worth
pre-scale stack as a health-errand proxy.

Generated output:

```text
reports/ret-dallas-anchor-field-pharmacy-summary.csv
```

## Current Read

| Field | Pharmacy Rows | Brands | Signal |
|---|---:|---:|---|
| Downtown / Uptown Dallas | 3 | 1 | `observed` |
| NorthPark / Preston Hollow | 2 | 1 | `observed` |
| Galleria / Addison | 0 | 0 | `checked_absent` |
| Legacy / Frisco / Plano | 4 | 1 | `observed` |
| Las Colinas / Irving | 2 | 1 | `observed` |
| Arlington / Grand Prairie | 3 | 1 | `observed` |
| Southlake Town Square | 1 | 1 | `observed` |
| Fort Worth Cultural / West 7th | 2 | 1 | `observed` |

## Learning

Pharmacy adds health-errand signal to seven of eight Dallas/Fort Worth fields.
The signal is heavily CVS-shaped inside the current exact-brand Overture layer,
so it is useful as a health-errand presence layer but not yet as a pharmacy
brand-competition layer.

Galleria / Addison is the notable checked absence. It is grocery-supported and
the only multi-brand mass-retail field, but it does not have packet-ready
exact-brand drugstore rows inside the current bounded box.
