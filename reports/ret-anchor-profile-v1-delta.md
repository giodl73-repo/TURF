# RET Anchor Profile v1 Delta

## Scope

This report compares Anchor Profile v0 with Anchor Profile v1 after adding the
six reviewed Puget Sound `district_field` rows.

Generated output:

```text
reports/ret-anchor-profile-v1-delta.csv
```

## Modifier Delta

| Modifier | v0 | v1 | Delta |
|---|---:|---:|---:|
| `active_regional_mall_anchor` | 2 | 4 | +2 |
| `urban_mall_service_grid` | 1 | 3 | +2 |
| `small_complex_service_edge` | 2 | 3 | +1 |
| `complex_service_modifier` | 1 | 2 | +1 |
| `edge_city_mall_service_grid` | 2 | 2 | 0 |
| `mall_anchor_needs_category_depth` | 2 | 2 | 0 |
| `no_complex_signal` | 4 | 4 | 0 |

## Scope Delta

| Geography scope | v0 | v1 | Delta |
|---|---:|---:|---:|
| `district_field` | 0 | 6 | +6 |
| `reviewed_zone` | 10 | 10 | 0 |
| `district_core` | 7 | 7 | 0 |
| `district_wide` | 2 | 2 | 0 |

## Learning

V1 is an additive expansion, not a reclassification of the v0 rows. The only new
region is `puget_sound_anchor_fields`, and all six new rows use the new
`district_field` geography scope.

The practical modeling change is that TURF now has more Washington reference
anchors at mall-field grain. Active regional-anchor examples increase from two
to four, and urban mall service-grid examples increase from one to three. That
gives later profile rules more balanced examples across North Seattle, South
King, South Sound, Kitsap, and Pierce County without weakening the Atlanta
comparison set.
