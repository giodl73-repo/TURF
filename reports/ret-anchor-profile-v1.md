# RET Anchor Profile v1

## Scope

Anchor Profile v1 keeps the v0 rows and adds the six reviewed Puget Sound
anchor fields as `district_field` geography. This makes the broader Washington
mall-field experiment comparable with North Seattle / South Snohomish reviewed
zones and Atlanta district slices.

Generated output:

```text
reports/ret-anchor-profile-v1.csv
```

## Profile Read

| Profile class | Areas |
|---|---|
| `active_regional_mall_anchor` | Lynnwood / Alderwood, Everett, Kitsap Mall / Silverdale, South Hill / Puyallup |
| `edge_city_mall_service_grid` | Perimeter widened, North Point widened |
| `urban_mall_service_grid` | Cumberland / Vinings, Southcenter / Tukwila, Tacoma Mall |
| `urban_mall_grocery_grid` | Buckhead / Lenox / Phipps |
| `legacy_mall_service_grid` | Northgate / Lake City |
| `legacy_mall_grocery_service_grid` | Northlake |
| `small_complex_service_edge` | Edmonds, Mountlake Terrace, Bellevue core |
| `complex_service_modifier` | Bothell, Factoria |
| `mall_anchor_needs_category_depth` | Perimeter core, North Point core |
| `capacity_profile_mixed` | Camp Creek, Decatur / Emory |
| `no_complex_signal` | Aurora / North Seattle, Shoreline, Kenmore, Mill Creek |

## V1 Impact

The new `district_field` scope adds six Puget Sound fields and raises the
integrated profile from 19 rows to 25 rows. It doubles the Washington active
regional-anchor examples from two to four by adding Kitsap Mall / Silverdale and
South Hill / Puyallup.

Southcenter / Tukwila and Tacoma Mall become urban mall service grids. They
have reviewed mall evidence and dense QSR/service context, but miss at least
one active-regional-anchor depth condition in the bounded field.

Bellevue core remains deliberately source-limited. V1 carries it as
`small_complex_service_edge` with an evidence note that Bellevue Square and
Lincoln Square are missing from reviewed complex rows. That keeps the profile
honest: the weak modifier is an acquisition warning, not a final market read.

## Contract

V1 extends the existing anchor-profile geography contract with
`district_field`. The CSV keeps the same columns as v0, so the existing
`validate-anchor-profile` and `summarize-anchor-profile` commands work on both
versions.
