# Cross-Metro Car-Trip Stack Comparison

Generated output:
`reports/ret-cross-metro-car-trip-stack-comparison.csv`

Inputs:

```text
reports/ret-los-angeles-anchor-field-qsr-summary.csv
reports/ret-los-angeles-anchor-field-auto-parts-summary.csv
reports/ret-chicago-anchor-field-qsr-summary.csv
reports/ret-chicago-anchor-field-auto-parts-summary.csv
reports/ret-dallas-anchor-field-qsr-summary.csv
reports/ret-dallas-anchor-field-auto-parts-summary.csv
reports/ret-philadelphia-anchor-field-qsr-summary.csv
reports/ret-philadelphia-anchor-field-auto-parts-summary.csv
reports/ret-cross-metro-gas-convenience-sidecar.csv
```

## Scope

This comparison covers the 30 fields where QSR, auto parts, and gas /
convenience are all field-aligned:

- Los Angeles / Inland Empire: 7 fields.
- Chicago: 7 fields.
- Dallas/Fort Worth: 8 fields.
- Philadelphia / South Jersey: 8 fields.

Washington and Atlanta are excluded from this stack comparison because their
QSR and auto-parts evidence exists at older metro/place scopes, not the current
anchor-field sidecar contract.

## Current Read

Regional totals:

| Region | Fields | QSR rows | Auto-parts rows | Gas / convenience rows |
| --- | ---: | ---: | ---: | ---: |
| Los Angeles / Inland Empire | 7 | 142 | 65 | 394 |
| Dallas/Fort Worth | 8 | 47 | 20 | 112 |
| Philadelphia / South Jersey | 8 | 40 | 11 | 73 |
| Chicago | 7 | 46 | 7 | 44 |

Stack signals:

| Signal | Fields |
| --- | ---: |
| `combined_car_oriented_retail_enclave` | 9 |
| `light_service_node_car_trip_support` | 4 |
| `mixed_car_trip_stack` | 4 |
| `food_forward_daily_trip_field` | 3 |
| `light_car_trip_support_core_field` | 3 |
| `combined_car_oriented_retail_corridor` | 2 |
| `gas_highway_car_trip_grid_auto_service_light` | 2 |
| `gas_car_trip_corridor_food_light` | 2 |
| `combined_daily_trip_auto_service_car_trip_grid` | 1 |

## Field Types

### All-three dense grid

| Region | Field | QSR | Auto parts | Gas / convenience |
| --- | --- | ---: | ---: | ---: |
| Dallas/Fort Worth | Arlington / Grand Prairie | 16 | 13 | 50 |

Arlington / Grand Prairie is the only field that is simultaneously a dense QSR
grid, dense auto-service grid, and dense gas / convenience grid.

### Combined car-oriented retail enclaves

| Region | Fields |
| --- | --- |
| Los Angeles / Inland Empire | Downtown LA / Koreatown / Mid-Wilshire; Glendale / Burbank; Long Beach / Lakewood; Ontario / Rancho Cucamonga; Riverside / Corona; South Bay / Torrance; West LA / Century City / Culver City |
| Philadelphia / South Jersey | Cherry Hill / Moorestown; Northeast Roosevelt |

These fields combine strong daily-trip food signal, auto-service signal, and
dense gas / convenience signal. LA is the clearest region-wide example: every
selected LA / Inland Empire field lands here.

### Combined car-oriented retail corridors

| Region | Field |
| --- | --- |
| Chicago | Midway / Ford City |
| Philadelphia / South Jersey | South Philadelphia Sports / Port |

These fields combine QSR, auto-service, and gas / convenience, but their gas
signal is corridor-level rather than dense-grid.

### Food-forward daily-trip fields

| Region | Field |
| --- | --- |
| Chicago | Lincoln Park / Lakeview |
| Chicago | Loop / River North |
| Dallas/Fort Worth | Downtown / Uptown Dallas |

These fields have strong QSR plus gas / convenience corridor support, but auto
parts are checked absent. They read as daily-trip urban/neighborhood fields,
not car-service corridors.

### Gas / highway grids with light auto-service

| Region | Field |
| --- | --- |
| Dallas/Fort Worth | Las Colinas / Irving |
| Dallas/Fort Worth | Legacy / Frisco / Plano |

These fields have dense gas / convenience and meaningful QSR, but only a single
auto-parts anchor. They look more like car-trip and highway/edge mobility grids
than repair/service corridors.

### Gas corridors with light food

| Region | Field |
| --- | --- |
| Philadelphia / South Jersey | Center City / Market East |
| Philadelphia / South Jersey | University City / 30th Street |

These fields have gas / convenience corridor signal with only QSR service-node
support and checked-absent auto parts. They should not be read as auto-service
fields.

### Light car-trip support

| Region | Field |
| --- | --- |
| Chicago | Old Orchard / Skokie |
| Dallas/Fort Worth | Fort Worth Cultural / West 7th |
| Dallas/Fort Worth | Southlake Town Square |
| Chicago | Oakbrook |
| Philadelphia / South Jersey | Camden Waterfront / Cooper |
| Philadelphia / South Jersey | Conshohocken / Plymouth Meeting |
| Philadelphia / South Jersey | King of Prussia |

These fields retain their core retail/civic/office/mall interpretations with
only light or service-node car-trip support.

### Mixed car-trip stacks

| Region | Field |
| --- | --- |
| Chicago | Orland Square |
| Chicago | Woodfield / Schaumburg |
| Dallas/Fort Worth | Galleria / Addison |
| Dallas/Fort Worth | NorthPark / Preston Hollow |

These fields have enough sidecar signal to add context, but the three sidecars
do not line up cleanly into a food-forward, auto-service, gas/highway, or
combined car-oriented type.

## Learning

The three sidecars are not redundant:

- QSR measures daily-trip food saturation.
- Auto parts measures trade and car-service corridor depth.
- Gas / convenience measures car-trip, highway, port/coastal, and mobility
  texture.

The stack shows the first clear hierarchy of car-oriented enclave types:

1. Arlington / Grand Prairie is the strongest all-three dense grid.
2. LA / Inland Empire fields are broadly combined car-oriented enclaves.
3. Northeast Roosevelt and Cherry Hill / Moorestown are Philadelphia's strongest
   combined enclaves.
4. Ford City and South Philly are combined corridors, not full dense grids.
5. Lincoln Park / Lakeview, Loop / River North, and Downtown / Uptown Dallas
   are food-forward fields with limited car-service signal.
6. Las Colinas / Irving and Legacy / Frisco / Plano are gas/highway grids with
   light auto-service depth.

## Decision

Keep QSR, auto parts, and gas / convenience as sidecars. Together they are
strong enough to type car-oriented terrain, but they should still refine rather
than replace the core five-layer profile.

Next useful step:

```text
Create a car-trip stack typing note that can be reused when adding the next metro.
```

That note should define reusable type labels for combined car-oriented
enclaves, combined corridors, food-forward fields, gas/highway grids, and light
car-trip support fields.
