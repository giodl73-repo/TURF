# Enclave Family Consolidation

Generated output:
`reports/ret-enclave-family-consolidation.csv`

Inputs:

```text
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-cross-metro-car-trip-stack-comparison.csv
```

## Scope

This report consolidates TURF's 42 detailed type-discovery labels into reusable
high-level enclave families.

The detailed labels remain the source of truth for specific field reads. The
families are an organizing layer so TURF can compare recurring terrain without
losing local specificity.

Car-trip stack signals are preserved as modifiers. They do not replace the core
family assignment.

## Current Read

The current cross-metro profile has:

| Layer | Count |
| --- | ---: |
| Fields | 43 |
| Detailed type-discovery labels | 42 |
| Consolidated enclave families | 10 |
| Car-trip stack modifiers | 9 |

Family counts:

| Enclave family | Fields | Detailed labels |
| --- | ---: | ---: |
| `urban_civic_rail_core` | 10 | 10 |
| `edge_city_big_box_power_field` | 8 | 8 |
| `mall_led_regional_field` | 7 | 6 |
| `car_oriented_corridor_enclave` | 4 | 4 |
| `affluent_town_center_field` | 3 | 3 |
| `office_river_secondary_core_field` | 3 | 3 |
| `port_event_industrial_civic_field` | 3 | 3 |
| `health_finance_household_service_field` | 2 | 2 |
| `neighborhood_everyday_service` | 2 | 2 |
| `open_space_transit_service_field` | 1 | 1 |

## Family Definitions

### `urban_civic_rail_core`

Dense civic, rail, downtown, urban-core, eds/meds, or mixed-service fields
where the bounded geography is shaped by core city infrastructure as much as
retail.

Examples:

- Bellevue core.
- Loop / River North.
- Downtown / Uptown Dallas.
- Downtown LA / Koreatown / Mid-Wilshire.
- Center City / Market East.
- University City / 30th Street.

### `edge_city_big_box_power_field`

Suburban or polycentric fields where big-box, grocery, pharmacy, retail-complex,
or edge-city evidence creates the main commercial structure.

Examples:

- Perimeter.
- Oakbrook.
- Woodfield / Schaumburg.
- Galleria / Addison.
- Legacy / Frisco / Plano.
- Riverside / Tyler / Corona.
- South Bay / Torrance.

### `mall_led_regional_field`

Fields where a mall, superregional mall, or mall-adjacent retail complex is the
primary organizing anchor, even when grocery, big-box, or car-trip support is
also present.

Examples:

- Tacoma Mall.
- Old Orchard / Skokie.
- Glendale / Burbank.
- Ontario Mills / Rancho Cucamonga.
- King of Prussia.

### `car_oriented_corridor_enclave`

Fields where the detailed label or sidecars show older auto corridors,
midcities/event power fields, QSR/auto-service texture, or car-trip finance
edge signal as the primary terrain.

Examples:

- South Hill / Puyallup.
- Camp Creek.
- Northeast Roosevelt.
- Cherry Hill / Moorestown.

### `affluent_town_center_field`

Fields where affluent, town-center, Costco/health/grocery, or office-retail
evidence creates a selective service and retail pattern.

Examples:

- NorthPark / Preston Hollow.
- Southlake Town Square.
- West LA / Century City / Culver City.

### `office_river_secondary_core_field`

Secondary cores, office edges, and river-office suburban fields where the core
profile reads as service/office-oriented rather than mall-led or urban civic.

Examples:

- Fort Worth Cultural / West 7th.
- Las Colinas / Irving.
- Conshohocken / Plymouth Meeting.

### `port_event_industrial_civic_field`

Port, event, industrial, coastal, or midcities fields where movement
infrastructure, event geography, or older industrial/civic structure remains
visible in the commercial pattern.

Examples:

- Midway / Ford City.
- Arlington / Grand Prairie.
- Long Beach / Lakewood.
- South Philadelphia Sports / Port.

### `health_finance_household_service_field`

Fields where finance, health, household-service, wellness, or legacy-service
evidence is the main differentiator.

Examples:

- Cumberland / Vinings.
- Northlake.

### `neighborhood_everyday_service`

Inner neighborhood or service-village fields where everyday grocery, QSR,
health, finance, or local-service evidence matters more than regional retail
scale.

Examples:

- Decatur / Emory.
- Lincoln Park / Lakeview.

### `open_space_transit_service_field`

Fields where postal, open-space, transit, and modest service evidence provide
the main structure.

Example:

- Factoria.

## Roles Review

The `.roles` review supports this consolidation with constraints:

- Market Geographer: pass. Families compare lived/commercial terrain without
  turning them into official municipal or corporate boundaries.
- Catchment Modeler: pass. Families remain summaries, not nearest-store,
  drive-time, or gravity assignments.
- Source Policy Auditor: pass. The report uses generated public-footprint
  summaries and keeps source/contract gaps explicit.
- Atlas Designer: pass. A 10-family layer is more atlas-friendly than 42
  one-off labels, while detailed labels remain inspectable.
- Market Analyst: pass. The CSV can be opened directly in a spreadsheet or GIS
  workflow and compared by family, region, detailed label, and car-trip
  modifier.
- Report Contract Editor: pass. The CSV preserves stable fields:
  `enclave_family`, `type_discovery_label`, `car_trip_stack_signal`,
  `profile_basis`, and `comparison_tier`.

## Decision

Use the 10 enclave families as the top-level TURF typology for current
cross-metro analysis.

Keep the 42 detailed labels as field-specific subtypes.

Keep the 9 car-trip stack labels as modifiers.

This gives TURF a three-level structure:

```text
family -> detailed field type -> sidecar modifiers
```

## Next

Before scaling to another metro, decide whether the next work should:

1. backfill Washington / Atlanta to current field-aligned sidecars, or
2. add a seventh metro under the new family + detailed type + modifier contract.
