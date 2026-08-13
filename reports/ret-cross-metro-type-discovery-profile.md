# Cross-Metro Type-Discovery Profile

## Scope

This report normalizes Washington, Atlanta, and Chicago anchor-field outputs
into one comparable type-discovery profile.

Generated output:

```text
reports/ret-cross-metro-type-discovery-profile.csv
```

## Contract

Each row exposes:

- region,
- field id and label,
- profile basis,
- observed layers,
- source-gated layers,
- checked-absent layers,
- observed and source-gated rates,
- type-discovery label,
- readiness tier,
- comparison tier.

The profile basis is part of the contract. Washington and Atlanta use a
full 11-dimension context contract. Chicago uses a pre-scale 6-layer stack. The
profile is comparable for type discovery, not final atlas ranking.

## Comparison Tiers

- `baseline_comparable`: full 11-dimension profile with no source gates.
- `type_discovery_comparable`: enough observed signal and low source-gate load
  to compare field types.
- `type_discovery_partial`: useful typed signal but source quality or layer
  count limits comparison.
- `source_limited`: too sparse or gated for interpretation beyond source
  strategy.

## First Read

Washington remains the baseline because it has zero source-gated dimensions.
Atlanta is useful for type discovery but heavily source-gated. Chicago is not a
full 11-dimension profile yet, but the pre-scale stack is strong enough to
compare typed fields such as urban everyday grids, confirmed mall/grocery
fields, and big-box/grocery power fields.

The current generated profile has 20 rows:

| Region | Tier | Fields |
|---|---|---:|
| Washington | `baseline_comparable` | 6 |
| Atlanta | `type_discovery_partial` | 5 |
| Atlanta | `source_limited` | 2 |
| Chicago | `type_discovery_comparable` | 5 |
| Chicago | `type_discovery_partial` | 2 |

Profile basis:

| Basis | Fields |
|---|---:|
| `full_11_dimension_context` | 13 |
| `pre_scale_6_layer_stack` | 7 |

## Current Comparable Types

Washington contributes the complete baseline set. Chicago now contributes five
type-discovery-comparable fields:

- Loop / River North: `urban_core_everyday_grid`.
- Lincoln Park / Lakeview: `inner_neighborhood_everyday_grid`.
- Oakbrook widened: `confirmed_postal_big_box_edge_field`.
- Woodfield / Schaumburg: `confirmed_edge_city_mall_grocery_field`.
- Midway / Ford City: `confirmed_mall_big_box_grocery_field`.

Atlanta contributes five partial type-discovery fields, but none are baseline
comparable because every Atlanta field still carries at least five source-gated
dimensions.

## Validation

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

The validator keeps this report as a stricter synthesis contract, so TURF can
scale new metros while preserving the distinction between complete baselines,
pre-scale stacks, checked absences, and source-gated gaps.
