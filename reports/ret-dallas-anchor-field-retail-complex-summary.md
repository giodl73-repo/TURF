# Dallas/Fort Worth Anchor-Field Retail-Complex Summary

## Scope

This report adds target-limited retail-complex confirmation to the
Dallas/Fort Worth pre-scale stack.

Generated output:

```text
reports/ret-dallas-anchor-field-retail-complex-summary.csv
```

## Current Read

| Field | Complex Rows | Types | Signal |
|---|---:|---:|---|
| Downtown / Uptown Dallas | 1 | 1 | `confirmed_retail_complex_field` |
| NorthPark / Preston Hollow | 2 | 2 | `confirmed_retail_complex_field` |
| Galleria / Addison | 1 | 1 | `confirmed_retail_complex_field` |
| Legacy / Frisco / Plano | 2 | 2 | `confirmed_mall_complex_field` |
| Las Colinas / Irving | 1 | 1 | `confirmed_retail_complex_field` |
| Arlington / Grand Prairie | 1 | 1 | `confirmed_retail_complex_field` |
| Southlake Town Square | 1 | 1 | `confirmed_retail_complex_field` |
| Fort Worth Cultural / West 7th | 2 | 1 | `confirmed_retail_complex_field` |

## Learning

Retail complexes confirm that every Dallas/Fort Worth target field has some
named built retail structure, but only Legacy / Frisco / Plano has a confirmed
mall-complex stack inside the current boxes: Stonebriar Mall plus Legacy West
Shopping Center.

The other fields read differently:

- Downtown / Uptown Dallas is a West Village retail-village field.
- NorthPark / Preston Hollow is a NorthPark / Preston Center complex field.
- Galleria / Addison is confirmed by Addison Walk in this reviewed layer, not
  by a clean Galleria Dallas complex row.
- Las Colinas / Irving is a Las Colinas Urban Center field.
- Arlington / Grand Prairie is carried by Lincoln Square Shopping Center.
- Southlake Town Square is represented by Park Village in the Overture layer.
- Fort Worth Cultural / West 7th is a Montgomery / West 7th plaza field.

This gives Dallas/Fort Worth the fifth stack layer needed for a first
pre-scale synthesis.
