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
| Aurora / North Seattle | 8 | `retail_corridor` | Home Depot, Lowe's, three auto-parts brands, and QSR rows along the Aurora/North Seattle strip; no direct mass-retail row in this slice. |
| Northgate / Lake City | 6 | `mixed_edge_node` | Four QSR brands, one auto-parts row, and one Target row, but no direct home-improvement anchor in this subcity slice. |
| Shoreline | 8 | `mixed_edge_node` | Home Depot, Costco, auto-parts rows, and McDonald's rows; less category-complete than Aurora or Lynnwood. |
| Edmonds | 5 | `ferry_town_service_edge` | QSR plus O'Reilly, no direct home-improvement anchor; ferry/town-edge context matters. |
| Mountlake Terrace | 1 | `thin_edge_node` | One direct auto-parts row in the current checked categories. |
| Lynnwood / Alderwood | 23 | `regional_anchor_absorber` | Home Depot + Lowe's, Target, Walmart, Costco, all four auto-parts brands, three QSR brands, and close same-place spacing. |
| Bothell | 7 | `partial_anchor_service_node` | Home Depot, QSR, and O'Reilly presence, but a thinner auto-parts brand mix. |
| Kenmore | 2 | `thin_edge_node` | One QSR row and one auto-parts row. |
| Mill Creek | 5 | `mixed_edge_node` | Lowe's, two auto-parts brands, and McDonald's rows. |
| Everett | 32 | `regional_anchor_node` | Home Depot + Lowe's, Target, Walmart, Costco, all four auto-parts brands, all four QSR brands, and strong same-place spacing support. |

## Learning

North Seattle is not one thing. The current public store evidence separates it
into a hierarchy:

- **Aurora**: corridor capacity
- **Northgate / Lake City**: local service edge
- **Edmonds**: ferry-town service edge
- **Lynnwood / Alderwood**: regional anchor absorber with mass-retail proof
- **Bothell / Kenmore**: eastside service edge
- **Everett**: larger north regional service center

This supports the RET idea that a metro contains nested retail place types. The
same store category can signal different things depending on whether it appears
in a corridor, a regional anchor, a ferry-edge town, or a thin service edge.

Mass retail sharpens the hierarchy. Lynnwood/Alderwood and Everett both carry
Target, Walmart, and Costco rows, while Aurora remains a corridor without a
direct mass-retail row in the selected slice.

## Caveat

The profile uses city labels and simple latitude/longitude slices for Seattle
subcity zones. It is a first-pass public footprint read, not a neighborhood
boundary file and not a drive-time model.
