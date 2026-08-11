# RET Seattle / Atlanta Capacity Synthesis

## Scope

This report reads the current RET Profile v0 outputs after the Georgia
auto-parts backfill. Seattle, Bremerton, and Atlanta now have the same three
daily-life category layers:

- home improvement
- QSR
- auto parts

The source evidence is still public POI candidate data, not official chain
territories or corporate district maps.

## Metro Read

| Metro | Profile label | Store rows | Read |
|---|---|---:|---|
| Seattle-Tacoma-Bellevue | `barrier_split_complete_service_grid` | 513 | Complete multi-category grid, but Puget Sound barriers make same-side place reads important. |
| Bremerton-Silverdale-Port Orchard | `ferry_side_daily_life_grid` | 48 | Direct ferry-side capacity across all three categories, not just Seattle spillover. |
| Atlanta-Sandy Springs-Roswell | `continuous_complete_service_grid` | 1081 | Complete inland grid with all three categories repeated across a continuous metro field. |

## Place Archetypes

| Archetype | Places | Meaning |
|---|---|---|
| `complete_daily_life_node` | Seattle, Tacoma, Silverdale, Marietta, Alpharetta | Dual home-improvement or broad anchor capacity plus full QSR and auto-parts service layers. |
| `partial_anchor_qsr_node` | Bellevue, Poulsbo, Port Orchard, Atlanta, Roswell, Decatur | Strong QSR and service capacity, but one home-improvement anchor is absent in direct city rows. |
| `service_without_big_box_anchor` | Bremerton | Dense QSR and auto-parts capacity with no direct Home Depot/Lowe's city row. |
| `thin_direct_store_layer` | Bainbridge Island, Kingston | Few direct rows; absence matters more because ferry context can make local capacity important. |
| `capacity_profile_mixed` | Sandy Springs | Dual home-improvement anchors and some QSR/auto-parts presence, but less repeated store-type density than nearby Atlanta suburbs. |

## What We Are Learning

The useful first question is not "who wins this place?" It is "what store-type
capacity exists here?"

The capacity matrix gives a cleaner neutral grammar:

- `0`: observed absence in an active source layer
- `1`: one direct row
- `2+`: repeated direct capacity
- `source_gate_pending`: source not acquired, so absence cannot be inferred

That lets TURF describe enclaves without turning every co-located brand pair
into rivalry. A Home Depot plus Lowe's pair often reads first as
home-improvement completeness. Four QSR brands read as daily-life service
density. Multiple auto-parts brands read as a local maintenance/service mesh.

Rivalry becomes a stronger claim only after we add spacing, corridor, route, or
time evidence.

## Seattle vs. Atlanta

Seattle and Atlanta both now look like complete daily-life grids at metro scale,
but the shape differs.

Seattle's profile is interrupted by water and ferry geography. The metro has
large category layers, but Bainbridge Island, Kingston, Bremerton, Silverdale,
Poulsbo, and Port Orchard need same-side interpretation.

Atlanta's profile is continuous. The Atlanta CBSA has 1081 rows across the three
observed categories, including 363 auto-parts rows. The selected Atlanta suburbs
show repeated daily-life capacity without the ferry-side discontinuities that
shape Puget Sound.

## Next Question

The next useful feature is not another dominance label. It is a spacing and
access layer:

- Which complete nodes have close same-category competitors?
- Which partial nodes are missing one store type but have nearby capacity?
- Which thin ferry-side places depend on same-side or ferry-linked service?
- Which Atlanta suburbs show corridor-like repetition along roads?

That is where TURF can begin distinguishing complete service capacity from
evidence-backed rivalry.

The first same-place spacing layer is:

```text
reports/ret-seattle-atlanta-spacing-readout.md
```
