# Chicago Type-Discovery Synthesis

## Scope

This synthesis interprets the current Chicago field stack after pharmacy, mass
retail, grocery, retail complex, post-office, and gym/source-gate layers.

Evidence source:

```text
reports/ret-chicago-pre-scale-field-stack.csv
```

## Decision

Chicago is ready for typed-enclave discovery. It is not ready for final
cross-metro ranking because OSM post-office and gym dimensions remain
source-gated in most fields.

The useful move is to treat Chicago as a type laboratory:

- urban everyday grids,
- inner-neighborhood everyday grids,
- confirmed mall/grocery fields,
- confirmed postal/big-box edge fields,
- confirmed edge-city mall/grocery fields,
- confirmed mall/big-box/grocery power fields.

## Field Types

| Field | Current Type | What Defines It |
|---|---|---|
| Loop / River North | `urban_core_everyday_grid` | Pharmacy depth, Target-only big-box signal, and five-brand grocery grid without direct retail-complex confirmation in the selected box. |
| Lincoln Park / Lakeview | `inner_neighborhood_everyday_grid` | Five-brand grocery grid plus Target and pharmacy, matching a dense lived neighborhood service field rather than a mall anchor. |
| Old Orchard / Skokie | `confirmed_single_grocery_mall_field` | Westfield Old Orchard confirms the mall, but current direct pharmacy and mass-retail layers are checked absent in the bounded field. |
| Oakbrook widened | `confirmed_postal_big_box_edge_field` | Oakbrook Center, The District, post office, Costco/Walmart, and grocery make it the cleanest suburban edge comparison field. |
| Woodfield / Schaumburg | `confirmed_edge_city_mall_grocery_field` | Woodfield Mall and Woodfield Village Green stack with Costco and a four-brand grocery grid. |
| Midway / Ford City | `confirmed_mall_big_box_grocery_field` | Ford City Mall, Burbank Shopping Center, Costco/Target, and a three-brand grocery grid mark an airport-edge power field. |
| Orland Square | `confirmed_grocery_supported_mall_field` | Orland Square Mall and shopping center are confirmed, with three-brand grocery support and observed postal civic signal but no direct mass-retail or pharmacy rows in the bounded field. |

## What This Teaches

The same metro contains multiple public-chain enclave types:

- Urban core fields absorb grocery, pharmacy, and compact big-box formats
  without needing a mall structure.
- Inner-neighborhood fields can look as service-rich as downtown fields, but
  their anchor is lived neighborhood density rather than a single complex.
- Regional mall fields can be confirmed even when direct mass-retail and
  pharmacy rows are absent inside the exact box.
- Edge-city fields stack named complexes, grocery grids, and big-box anchors.
- Airport-edge power fields look different from edge-city mall fields because
  big-box and grocery evidence is present but civic/wellness evidence remains
  source-gated.

This supports the RET/TURF thesis: public chains do not merely fill cities;
they create typed territory fields when their categories intersect.

## Source Limits

The synthesis deliberately avoids final strength ranking. OSM source gates
remain material:

- Post office is observed in Loop / River North, Oakbrook, and Orland Square,
  and source-gated in four fields.
- Gym is source-gated in all seven fields.
- Retail complex is target-limited, not a complete Illinois complex census.
- Grocery, pharmacy, and mass retail are exact-brand Overture layers, not full
  food, health, or big-box access models.

## Next Goal

Before scaling to another metro, TURF should do one of two things:

1. Create a reusable type-discovery synthesis contract so Washington, Atlanta,
   and Chicago can be compared by the same observed/source-gated/checked-absent
   rules.
2. Continue the simplified OSM retry track for Chicago civic/wellness layers to
   reduce source-gated dimensions before any final ranking.

The first path helps scale. The second path improves Chicago resolution. The
current evidence favors the first path if the goal is learning across more
urban areas.
