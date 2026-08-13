# Los Angeles / Inland Empire Pre-Scale Field Stack

Generated output:
`reports/ret-los-angeles-pre-scale-field-stack.csv`

## Scope

This report combines the current Los Angeles / Inland Empire anchor-field
layers before retail-complex confirmation or wider metro scale.

Included layers:

- Post office: OSM/Overpass, observed for Downtown LA / Koreatown /
  Mid-Wilshire and South Bay / Torrance, source-gated for five timeout fields.
- Grocery: reviewed California Overture grocery layer.
- Mass retail: reviewed California Overture Target / Walmart / Costco /
  Sam's Club layer.
- Pharmacy: reviewed California Overture CVS / Walgreens / Rite Aid /
  Good Neighbor Pharmacy exact-brand drugstore layer.

## Decision

LA is ready for pre-complex type discovery, but not final cross-metro typing.
All seven fields have at least three observed layers. Two have four observed
layers with no source gates, and five are usable with post-office retry gates
preserved.

The next source layer should be retail-complex confirmation, because LA already
has enough common-store signal to propose field types but still needs mall,
power-center, and shopping-center structure before cross-metro synthesis.

## Field Stack

| Field | Observed | Source-Gated | Checked Absent | Emerging Type | Readiness |
| --- | ---: | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire | 4 | 0 | 0 | `dense_postal_target_grocery_health_grid` | `pre_complex_type_discovery_comparable` |
| Glendale / Burbank | 3 | 1 | 0 | `big_box_grocery_cvs_service_field` | `pre_complex_type_discovery_retry_gated_postal` |
| West LA / Century City / Culver City | 3 | 1 | 0 | `affluent_target_grocery_health_grid` | `pre_complex_type_discovery_retry_gated_postal` |
| South Bay / Torrance | 4 | 0 | 0 | `postal_big_box_grocery_cvs_field` | `pre_complex_type_discovery_comparable` |
| Ontario Mills / Rancho Cucamonga | 3 | 1 | 0 | `big_box_grocery_cvs_service_field` | `pre_complex_type_discovery_retry_gated_postal` |
| Riverside / Tyler / Corona edge | 3 | 1 | 0 | `multi_brand_big_box_grocery_health_field` | `pre_complex_type_discovery_retry_gated_postal` |
| Long Beach / Lakewood | 3 | 1 | 0 | `multi_brand_big_box_grocery_health_field` | `pre_complex_type_discovery_retry_gated_postal` |

## Learning

LA is not simply urban versus suburban. The current stack shows at least five
field textures before complex confirmation:

- Dense postal Target/grocery/health grid: Downtown LA / Koreatown /
  Mid-Wilshire.
- Affluent Target/grocery/health grid: West LA / Century City / Culver City.
- Big-box grocery CVS service fields: Glendale/Burbank and Ontario/Rancho
  Cucamonga.
- Postal big-box grocery CVS field: South Bay / Torrance.
- Multi-brand big-box grocery health fields: Riverside / Tyler / Corona and
  Long Beach / Lakewood.

Post-office source gates still matter. Five fields should not be read as
post-office absent; they are retry-gated by Overpass connection timeouts. But
the store layers are strong enough to continue learning while those civic gates
are preserved.

## Next Goal

Add retail-complex confirmation for the same seven fields. That should test
whether the proposed field types are anchored by mall, power-center, lifestyle,
or shopping-center structure before LA rows enter cross-metro type synthesis.
