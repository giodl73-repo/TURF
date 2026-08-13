# Chicago Pre-Scale Field Stack

## Scope

This report combines the current Chicago anchor-field layers before TURF scales
to another metro or adds another source family.

Included layers:

- Post office: OSM/Overpass, source-gated for six fields and observed for
  Oakbrook.
- Gym: OSM/Overpass, source-gated for all seven fields.
- Pharmacy: reviewed Illinois Overture drugstore layer.
- Mass retail: reviewed Illinois Overture Target / Walmart / Costco / Sam's
  Club layer.
- Grocery: reviewed Illinois Overture grocery layer.

Generated output:

```text
reports/ret-chicago-pre-scale-field-stack.csv
```

## Decision

Chicago is ready for type discovery, but not final ranking. The non-Overpass
stack is strong enough to classify emerging field types, while the OSM civic
and wellness dimensions still need retry or alternate source strategy.

## Learning

The current Chicago stack shows that different chain families reveal different
parts of the field:

- Pharmacy is concentrated in the urban core and inner-neighborhood fields.
- Mass retail separates Target-only urban/inner fields from edge-city and
  airport-edge big-box fields.
- Grocery reaches all seven fields and corrects the apparent thinness of Old
  Orchard and Orland Square.

The next Chicago work should add retail complexes for mall-anchor confirmation
or retry OSM with a simplified/source-strategy track. It should not scale to
another metro before this stack is used as the comparison baseline.

## Field Stack

| Field | Observed | Source-Gated | Checked Absent | Emerging Type | Readiness |
|---|---:|---:|---:|---|---|
| Loop / River North | 3 | 2 | 0 | `urban_core_everyday_grid` | `usable_for_type_discovery_retry_osm_before_ranking` |
| Lincoln Park / Lakeview | 3 | 2 | 0 | `inner_neighborhood_everyday_grid` | `usable_for_type_discovery_retry_osm_before_ranking` |
| Old Orchard / Skokie | 1 | 2 | 2 | `single_grocery_mall_field` | `source_limited_retry_or_alternate_source` |
| Oakbrook widened | 3 | 1 | 1 | `postal_big_box_edge_field` | `usable_for_type_discovery` |
| Woodfield / Schaumburg | 2 | 2 | 1 | `edge_city_grocery_big_box_field` | `source_limited_retry_or_alternate_source` |
| Midway / Ford City | 2 | 2 | 1 | `big_box_grocery_power_field` | `source_limited_retry_or_alternate_source` |
| Orland Square | 1 | 2 | 2 | `grocery_supported_mall_field` | `source_limited_retry_or_alternate_source` |

## Interpretation

Loop / River North and Lincoln Park / Lakeview are the cleanest current Chicago
type-discovery fields. They combine pharmacy, Target, and multi-brand grocery
signal, but both still have OSM post-office and gym source gates.

Oakbrook is the cleanest suburban comparison field because it has observed post
office, multi-brand mass retail, and grocery signal with only one OSM source
gate.

Woodfield and Ford City are likely edge/power fields: both combine grocery grid
signal with big-box signal, but civic/wellness OSM gates remain unresolved.

Old Orchard and Orland Square should not be downgraded yet. Their current stack
needs retail-complex confirmation because grocery shows everyday texture while
mass retail and pharmacy are checked absent inside the selected boxes.
