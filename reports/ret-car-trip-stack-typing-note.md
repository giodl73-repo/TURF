# Car-Trip Stack Typing Note

This note converts the Pulse 162 car-trip stack comparison into reusable labels
for future metros.

Primary evidence:

```text
reports/ret-cross-metro-car-trip-stack-comparison.csv
reports/ret-cross-metro-car-trip-stack-comparison.md
```

## Scope

The car-trip stack is a sidecar stack, not a core profile replacement.

It uses:

- QSR: daily-trip food saturation.
- Auto parts: trade, repair, and car-service corridor depth.
- Gas / convenience: car-trip, highway, port/coastal, and mobility texture.

The stack refines fields after the core evidence is in place. It should not
replace postal, grocery, mass retail, pharmacy, or retail-complex evidence.

## Required Evidence

A field can receive a reusable car-trip stack label only when all three sidecars
are field-aligned to the same target box:

- QSR summary.
- Auto-parts summary.
- Gas / convenience summary.

If one layer is missing or exists only at an older metro/place scope, keep the
field out of stack proof and mark it as `stack_not_field_aligned`.

Washington and Atlanta remain historical evidence for the current wave because
their QSR and auto-parts evidence is not yet in the current field-aligned
sidecar contract.

## Reusable Labels

### `all_three_dense_car_trip_grid`

Minimum evidence:

- QSR is `four_brand_dense_qsr_grid`.
- Auto parts is `dense_multi_brand_auto_service_grid`.
- Gas / convenience is `dense_multi_brand_car_trip_grid`.

Meaning:

This is the strongest car-oriented terrain type. It combines daily-trip food,
repair/service, and car-trip fuel/convenience density inside the same bounded
field.

Pulse 162 example:

- Arlington / Grand Prairie.

### `combined_car_oriented_retail_enclave`

Minimum evidence:

- QSR is `four_brand_dense_qsr_grid` or `multi_brand_qsr_corridor`.
- Auto parts is `multi_brand_auto_service_corridor` or stronger.
- Gas / convenience is `dense_multi_brand_car_trip_grid`.

Meaning:

This is a combined car-oriented enclave: strong food trips, repair/service
support, and dense car-trip support. It may be a port/coastal grid, freeway
edge, inland growth field, or broad auto-oriented retail field.

Pulse 162 examples:

- All seven Los Angeles / Inland Empire fields.
- Northeast Roosevelt.
- Cherry Hill / Moorestown.

### `combined_car_oriented_retail_corridor`

Minimum evidence:

- QSR is `four_brand_dense_qsr_grid` or `multi_brand_qsr_corridor`.
- Auto parts is `multi_brand_auto_service_corridor` or stronger.
- Gas / convenience is `multi_brand_car_trip_corridor`.

Meaning:

This is a car-oriented corridor rather than a full dense grid. The field has
food, service, and car-trip evidence, but the gas / convenience layer is
corridor-level.

Pulse 162 examples:

- Midway / Ford City.
- South Philadelphia Sports / Port.

### `food_forward_daily_trip_field`

Minimum evidence:

- QSR is `four_brand_dense_qsr_grid` or `multi_brand_qsr_corridor`.
- Auto parts is `checked_absent` or `single_auto_parts_anchor`.
- Gas / convenience is `multi_brand_car_trip_corridor` or
  `gas_convenience_service_node`.

Meaning:

This field is daily-trip and food-forward, not a car-service corridor. It may
be an urban core, neighborhood field, or mixed service field with enough fuel /
convenience support to show car-trip texture but not repair/service depth.

Pulse 162 examples:

- Lincoln Park / Lakeview.
- Loop / River North.
- Downtown / Uptown Dallas.

### `gas_highway_grid_auto_service_light`

Minimum evidence:

- Gas / convenience is `dense_multi_brand_car_trip_grid`.
- Auto parts is `checked_absent` or `single_auto_parts_anchor`.
- QSR is present as at least a service node or corridor.

Meaning:

This field is more about mobility, highway, office-edge, or growth-edge car
trips than repair/service corridors. It should not be upgraded to
auto-service terrain without stronger auto-parts evidence.

Pulse 162 examples:

- Las Colinas / Irving.
- Legacy / Frisco / Plano.

### `gas_corridor_food_light`

Minimum evidence:

- Gas / convenience is `multi_brand_car_trip_corridor`.
- QSR is `qsr_service_node` or weaker.
- Auto parts is `checked_absent` or weak.

Meaning:

This field has visible gas / convenience corridor support, but it is not a
food-saturated or auto-service field. Keep the core civic, rail, medical,
office, or retail label primary.

Pulse 162 examples:

- Center City / Market East.
- University City / 30th Street.

### `light_car_trip_support_core_field`

Minimum evidence:

- QSR is `single_qsr_anchor` or weak.
- Auto parts is `single_auto_parts_anchor` or `checked_absent`.
- Gas / convenience is `single_gas_convenience_anchor` or
  `gas_convenience_service_node`.

Meaning:

This field has car-trip support, but the stack should not materially change the
core interpretation. Keep the field typed by its core evidence.

Pulse 162 examples:

- Old Orchard / Skokie.
- Fort Worth Cultural / West 7th.
- Southlake Town Square.

### `light_service_node_car_trip_support`

Minimum evidence:

- QSR is `qsr_service_node`.
- Auto parts is `checked_absent`.
- Gas / convenience is `gas_convenience_service_node`.

Meaning:

This is a light everyday-service node with some car-trip support. It is useful
context, but it should not be treated as a car-oriented enclave or corridor.

Pulse 162 examples:

- Oakbrook.
- Camden Waterfront / Cooper.
- Conshohocken / Plymouth Meeting.
- King of Prussia.

### `mixed_car_trip_stack`

Minimum evidence:

- The three sidecars are present, but they do not line up cleanly under the
  labels above.

Meaning:

Use this label when sidecar evidence adds context but does not create a clear
stack type. Do not force a stronger type.

Pulse 162 examples:

- Orland Square.
- Woodfield / Schaumburg.
- Galleria / Addison.
- NorthPark / Preston Hollow.

## Guardrails

Use these labels as public commercial footprint evidence only.

Do not infer:

- customer demographics,
- traffic volume,
- spending,
- vehicle ownership,
- commute behavior,
- franchise territories,
- public safety,
- neighborhood quality.

The labels describe observed public commercial access patterns inside bounded
fields. They are not claims about people.

## Next-Metro Contract

Before adding a new metro to the reusable profile:

1. Define bounded anchor-field targets.
2. Generate the five core layers.
3. Generate QSR, auto-parts, and gas / convenience sidecars against the same
   target boxes.
4. Assign one of the reusable car-trip stack labels only after all three
   sidecars are field-aligned.
5. Record any missing or non-field-aligned sidecar as a source/contract gap,
   not as an absence of terrain.

## Decision

The car-trip stack is ready to travel with the next metro as an interpretation
layer. It is not ready to become a core profile dimension.

Use it to answer:

```text
What kind of car-oriented terrain, if any, sits around this field?
```

Do not use it to answer:

```text
Who lives here, who shops here, or how people behave here?
```
