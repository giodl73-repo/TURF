# Dallas/Fort Worth Type-Discovery Synthesis

## Scope

This synthesis interprets the current Dallas/Fort Worth field stack after
post-office, grocery, mass-retail, pharmacy, and retail-complex layers.

Evidence source:

```text
reports/ret-dallas-pre-scale-field-stack.csv
```

## Decision

Dallas/Fort Worth is ready for typed-enclave discovery. It is not ready for
final cross-metro ranking because three fields still have USPS source gates and
the profile is a five-layer stack rather than the full Washington/Atlanta
11-dimension context.

The useful move is to add Dallas/Fort Worth to the cross-metro profile now,
then compare its typed fields against Washington, Atlanta, and Chicago before
collecting a fifth metro.

## Field Types

| Field | Current Type | What Defines It |
|---|---|---|
| Downtown / Uptown Dallas | `urban_postal_grocery_health_big_box_village_field` | Post offices, grocery, CVS, Sam's Club, and West Village produce an urban mixed-service field. |
| NorthPark / Preston Hollow | `affluent_complex_grocery_health_costco_field` | Post office, grocery depth, CVS, Costco, NorthPark Center, and Preston Center mark an affluent complex field. |
| Galleria / Addison | `edge_city_grocery_big_box_complex_field` | Grocery, Target/Walmart, and Addison Walk confirm an edge-city retail field despite exact-brand pharmacy absence. |
| Legacy / Frisco / Plano | `growth_edge_mall_grocery_health_big_box_field` | Stonebriar Mall, Legacy West, H-E-B/Sprouts/Tom Thumb/Market Street, Walmart, and CVS define a north-growth mall edge. |
| Las Colinas / Irving | `office_edge_grocery_health_complex_field` | Grocery, CVS, and Las Colinas Urban Center are present, while post office is source-gated and mass retail is absent. |
| Arlington / Grand Prairie | `midcities_grocery_health_big_box_complex_field` | Grocery, Walmart, CVS, and Lincoln Square mark a mid-cities field, with USPS source-gated. |
| Southlake Town Square | `town_center_grocery_health_complex_field` | Grocery, CVS, post office, and Park Village define a town-center field without direct mass retail. |
| Fort Worth Cultural / West 7th | `secondary_core_grocery_health_big_box_plaza_field` | Grocery, Target, CVS, Montgomery Plaza, and West 7th Plaza define a second-core field, with USPS source-gated. |

## What This Teaches

Dallas/Fort Worth adds useful Sun Belt variation to the profile:

- Downtown and Uptown can be service-rich without reading like a traditional
  regional mall field.
- Affluent north Dallas separates NorthPark/Preston Hollow from newer
  Legacy/Frisco/Plano growth geography.
- Southlake shows that absence of Target/Walmart/Costco/Sam's Club inside a
  bounded field can be a type signal, not weakness.
- Arlington and Fort Worth show why DFW should not be reduced to Dallas-only
  geography.
- Las Colinas is a legitimate office-edge service field, but it should stay
  partial until the USPS gate is retried or replaced.

## Source Limits

The synthesis deliberately avoids final strength ranking:

- Post office is source-gated for Las Colinas / Irving, Arlington / Grand
  Prairie, and Fort Worth Cultural / West 7th.
- Legacy / Frisco / Plano has checked absence for packet-ready USPS rows
  inside the current reviewed post-office layer.
- Mass retail is checked absent in Las Colinas / Irving and Southlake Town
  Square inside the selected boxes.
- Pharmacy is exact-brand CVS/Walgreens evidence, not complete pharmacy access.
- Retail-complex evidence is target-limited, not a complete Texas complex
  census.

## Next Goal

Add Dallas/Fort Worth rows to the cross-metro type-discovery profile and use
that table to decide the next scale move. The profile should answer whether the
next work should be more civic/postal source resolution, more common-store
intersections, or a fifth metro.
