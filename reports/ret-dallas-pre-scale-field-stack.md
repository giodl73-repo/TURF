# Dallas/Fort Worth Pre-Scale Field Stack

## Scope

This report combines the current Dallas/Fort Worth anchor-field layers before
TURF adds a fifth metro or expands into another source family.

Included layers:

- Post office: OSM/Overpass, observed for four fields, checked absent for
  Legacy / Frisco / Plano, and source-gated for three timeout fields.
- Grocery: reviewed Texas Overture grocery layer.
- Mass retail: reviewed Texas Overture Target / Walmart / Costco / Sam's Club
  layer.
- Pharmacy: reviewed Texas Overture CVS / Walgreens exact-brand drugstore
  layer.
- Retail complex: target-limited reviewed Texas Overture mall and shopping
  complex layer.

Generated output:

```text
reports/ret-dallas-pre-scale-field-stack.csv
```

## Decision

Dallas/Fort Worth is ready for type-discovery synthesis, but not final ranking.
The five-layer stack yields five clean comparable fields, two comparable fields
that need a post-office retry, and one partial field.

This satisfies the pre-scale goal for learning. TURF can now compare Dallas
against Washington, Atlanta, and Chicago before adding another urban area.

## Learning

The current Dallas/Fort Worth stack shows that common stores and post offices
are measuring different kinds of terrain:

- Grocery reaches every field and is the strongest baseline everyday-service
  signal.
- Retail complexes also reach every field, which means the selected boxes are
  anchor-aware rather than arbitrary city snippets.
- Mass retail separates big-box fields from grocery-rich town-center or
  office-edge fields.
- Pharmacy adds health-errand texture in seven fields, but Galleria / Addison
  stays checked absent for this exact-brand layer.
- USPS/post-office evidence remains useful where observed, but the Overpass
  source gates should be treated as source quality, not true absence.

## Field Stack

| Field | Observed | Source-Gated | Checked Absent | Emerging Type | Readiness |
|---|---:|---:|---:|---|---|
| Downtown / Uptown Dallas | 5 | 0 | 0 | `urban_postal_grocery_health_big_box_village_field` | `type_discovery_comparable` |
| NorthPark / Preston Hollow | 5 | 0 | 0 | `affluent_complex_grocery_health_costco_field` | `type_discovery_comparable` |
| Galleria / Addison | 4 | 0 | 1 | `edge_city_grocery_big_box_complex_field` | `type_discovery_comparable` |
| Legacy / Frisco / Plano | 4 | 0 | 1 | `growth_edge_mall_grocery_health_big_box_field` | `type_discovery_comparable` |
| Las Colinas / Irving | 3 | 1 | 1 | `office_edge_grocery_health_complex_field` | `type_discovery_partial` |
| Arlington / Grand Prairie | 4 | 1 | 0 | `midcities_grocery_health_big_box_complex_field` | `type_discovery_comparable_retry_gated_layer` |
| Southlake Town Square | 4 | 0 | 1 | `town_center_grocery_health_complex_field` | `type_discovery_comparable` |
| Fort Worth Cultural / West 7th | 4 | 1 | 0 | `secondary_core_grocery_health_big_box_plaza_field` | `type_discovery_comparable_retry_gated_layer` |

## Interpretation

Downtown / Uptown Dallas and NorthPark / Preston Hollow are the cleanest
Dallas-side comparisons. Both have all five layers observed, but they are not
the same kind of field: Uptown combines urban postal, grocery, pharmacy,
Sam's Club, and West Village evidence, while NorthPark combines postal,
grocery, pharmacy, Costco, and named complex evidence.

Galleria / Addison and Legacy / Frisco / Plano are strong north-suburban
comparisons with different absences. Galleria has grocery, multi-brand big-box,
and retail-complex signal but no exact-brand pharmacy row. Legacy has grocery,
Walmart, pharmacy, and confirmed mall/lifestyle structure, but no USPS row
inside the current post-office review.

Southlake is not weak because it lacks mass retail inside the box. The current
stack reads it as a grocery-health-town-center field rather than a big-box
power field.

Las Colinas / Irving is the one partial field. It has grocery, pharmacy, and
retail-complex evidence, while post office is source-gated and mass retail is
checked absent.

Arlington / Grand Prairie and Fort Worth Cultural / West 7th are usable
type-discovery rows after preserving their USPS source gates. They should be
included in synthesis, but not used for final ranking until the post-office
layer is retried or replaced.

## Next Goal

The next reasonable self-executing goal is:

```text
Add Dallas/Fort Worth to the cross-metro type-discovery profile after a
one-report synthesis pass, without adding a fifth metro yet.
```

That goal keeps learning local: TURF should first compare the typed Dallas
fields against Washington, Atlanta, and Chicago, then decide whether the next
source family should be more USPS/civic coverage, more common stores, or a new
urban area.
