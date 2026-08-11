# RET North Seattle / South Snohomish Enclave Profile

## Scope

This profile tests whether the north-end retail field separates into anchor,
corridor, ferry-edge, service-edge, and thin-edge types.

Generated output:

```text
reports/ret-north-seattle-enclave-profile.csv
```

## Profile Rows

| Zone | Stores | Type hint | Evidence |
|---|---:|---|---|
| Aurora / North Seattle | 8 | `retail_corridor` | Home Depot, Lowe's, three auto-parts brands, and QSR rows along the Aurora/North Seattle strip. |
| Northgate / Lake City | 5 | `mixed_edge_node` | Four QSR brands plus one auto-parts row, but no direct home-improvement anchor in this subcity slice. |
| Shoreline | 7 | `mixed_edge_node` | Home Depot, auto-parts rows, and McDonald's rows; less category-complete than Aurora or Lynnwood. |
| Edmonds | 5 | `ferry_town_service_edge` | QSR plus O'Reilly, no direct home-improvement anchor; ferry/town-edge context matters. |
| Mountlake Terrace | 1 | `thin_edge_node` | One direct auto-parts row in the current checked categories. |
| Lynnwood / Alderwood | 18 | `regional_anchor_absorber` | Home Depot + Lowe's, all four auto-parts brands, three QSR brands, and close same-place spacing. |
| Bothell | 7 | `partial_anchor_service_node` | Home Depot, QSR, and O'Reilly presence, but a thinner auto-parts brand mix. |
| Kenmore | 2 | `thin_edge_node` | One QSR row and one auto-parts row. |
| Mill Creek | 5 | `mixed_edge_node` | Lowe's, two auto-parts brands, and McDonald's rows. |
| Everett | 29 | `complete_daily_life_node` | Full daily-life category coverage with strong same-place spacing support. |

## Learning

North Seattle is not one thing. The current public store evidence separates it
into a hierarchy:

- **Aurora**: corridor capacity
- **Northgate / Lake City**: local service edge
- **Edmonds**: ferry-town service edge
- **Lynnwood / Alderwood**: regional anchor absorber
- **Bothell / Kenmore**: eastside service edge
- **Everett**: larger north regional service center

This supports the RET idea that a metro contains nested retail place types. The
same store category can signal different things depending on whether it appears
in a corridor, a regional anchor, a ferry-edge town, or a thin service edge.

## Caveat

The profile uses city labels and simple latitude/longitude slices for Seattle
subcity zones. It is a first-pass public footprint read, not a neighborhood
boundary file and not a drive-time model.
