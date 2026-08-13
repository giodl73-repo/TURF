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
| Atlanta | `type_discovery_partial` | 7 |
| Chicago | `type_discovery_comparable` | 6 |
| Chicago | `type_discovery_partial` | 1 |
| Dallas/Fort Worth | `type_discovery_comparable` | 7 |
| Dallas/Fort Worth | `type_discovery_partial` | 1 |

Profile basis:

| Basis | Fields |
|---|---:|
| `full_11_dimension_context` | 13 |
| `pre_scale_6_layer_stack` | 7 |
| `pre_scale_5_layer_stack` | 8 |

## Current Comparable Types

Washington contributes the complete baseline set. Chicago now contributes six
type-discovery-comparable fields:

- Loop / River North: `urban_core_everyday_grid` with observed postal signal
  after the first source-resolution pass.
- Lincoln Park / Lakeview: `inner_neighborhood_everyday_grid`.
- Oakbrook widened: `confirmed_postal_big_box_edge_field`.
- Woodfield / Schaumburg: `confirmed_edge_city_mall_grocery_field`.
- Midway / Ford City: `confirmed_mall_big_box_grocery_field`.
- Orland Square: `confirmed_grocery_supported_mall_field` with observed postal
  civic signal after the second Chicago post-office source-resolution pass.

Atlanta contributes seven partial type-discovery fields, but none are baseline
comparable because every Atlanta field still carries at least three
source-gated dimensions.

Camp Creek moved out of the `source_limited` comparison tier after the service
source-resolution pass. The field now has observed bank, gas/convenience, and
gym signal, with post office, library, transit, hardware, and pharmacy checked
absent. That makes it a finance/car-trip/wellness airport-edge field rather
than a wellness-only sparse row.

Northlake moved out of the `source_limited` comparison tier after the gym retry:
post office is checked absent, library is observed, gym is observed, and
park/open-space plus transit remain source-gated. That makes Northlake a legacy
suburban mall node with public civic-service and wellness anchors, not just an
Overpass timeout artifact.

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
