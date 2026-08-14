# Philadelphia / South Jersey Pre-Scale Field Stack

## Scope

This report combines the current Philadelphia / South Jersey anchor-field
layers before TURF scales to another metro.

Included core layers:

- Post office: OSM/Overpass, observed for all eight fields.
- Grocery: reviewed Pennsylvania / New Jersey Overture grocery layer.
- Mass retail: reviewed Pennsylvania / New Jersey Target / Walmart / Costco /
  Sam's Club layer.
- Pharmacy: reviewed Pennsylvania / New Jersey CVS / Walgreens / Rite Aid /
  Good Neighbor Pharmacy exact-brand drugstore layer.
- Retail complex: target-limited reviewed Pennsylvania / New Jersey mall,
  shopping-center, plaza, and retail-district layer.

Included sidecars:

- QSR: reviewed McDonald's / Burger King / Wendy's / Taco Bell layer.
- Auto parts: reviewed AutoZone / O'Reilly / NAPA / Advance Auto Parts layer.

Generated output:

```text
reports/ret-philadelphia-pre-scale-field-stack.csv
```

## Decision

Philadelphia / South Jersey is ready for type-discovery synthesis. All eight
fields have zero source gates after the core five-layer stack, and seven fields
reach at least four observed core layers. Camden is intentionally thinner, but
still useful as an older industrial river civic comparison field because it has
postal, grocery, and QSR service-node signal while retail-complex, big-box,
pharmacy, and auto-parts rows stay checked absent.

## Field Stack

| Field | Core Observed | Core Absent | Sidecars | Emerging Type | Readiness |
|---|---:|---:|---:|---|---|
| Center City / Market East | 5 | 0 | 1 | `dense_rail_civic_grocery_health_target_district_field` | `type_discovery_comparable` |
| University City / 30th Street | 4 | 1 | 1 | `eds_meds_rail_grocery_health_district_field` | `type_discovery_comparable` |
| King of Prussia | 3 | 2 | 1 | `mall_led_edge_city_costco_town_center_field` | `type_discovery_partial` |
| Northeast Philadelphia / Roosevelt Boulevard | 5 | 0 | 2 | `older_auto_corridor_mall_grocery_qsr_auto_service_field` | `type_discovery_comparable` |
| Conshohocken / Plymouth Meeting | 4 | 1 | 1 | `river_office_mall_grocery_health_service_node` | `type_discovery_comparable` |
| South Philadelphia Sports / Port | 4 | 1 | 2 | `event_port_plaza_grocery_qsr_auto_service_field` | `type_discovery_comparable` |
| Camden Waterfront / Cooper | 2 | 3 | 1 | `older_industrial_river_civic_single_grocery_service_field` | `source_limited_retry_or_add_layers` |
| Cherry Hill / Moorestown | 5 | 0 | 2 | `south_jersey_mall_big_box_grocery_qsr_auto_corridor` | `type_discovery_comparable` |

## Learning

Philadelphia / South Jersey adds a strong Northeast pattern to the profile.
The same metro contains dense rail/civic core fields, eds-and-meds service
terrain, a mall-led edge city, older auto-corridor retail, event/port plaza
terrain, an older industrial river civic field, and a cross-state South Jersey
mall corridor.

The sidecars are doing real work. QSR is broad enough to appear in every field,
but only Northeast Roosevelt becomes a four-brand dense QSR grid. Auto parts is
much more selective and appears only in Northeast Roosevelt, South Philadelphia,
and Cherry Hill / Moorestown. That separates car-service corridors from
mall-led King of Prussia and from the urban rail/civic fields.

The key distinction is King of Prussia versus Cherry Hill / Moorestown. Both
are mall-led, but Cherry Hill / Moorestown also carries big-box, QSR, grocery,
pharmacy, and auto-parts corridor signal. King of Prussia is more specialized:
retail-complex plus Costco, with grocery, pharmacy, and auto-parts checked
absent inside the bounded box.

## Next Goal

Add Philadelphia / South Jersey to the cross-metro type-discovery profile, then
decide whether the next scale move should add a seventh metro or deepen all
metros with another civic/common-store layer such as banks/credit unions or
gas/convenience.
