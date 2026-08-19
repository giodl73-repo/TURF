# Washington Pizza Delivery Pass

## Fetcher Update

The OSM civic fetcher now supports `pizza_delivery` as a facility type. The
review rules keep this sidecar narrow:

- target brands are Domino's, Pizza Hut, Papa Johns, Little Caesars, and Papa
  Murphy's,
- non-target food-service rows are excluded,
- rows with explicit OSM state tags outside the target state are excluded.

The fetcher now sends brand-targeted Overpass selectors for this sidecar rather
than scanning all named restaurants in each target box.

This sidecar remains separate from the four-brand QSR layer.

## Partial Target-Box Pass

Reusable review layer:
`tables/osm-pizza-delivery-washington-minimum-postal-parish-partial-review-2026-08-15.csv`.

Reusable status table:
`tables/washington-pizza-delivery-status-2026-08-15.csv`.

The first target-box pass completed for nine of the 20 Washington A.1b targets.
After slower single-target retries and then brand-targeted final retries, the
checked subset reached all 20 targets:

| Pizza Delivery Status | Targets |
|---|---:|
| checked_absent | 20 |
| source_gated | 0 |
| observed | 0 |

The completed subset returned 114 OSM food-service candidate rows. All were
excluded:

- 111 were non-target food-service rows,
- three had explicit OSM state tags outside Washington.

## Current Read

All 20 targets are checked absent for target-brand pizza delivery/carryout in
this OSM pass:

- Bingen,
- Buckley,
- Cashmere,
- Cathlamet,
- Clallam Bay,
- Clinton,
- Colfax,
- Connell,
- Darrington,
- Dayton,
- Eastsound,
- Eatonville,
- Forks,
- Friday Harbor,
- Kettle Falls,
- La Conner,
- Lopez Island,
- Loon Lake.
- Mattawa,
- Mesa.

## Boundary

This pass may say that target-brand pizza delivery/carryout was not observed in
the 20 completed target boxes. It may not say that no local pizza, restaurant,
or food-service signal exists, because the sidecar is intentionally limited to
target brands.

The sidecar also reports chain presence only. It does not infer delivery range,
food access, service adequacy, affordability, demand, or local quality.
