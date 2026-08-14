# Cross-Metro Type-Discovery Profile

## Scope

This report normalizes Washington, Atlanta, Chicago, Dallas/Fort Worth, Los
Angeles / Inland Empire, and Philadelphia / South Jersey anchor-field outputs
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

The profile basis is part of the contract. Washington and Atlanta use a full
11-dimension context contract. Chicago uses a pre-scale 6-layer stack.
Dallas/Fort Worth and Los Angeles / Inland Empire use pre-scale 5-layer stacks.
Philadelphia / South Jersey uses a pre-scale 5-layer stack with QSR and
auto-parts sidecars preserved in the row source-quality notes and field labels.
The profile is comparable for type discovery, not final atlas ranking.

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

The current generated profile has 43 rows:

| Region | Tier | Fields |
|---|---|---:|
| Washington | `baseline_comparable` | 6 |
| Atlanta | `type_discovery_partial` | 7 |
| Chicago | `type_discovery_comparable` | 7 |
| Dallas/Fort Worth | `type_discovery_comparable` | 8 |
| Los Angeles / Inland Empire | `type_discovery_comparable` | 7 |
| Philadelphia / South Jersey | `type_discovery_comparable` | 8 |

Profile basis:

| Basis | Fields |
|---|---:|
| `full_11_dimension_context` | 13 |
| `pre_scale_6_layer_stack` | 7 |
| `pre_scale_5_layer_stack` | 15 |
| `pre_scale_5_layer_stack_with_sidecars` | 8 |

## Current Comparable Types

Washington contributes the complete baseline set. Chicago now contributes seven
type-discovery-comparable fields:

- Loop / River North: `urban_core_everyday_grid` with observed postal signal
  after the first source-resolution pass.
- Lincoln Park / Lakeview: `inner_neighborhood_everyday_grid`.
- Old Orchard / Skokie: `confirmed_single_grocery_mall_field` with observed
  postal and wellness signal after the Old Orchard source-resolution pass.
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

Northlake moved into a usable comparison tier after the service retry: post
office is checked absent, library is observed, and bank, gas/convenience,
pharmacy, hardware, and gym are observed. That makes Northlake a
finance/car-trip/health/trade/wellness legacy mall field, not just an Overpass
timeout artifact.

Dallas/Fort Worth contributes eight type-discovery-comparable fields:

- Downtown / Uptown Dallas:
  `urban_postal_grocery_health_big_box_village_field`.
- NorthPark / Preston Hollow:
  `affluent_complex_grocery_health_costco_field`.
- Galleria / Addison: `edge_city_grocery_big_box_complex_field`.
- Legacy / Frisco / Plano:
  `growth_edge_mall_grocery_health_big_box_field`.
- Las Colinas / Irving: `office_edge_grocery_health_complex_field` with
  observed postal signal after the Las Colinas source-resolution pass.
- Arlington / Grand Prairie:
  `midcities_grocery_health_big_box_complex_field`.
- Southlake Town Square: `town_center_grocery_health_complex_field`.
- Fort Worth Cultural / West 7th:
  `secondary_core_grocery_health_big_box_plaza_field`.

Las Colinas / Irving moved out of the partial tier after its USPS retry. It now
combines observed grocery, pharmacy, retail-complex, and postal evidence with
checked mass-retail absence.

Los Angeles / Inland Empire contributes seven type-discovery-comparable fields:

- Downtown LA / Koreatown / Mid-Wilshire:
  `confirmed_dense_postal_target_grocery_health_complex`.
- Glendale / Burbank: `confirmed_mall_big_box_grocery_cvs_field`.
- West LA / Century City / Culver City:
  `confirmed_affluent_target_grocery_health_complex`.
- South Bay / Torrance: `confirmed_postal_big_box_grocery_cvs_complex`.
- Ontario Mills / Rancho Cucamonga:
  `confirmed_mall_big_box_grocery_cvs_field`.
- Riverside / Tyler / Corona edge:
  `confirmed_plaza_big_box_grocery_health_field`.
- Long Beach / Lakewood: `confirmed_mall_big_box_grocery_health_field`.

Downtown LA / Koreatown / Mid-Wilshire and South Bay / Torrance have all five
layers observed with no source gates. The other five LA fields preserve
post-office retry gates from Overpass connection timeouts, but their store and
complex layers are strong enough for type discovery before final ranking.

Philadelphia / South Jersey contributes eight rows from a five-core-layer stack
with QSR and auto-parts sidecars:

- Center City / Market East:
  `dense_rail_civic_grocery_health_target_district_field`.
- University City / 30th Street:
  `eds_meds_rail_grocery_health_district_field`.
- King of Prussia: `mall_led_edge_city_costco_town_center_field`.
- Northeast Philadelphia / Roosevelt Boulevard:
  `older_auto_corridor_mall_grocery_qsr_auto_service_field`.
- Conshohocken / Plymouth Meeting:
  `river_office_mall_grocery_health_service_node`.
- South Philadelphia Sports / Port:
  `event_port_plaza_grocery_qsr_auto_service_field`.
- Camden Waterfront / Cooper:
  `older_industrial_river_civic_single_grocery_service_field`.
- Cherry Hill / Moorestown:
  `south_jersey_mall_big_box_grocery_qsr_auto_corridor`.

Philadelphia adds a useful Northeast contrast. King of Prussia is mall-led and
specialized, with retail-complex and Costco evidence but grocery, pharmacy, and
auto-parts checked absent inside the bounded box. Cherry Hill / Moorestown is a
fuller cross-state mall corridor with big-box, grocery, pharmacy, QSR, and
auto-parts texture. Northeast Roosevelt is the clearest older auto-corridor
field, confirmed by both the four-brand QSR grid and auto-parts sidecar.
Camden remains partial by design: it has postal, grocery, and QSR evidence but
stays checked absent for the major retail-complex, big-box, pharmacy, and
auto-parts layers.

## Validation

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

The validator keeps this report as a stricter synthesis contract, so TURF can
scale new metros while preserving the distinction between complete baselines,
pre-scale stacks, checked absences, and source-gated gaps.
