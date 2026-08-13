# Dallas/Fort Worth Anchor-Field Grocery Summary

## Scope

This report adds the first non-Overpass everyday-service layer to the
Dallas/Fort Worth pre-scale stack.

Generated output:

```text
reports/ret-dallas-anchor-field-grocery-summary.csv
```

## Current Read

| Field | Grocery Rows | Brands | Signal |
|---|---:|---:|---|
| Downtown / Uptown Dallas | 4 | 3 | `multi_brand_grocery_grid` |
| NorthPark / Preston Hollow | 6 | 4 | `multi_brand_grocery_grid` |
| Galleria / Addison | 2 | 2 | `grocery_service_field` |
| Legacy / Frisco / Plano | 4 | 4 | `multi_brand_grocery_grid` |
| Las Colinas / Irving | 3 | 3 | `multi_brand_grocery_grid` |
| Arlington / Grand Prairie | 6 | 4 | `multi_brand_grocery_grid` |
| Southlake Town Square | 4 | 4 | `multi_brand_grocery_grid` |
| Fort Worth Cultural / West 7th | 2 | 2 | `grocery_service_field` |

## Learning

Grocery immediately fills all eight Dallas/Fort Worth target fields, including
the three fields that source-gated on the post-office layer. That confirms the
pre-scale strategy: use Overture exact-brand everyday layers to build the stack
while OSM civic layers are retried or source-gated separately.

The strongest multi-brand fields are NorthPark / Preston Hollow and Arlington /
Grand Prairie. Legacy / Frisco / Plano also flips from checked-absent postal
signal to a four-brand grocery grid, which supports the idea that growth-edge
fields may be everyday-service rich even when the civic postal layer is thin
inside a tight retail box.
