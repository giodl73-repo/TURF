# RET Anchor Profile v1 Examples

## Scope

This report selects canonical examples from Anchor Profile v1 for each anchor
modifier. It keeps up to three examples per class and ranks source-limited rows
after clean examples inside the same modifier.

Generated output:

```text
reports/ret-anchor-profile-v1-examples.csv
```

## Canonical Examples

| Modifier | Examples |
|---|---|
| `active_regional_mall_anchor` | Kitsap Mall / Silverdale; South Hill / Puyallup; Everett |
| `edge_city_mall_service_grid` | Perimeter widened; North Point widened |
| `urban_mall_service_grid` | Southcenter / Tukwila; Tacoma Mall; Cumberland / Vinings |
| `urban_mall_grocery_grid` | Buckhead / Lenox / Phipps |
| `legacy_mall_service_grid` | Northgate / Lake City |
| `legacy_mall_grocery_service_grid` | Northlake |
| `small_complex_service_edge` | Edmonds; Mountlake Terrace; Bellevue core |
| `complex_service_modifier` | Factoria; Bothell |
| `mall_anchor_needs_category_depth` | North Point / Alpharetta; Perimeter |
| `capacity_profile_mixed` | Decatur / Emory; Camp Creek |
| `no_complex_signal` | Aurora / North Seattle; Mill Creek; Kenmore |

## Learning

The examples show why v1 is useful as a rule-training surface. Several modifier
classes now have cross-region examples, not just one-off local cases:

- `active_regional_mall_anchor` spans North Seattle / South Snohomish, Kitsap,
  and Pierce County.
- `urban_mall_service_grid` spans Puget Sound and Atlanta.
- `complex_service_modifier` now has both Factoria and Bothell.

Bellevue core remains in the example set only as a caution case. It is ranked
behind clean `small_complex_service_edge` examples because its evidence summary
is source-limited.
