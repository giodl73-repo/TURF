# Cross-Metro National Gas / Convenience Sidecar

Generated output:
`reports/ret-cross-metro-gas-convenience-sidecar.csv`

Source fixture:

```text
fixtures/stores/overture-gas-convenience-profile-states-review-2026-07-22.csv
```

Scope: 7-Eleven, Circle K, Speedway, Shell, Chevron, Exxon, Mobil, BP, ARCO,
76, Valero, Texaco, Sunoco, Wawa, QuikTrip, RaceTrac, Casey's, Kum & Go,
Love's, Pilot, Flying J, Murphy USA, Marathon, ampm, and ExtraMile rows from
Overture Places, reviewed for public-facing gas, convenience, and travel-stop
candidates.

## Source Policy Note

Rows are public Overture-derived footprint candidates, not official chain store
lists or claims about fuel territories, customers, traffic volume, spending,
vehicle ownership, or individual behavior.

## Current Read

The review fixture validates with 26,002 packet-ready rows after excluding 333
brand false positives and 1,412 duplicate candidates.

Packet-ready state totals:

| State | Rows | Brands |
| --- | ---: | ---: |
| Texas | 7,782 | 22 |
| California | 7,536 | 19 |
| Georgia | 4,053 | 23 |
| Illinois | 2,175 | 18 |
| Washington | 1,690 | 19 |
| Pennsylvania | 1,487 | 16 |
| New Jersey | 1,357 | 15 |

Top packet-ready brands:

| Brand | Rows |
| --- | ---: |
| Shell | 4,448 |
| Chevron | 3,406 |
| Valero | 3,077 |
| BP | 2,659 |
| 76 | 2,306 |
| Exxon | 1,860 |
| Texaco | 999 |
| ARCO | 986 |
| Sunoco | 799 |
| ampm | 770 |
| Wawa | 723 |
| Marathon | 705 |
| 7-Eleven | 614 |
| QuikTrip | 515 |

## Cross-Metro Field Read

| Signal | Fields |
| --- | ---: |
| `dense_multi_brand_car_trip_grid` | 15 |
| `multi_brand_car_trip_corridor` | 14 |
| `gas_convenience_service_node` | 9 |
| `single_gas_convenience_anchor` | 5 |

Regional totals:

| Region | Fields | Gas / convenience rows | Dense grids | Corridors |
| --- | ---: | ---: | ---: | ---: |
| Los Angeles / Inland Empire | 7 | 394 | 7 | 0 |
| Dallas/Fort Worth | 8 | 112 | 3 | 2 |
| Atlanta | 7 | 90 | 3 | 2 |
| Philadelphia / South Jersey | 8 | 73 | 2 | 3 |
| Chicago | 7 | 44 | 0 | 4 |
| Washington | 6 | 25 | 0 | 3 |

Highest-count fields:

| Region | Field | Rows | Brands | Signal |
| --- | --- | ---: | ---: | --- |
| Los Angeles / Inland Empire | Long Beach / Lakewood | 108 | 10 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | Ontario Mills / Rancho Cucamonga | 60 | 11 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | Riverside / Tyler / Corona edge | 58 | 10 | `dense_multi_brand_car_trip_grid` |
| Dallas/Fort Worth | Arlington / Grand Prairie | 50 | 10 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | Downtown LA / Koreatown / Mid-Wilshire | 49 | 9 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | South Bay / Torrance | 48 | 9 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | Glendale / Burbank | 38 | 7 | `dense_multi_brand_car_trip_grid` |
| Los Angeles / Inland Empire | West LA / Century City / Culver City | 33 | 8 | `dense_multi_brand_car_trip_grid` |

Lightest fields:

| Region | Field | Rows | Brands | Signal |
| --- | --- | ---: | ---: | --- |
| Washington | Bellevue core | 1 | 1 | `single_gas_convenience_anchor` |
| Washington | Tacoma Mall | 1 | 1 | `single_gas_convenience_anchor` |
| Dallas/Fort Worth | Southlake Town Square | 1 | 1 | `single_gas_convenience_anchor` |
| Atlanta | Decatur / Emory | 2 | 2 | `single_gas_convenience_anchor` |
| Chicago | Orland Square | 2 | 2 | `single_gas_convenience_anchor` |

## Learning

Gas / convenience behaves like a true car-trip sidecar. It is present
everywhere, but it is not evenly distributed.

Los Angeles / Inland Empire is saturated: every selected field is a dense
multi-brand car-trip grid. Long Beach / Lakewood, Ontario / Rancho Cucamonga,
and Riverside / Corona stand out as especially strong auto-oriented fields.

Dallas/Fort Worth and Atlanta show edge-city and corridor concentration rather
than universal density. Arlington / Grand Prairie remains the clearest combined
daily-trip, auto-service, and car-trip grid in Dallas/Fort Worth. Perimeter,
North Point, and Cumberland / Vinings carry Atlanta's dense car-trip signal,
while Decatur / Emory stays light.

Washington and Chicago are more selective in this national-operator layer.
Kitsap, South Hill / Puyallup, Southcenter / Tukwila, Loop / River North,
Lincoln Park / Lakeview, Ford City, and Woodfield read as corridors, while
Bellevue core, Tacoma Mall, Orland Square, and Old Orchard / Skokie stay light.

This is different from insurance. Insurance was broad local-agency fabric;
gas / convenience is more spatially tied to driving corridors, port/coastal
grids, freeway-edge retail, and auto-oriented suburban fields.

## Decision

Keep gas / convenience as a sidecar, not a core type-discovery dimension yet.
It adds strong interpretive signal, but it is still an access and mobility
texture layered on top of postal, grocery, mass retail, pharmacy, and
retail-complex evidence.

Next useful step:

```text
Compare QSR, auto parts, and gas / convenience as the car-service / car-trip stack.
```

That comparison should identify which fields are:

- food-forward daily-trip corridors,
- auto-service corridors,
- gas / highway / car-trip grids,
- combined car-oriented retail enclaves,
- or core civic/retail fields with only light car-trip support.
