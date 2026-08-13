# Los Angeles / Inland Empire Type-Discovery Synthesis

Generated profile:
`reports/ret-cross-metro-type-discovery-profile.csv`

Source stack:
`reports/ret-los-angeles-pre-scale-field-stack.csv`

## Result

Los Angeles / Inland Empire now contributes seven rows to the cross-metro
type-discovery profile.

| Field | Type-discovery label | Source note |
| --- | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire | `confirmed_dense_postal_target_grocery_health_complex` | no_source_gates |
| Glendale / Burbank | `confirmed_mall_big_box_grocery_cvs_field` | usable_for_type_discovery_retry_osm_before_ranking |
| West LA / Century City / Culver City | `confirmed_affluent_target_grocery_health_complex` | usable_for_type_discovery_retry_osm_before_ranking |
| South Bay / Torrance | `confirmed_postal_big_box_grocery_cvs_complex` | no_source_gates |
| Ontario Mills / Rancho Cucamonga | `confirmed_mall_big_box_grocery_cvs_field` | usable_for_type_discovery_retry_osm_before_ranking |
| Riverside / Tyler / Corona edge | `confirmed_plaza_big_box_grocery_health_field` | usable_for_type_discovery_retry_osm_before_ranking |
| Long Beach / Lakewood | `confirmed_mall_big_box_grocery_health_field` | usable_for_type_discovery_retry_osm_before_ranking |

## Learning

The LA rows make the profile much richer because they separate dense urban,
affluent office-retail, valley/town-center, coastal mall, inland freeway,
inland plaza, and port/coastal mall textures inside one metro region.

The biggest source-policy lesson is that LA can be type-discovery comparable
even with five postal retry gates, because the grocery, mass-retail, pharmacy,
and retail-complex layers are all observed. Those five fields should not be
used for final postal ranking until the Overpass post-office gates are retried
or replaced.
