# Los Angeles / Inland Empire Pre-Scale Field Stack

Generated output:
`reports/ret-los-angeles-pre-scale-field-stack.csv`

## Scope

This report combines the current Los Angeles / Inland Empire anchor-field
layers before wider metro scale.

Included layers:

- Post office: OSM/Overpass, observed for Downtown LA / Koreatown /
  Mid-Wilshire and South Bay / Torrance, source-gated for five timeout fields.
- Grocery: reviewed California Overture grocery layer.
- Mass retail: reviewed California Overture Target / Walmart / Costco /
  Sam's Club layer.
- Pharmacy: reviewed California Overture CVS / Walgreens / Rite Aid /
  Good Neighbor Pharmacy exact-brand drugstore layer.
- Retail complex: target-limited reviewed California Overture mall, plaza,
  district, shopping-center, and retail-center layer.

## Decision

LA is ready for type-discovery synthesis, but not final ranking. All seven
fields have retail-complex confirmation and at least four observed layers. Two
have five observed layers with no source gates, and five are comparable with
post-office retry gates preserved.

## Field Stack

| Field | Observed | Source-Gated | Checked Absent | Emerging Type | Readiness |
| --- | ---: | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire | 5 | 0 | 0 | `confirmed_dense_postal_target_grocery_health_complex` | `type_discovery_comparable` |
| Glendale / Burbank | 4 | 1 | 0 | `confirmed_mall_big_box_grocery_cvs_field` | `type_discovery_comparable_retry_gated_postal` |
| West LA / Century City / Culver City | 4 | 1 | 0 | `confirmed_affluent_target_grocery_health_complex` | `type_discovery_comparable_retry_gated_postal` |
| South Bay / Torrance | 5 | 0 | 0 | `confirmed_postal_big_box_grocery_cvs_complex` | `type_discovery_comparable` |
| Ontario Mills / Rancho Cucamonga | 4 | 1 | 0 | `confirmed_mall_big_box_grocery_cvs_field` | `type_discovery_comparable_retry_gated_postal` |
| Riverside / Tyler / Corona edge | 4 | 1 | 0 | `confirmed_plaza_big_box_grocery_health_field` | `type_discovery_comparable_retry_gated_postal` |
| Long Beach / Lakewood | 4 | 1 | 0 | `confirmed_mall_big_box_grocery_health_field` | `type_discovery_comparable_retry_gated_postal` |

## Learning

LA is not simply urban versus suburban. The current stack shows at least five
field textures with complex confirmation:

- Confirmed dense postal Target/grocery/health complex: Downtown LA /
  Koreatown / Mid-Wilshire.
- Confirmed affluent Target/grocery/health complex: West LA / Century City /
  Culver City.
- Confirmed mall big-box grocery CVS fields: Glendale/Burbank and Ontario /
  Rancho Cucamonga.
- Confirmed postal big-box grocery CVS complex: South Bay / Torrance.
- Confirmed plaza or mall big-box grocery health fields: Riverside / Tyler /
  Corona and Long Beach / Lakewood.

Post-office source gates still matter. Five fields should not be read as
post-office absent; they are retry-gated by Overpass connection timeouts. But
the store layers are strong enough to continue learning while those civic gates
are preserved.

## Next Goal

Add the confirmed LA rows to the cross-metro type-discovery profile, while
preserving the five post-office retry gates as source-quality limits rather than
postal absence claims.
