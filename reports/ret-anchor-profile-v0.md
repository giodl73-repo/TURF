# RET Anchor Profile v0

## Scope

This is the first integrated anchor-profile readout. It combines North Seattle /
South Snohomish anchor modifiers, Atlanta core district anchor modifiers, and
the widened Atlanta edge-city pressure cases into one comparable table.

Generated output:

```text
reports/ret-anchor-profile-v0.csv
```

## Why This Is Separate From City Profiles

The RET place capacity matrix is city-based. Anchor modifiers are not always
city-shaped. Alderwood, Everett, Northgate, Perimeter, and North Point are
retail fields, corridors, or district slices. Keeping this as an anchor profile
preserves the correct grain.

## Profile Read

| Profile class | Areas |
|---|---|
| `active_regional_mall_anchor` | Lynnwood / Alderwood, Everett |
| `edge_city_mall_service_grid` | Perimeter widened, North Point widened |
| `urban_mall_service_grid` | Cumberland / Vinings |
| `urban_mall_grocery_grid` | Buckhead / Lenox / Phipps |
| `legacy_mall_service_grid` | Northgate / Lake City |
| `legacy_mall_grocery_service_grid` | Northlake |
| `small_complex_service_edge` | Edmonds, Mountlake Terrace |
| `complex_service_modifier` | Bothell |
| `mall_anchor_needs_category_depth` | Perimeter core, North Point core |
| `capacity_profile_mixed` | Camp Creek, Decatur / Emory |
| `no_complex_signal` | Aurora / North Seattle, Shoreline, Kenmore, Mill Creek |

## Learning

The integrated profile makes the hierarchy visible. Washington has nested
corridors, legacy mall/service grids, small complex edges, and active suburban
regional anchors. Atlanta has dense urban mall/service grids plus edge-city mall
fields that need wider geography than a mall-core box.

The important technical move is keeping `district_core` and `district_wide` in
the same table. Perimeter and North Point do not merely flip labels; the table
records why the flip happens. The core boxes remain
`mall_anchor_needs_category_depth`, while the wider fields become
`edge_city_mall_service_grid`.

This gives TURF a cleaner next implementation target: make anchor modifiers a
generated profile layer with explicit geography scope, rather than a loose
collection of one-off reports.
