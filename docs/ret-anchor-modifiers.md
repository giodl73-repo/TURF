# RET Anchor Modifiers

Anchor modifiers describe how malls, shopping centers, and power-center
complexes change a place profile without replacing the underlying RET type.

They are not claims about official trade areas or corporate territories. They
are public-footprint labels derived from reviewed store points, reviewed
retail-complex rows, and explicit geography slices.

## Current Labels

| Modifier | Meaning | Evidence pattern |
|---|---|---|
| `active_regional_mall_anchor` | A regional mall still behaves like a broad active retail anchor. | Reviewed mall signal plus multiple destination and service categories, including dual home-improvement and repeated auto-parts depth. |
| `edge_city_mall_service_grid` | A mall-centered edge-city district has a broad surrounding service field but does not match the active suburban regional-anchor stack. | Reviewed mall signal plus home improvement, grocery, mass retail, QSR depth, and at least one auto-parts brand across a widened district field. |
| `urban_mall_service_grid` | A dense urban mall district is supported by surrounding service categories. | Reviewed mall or multi-complex signal plus grocery, mass retail, drugstore, or QSR evidence, often without full big-box depth. |
| `urban_mall_grocery_grid` | A dense urban mall district is especially grocery/service weighted. | Multiple complex signals plus grocery and service depth without destination big-box depth. |
| `legacy_mall_service_grid` | A mall-shaped place remains visible, but the current checked store stack is service-weighted or thinner. | Reviewed mall signal without broad current regional-anchor depth. |
| `legacy_mall_grocery_service_grid` | A legacy mall node is now primarily supported by grocery/service evidence. | Reviewed mall signal plus grocery depth and limited QSR or destination big-box evidence. |
| `small_complex_service_edge` | Multiple smaller complexes modify a local service edge. | Several reviewed complex rows without a mall or big-box anchor stack. |
| `complex_service_modifier` | One reviewed complex supports a service-node read. | A complex is present, but evidence is not strong enough for mall or regional-anchor language. |
| `no_complex_signal` | The current checked layers include no reviewed mall or complex signal. | Store capacity may exist, but anchor-complex evidence is absent. |

## Rule Boundary

`edge_city_mall_service_grid` is intentionally separate from
`active_regional_mall_anchor`.

The first Atlanta pressure audit showed that Perimeter and North Point /
Alpharetta become broad mall/service fields when their boxes are widened. They
gain home improvement, grocery, mass retail, QSR, and at least one auto-parts
brand. They still do not show the same repeated auto-parts depth as Lynnwood /
Alderwood and Everett.

That difference should become a rule distinction rather than a threshold
relaxation. A widened mall district can be important without being the same kind
of anchor as a suburban regional mall field.

## First Evidence

The first cross-region anchor prediction audit is:

```text
reports/ret-anchor-prediction-audit.md
```

The first Atlanta pressure audit is:

```text
reports/ret-atlanta-anchor-pressure-audit.md
```

The first candidate rule comparison is:

```text
reports/ret-edge-city-mall-rule-audit.md
```

The first integrated anchor profile is:

```text
reports/ret-anchor-profile-v0.md
```
