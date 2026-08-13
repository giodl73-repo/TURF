# Cross-Metro Type-Discovery Profile

## Scope

This report normalizes Washington, Atlanta, Chicago, and Dallas/Fort Worth
anchor-field outputs into one comparable type-discovery profile.

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
full 11-dimension context contract. Chicago uses a pre-scale 6-layer stack.
Dallas/Fort Worth uses a pre-scale 5-layer stack. The profile is comparable for
type discovery, not final atlas ranking.

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
Atlanta is useful for type discovery but heavily source-gated. Chicago and
Dallas/Fort Worth are not full 11-dimension profiles yet, but their pre-scale
stacks are strong enough to compare typed fields such as urban everyday grids,
confirmed mall/grocery fields, big-box/grocery power fields, and Sun Belt
town-center or growth-edge fields.

The current generated profile has 28 rows:

| Region | Tier | Fields |
|---|---|---:|
| Washington | `baseline_comparable` | 6 |
| Atlanta | `type_discovery_partial` | 5 |
| Atlanta | `source_limited` | 2 |
| Chicago | `type_discovery_comparable` | 5 |
| Chicago | `type_discovery_partial` | 2 |
| Dallas/Fort Worth | `type_discovery_comparable` | 7 |
| Dallas/Fort Worth | `type_discovery_partial` | 1 |

Profile basis:

| Basis | Fields |
|---|---:|
| `full_11_dimension_context` | 13 |
| `pre_scale_6_layer_stack` | 7 |
| `pre_scale_5_layer_stack` | 8 |

## Current Comparable Types

Washington contributes the complete baseline set. Chicago now contributes five
type-discovery-comparable fields:

- Loop / River North: `urban_core_everyday_grid` with observed postal signal
  after the first source-resolution pass.
- Lincoln Park / Lakeview: `inner_neighborhood_everyday_grid`.
- Oakbrook widened: `confirmed_postal_big_box_edge_field`.
- Woodfield / Schaumburg: `confirmed_edge_city_mall_grocery_field`.
- Midway / Ford City: `confirmed_mall_big_box_grocery_field`.

Atlanta contributes five partial type-discovery fields, but none are baseline
comparable because every Atlanta field still carries at least five source-gated
dimensions.

Camp Creek and Northlake remain source-limited after the first Atlanta
source-resolution pass, but their post-office layers are no longer unknown:
the retries returned only excluded private shipping counters, so both fields
now carry checked absence for packet-ready USPS rows instead of post-office
source gates.

Dallas/Fort Worth contributes seven type-discovery-comparable fields and one
partial field:

- Downtown / Uptown Dallas:
  `urban_postal_grocery_health_big_box_village_field`.
- NorthPark / Preston Hollow:
  `affluent_complex_grocery_health_costco_field`.
- Galleria / Addison: `edge_city_grocery_big_box_complex_field`.
- Legacy / Frisco / Plano:
  `growth_edge_mall_grocery_health_big_box_field`.
- Arlington / Grand Prairie:
  `midcities_grocery_health_big_box_complex_field`.
- Southlake Town Square: `town_center_grocery_health_complex_field`.
- Fort Worth Cultural / West 7th:
  `secondary_core_grocery_health_big_box_plaza_field`.

Las Colinas / Irving remains partial because it combines observed grocery,
pharmacy, and retail-complex evidence with a USPS source gate and checked
mass-retail absence.

## Validation

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

The validator keeps this report as a stricter synthesis contract, so TURF can
scale new metros while preserving the distinction between complete baselines,
pre-scale stacks, checked absences, and source-gated gaps.
