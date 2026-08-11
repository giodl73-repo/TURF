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
| Aurora / North Seattle | 9 | `retail_corridor` | Home Depot, Lowe's, three auto-parts brands, one grocery row, and QSR rows along the Aurora/North Seattle strip; no direct mass-retail row in this slice. |
| Northgate / Lake City | 10 | `neighborhood_grocery_service_grid` | Four grocery brands, four QSR brands, one Target row, and one auto-parts row, but no direct home-improvement anchor in this subcity slice. |
| Shoreline | 13 | `mixed_edge_node` | Home Depot, Costco, four grocery brands, auto-parts rows, and McDonald's rows; a mixed inner-suburb service edge. |
| Edmonds | 6 | `ferry_town_service_edge` | QSR plus Safeway and O'Reilly, no direct home-improvement anchor; ferry/town-edge context matters. |
| Mountlake Terrace | 4 | `mixed_edge_node` | Grocery rows plus one auto-parts row, still no big-box anchor in the checked categories. |
| Lynnwood / Alderwood | 31 | `regional_anchor_absorber` | Home Depot + Lowe's, Target, Walmart, Costco, all four auto-parts brands, six grocery brands, three QSR brands, and close same-place spacing. |
| Bothell | 12 | `partial_anchor_service_node` | Home Depot, three grocery brands, QSR, and O'Reilly presence, but no mass-retail row in this filter. |
| Kenmore | 4 | `mixed_edge_node` | Grocery, QSR, and auto-parts rows without a big-box anchor. |
| Mill Creek | 6 | `mixed_edge_node` | Lowe's, grocery, two auto-parts brands, and McDonald's rows. |
| Everett | 43 | `regional_anchor_node` | Home Depot + Lowe's, Target, Walmart, Costco, all four auto-parts brands, five grocery brands, all four QSR brands, and strong same-place spacing support. |

## Learning

North Seattle is not one thing. The current public store evidence separates it
into a hierarchy:

- **Aurora**: corridor capacity
- **Northgate / Lake City**: neighborhood grocery-service grid
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

Grocery sharpens the neighborhood layer. Northgate/Lake City separates from
Aurora because it has four grocery brands and four QSR brands without a direct
home-improvement anchor. Lynnwood/Alderwood remains the stronger regional
absorber because grocery, mass retail, home improvement, auto parts, and QSR all
stack there.

## Caveat

The profile uses city labels and simple latitude/longitude slices for Seattle
subcity zones. It is a first-pass public footprint read, not a neighborhood
boundary file and not a drive-time model.
