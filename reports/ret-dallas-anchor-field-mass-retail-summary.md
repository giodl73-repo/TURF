# Dallas/Fort Worth Anchor-Field Mass-Retail Summary

## Scope

This report adds Target / Walmart / Costco / Sam's Club signal to the
Dallas/Fort Worth pre-scale stack.

Generated output:

```text
reports/ret-dallas-anchor-field-mass-retail-summary.csv
```

## Current Read

| Field | Mass-Retail Rows | Brands | Signal |
|---|---:|---:|---|
| Downtown / Uptown Dallas | 1 | 1 | `single_brand_big_box_anchor` |
| NorthPark / Preston Hollow | 1 | 1 | `single_brand_big_box_anchor` |
| Galleria / Addison | 2 | 2 | `multi_brand_big_box_anchor` |
| Legacy / Frisco / Plano | 1 | 1 | `single_brand_big_box_anchor` |
| Las Colinas / Irving | 0 | 0 | `checked_absent` |
| Arlington / Grand Prairie | 1 | 1 | `single_brand_big_box_anchor` |
| Southlake Town Square | 0 | 0 | `checked_absent` |
| Fort Worth Cultural / West 7th | 1 | 1 | `single_brand_big_box_anchor` |

## Learning

Mass retail separates Dallas/Fort Worth fields more sharply than grocery.
Galleria / Addison is the only multi-brand big-box anchor in the bounded target
set, with both Target and Walmart. Downtown / Uptown, NorthPark, Legacy /
Frisco / Plano, Arlington / Grand Prairie, and Fort Worth Cultural / West 7th
each have a single-brand anchor.

Las Colinas / Irving and Southlake Town Square remain grocery-rich but
mass-retail checked absent inside the current boxes. That is useful type
texture: they may be office/town-center service fields rather than household
big-box fields at this scale.
