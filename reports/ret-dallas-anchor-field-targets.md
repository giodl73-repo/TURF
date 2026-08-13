# Dallas/Fort Worth Anchor-Field Targets

## Scope

This report defines the next pre-scale target set after Washington, Atlanta,
and Chicago. Dallas/Fort Worth is a type-discovery target, not a final atlas
ranking target.

Generated output:

```text
reports/ret-dallas-anchor-field-targets.csv
```

## Why Dallas/Fort Worth

Dallas/Fort Worth is the right next metro because it tests a Sun Belt
metroplex form that Washington, Atlanta, and Chicago do not fully cover:
multiple urban cores, airport/office edges, fast-growing north-suburban retail,
planned town centers, and mid-cities power/event districts.

That makes it useful for the user's current question: what signal is left
before TURF scales to more urban areas? The answer is not only more stores. The
next signal is whether the same typed enclave forms recur when the metro is
polycentric rather than one core plus suburbs.

## Target Set

| Field | Expected Test | Why It Matters |
|---|---|---|
| Downtown / Uptown Dallas | `urban_core_everyday_grid` | Tests a Sun Belt downtown/uptown grid against Chicago Loop and Bellevue core. |
| NorthPark / Preston Hollow | `confirmed_mall_grocery_affluent_field` | Tests an established affluent mall field with grocery and everyday services. |
| Galleria / Addison | `edge_city_mall_service_grid` | Tests a mall/office edge city against Perimeter and Oakbrook. |
| Legacy / Frisco / Plano | `growth_edge_city_mall_big_box_field` | Tests a newer growth-edge field with mall, lifestyle, and big-box anchors. |
| Las Colinas / Irving | `airport_office_edge_service_field` | Tests an airport-adjacent office/retail edge against Camp Creek and Ford City. |
| Arlington / Grand Prairie | `midcities_mall_power_field` | Tests a mid-cities field between Dallas and Fort Worth. |
| Southlake Town Square | `affluent_town_center_retail_field` | Tests a planned suburban town-center anchor. |
| Fort Worth Cultural / West 7th | `secondary_core_everyday_grid` | Tests whether the metroplex has a second urban everyday core. |

## Pre-Scale Goal

Before TURF scales to several more metros, Dallas/Fort Worth should produce at
least five `type_discovery_comparable` fields in the cross-metro profile.

The first stack should favor public layers that have already carried signal:

- post offices as the postal/civic original-TURF layer,
- grocery as neighborhood-service texture,
- pharmacy as health-errand texture,
- mass retail as Target/Walmart/Costco/Sam's Club destination texture,
- retail complexes as mall/lifestyle-center confirmation,
- one or two routine-service layers such as bank/credit union, gas/convenience,
  gym, hardware, dollar store, or laundromat when source response quality is
  acceptable.

## Readiness

All eight targets should validate to `ready_for_context_extraction`.

The acceptance gate stays the cross-metro validator:

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

New Dallas/Fort Worth rows should enter that profile only after the source
stack preserves observed, checked-absent, and source-gated counts separately.
