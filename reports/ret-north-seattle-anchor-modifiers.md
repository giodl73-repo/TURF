# RET North Seattle Anchor Modifiers

## Scope

This report tests whether reviewed mall and retail-complex evidence should
modify a zone's RET label.

Generated output:

```text
reports/ret-north-seattle-anchor-modifiers.csv
```

## Modifier Rows

| Zone | Modifier | Reason |
|---|---|---|
| Aurora / North Seattle | `no_complex_signal` | No reviewed mall or complex row. |
| Northgate / Lake City | `legacy_mall_service_grid` | Northgate Mall appears, but the current checked store stack lacks a regional-anchor mix. |
| Shoreline | `no_complex_signal` | No reviewed mall or complex row. |
| Edmonds | `small_complex_service_edge` | Multiple smaller complexes appear without a big-box anchor stack. |
| Mountlake Terrace | `small_complex_service_edge` | Multiple smaller complexes appear without a big-box anchor stack. |
| Lynnwood / Alderwood | `active_regional_mall_anchor` | Alderwood Mall appears with home improvement, mass retail, grocery, auto parts, and QSR depth. |
| Bothell | `complex_service_modifier` | North Creek Plaza supports the service-node read but does not make Bothell a regional anchor. |
| Kenmore | `no_complex_signal` | No reviewed mall or complex row. |
| Mill Creek | `no_complex_signal` | No reviewed mall or complex row. |
| Everett | `active_regional_mall_anchor` | Everett Mall appears with home improvement, mass retail, grocery, auto parts, and QSR depth. |

## Learning

Mall presence is a modifier, not a type by itself. Alderwood and Everett both
have mall evidence plus a broad active store stack, so they behave like active
regional mall anchors. Northgate has mall evidence but a different current
store stack, so it reads as a legacy mall service grid.

This helps avoid a false binary where every mall is treated as an active anchor
or every retired/redeveloping mall is ignored. TURF can keep both facts: the
mall shaped the place, and the current retail stack may now behave differently.
