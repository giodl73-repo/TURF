# Washington Food Service Sidecar

## Reason

The Domino's / Kingston scope warning showed that the four-brand QSR layer is
too narrow for minimum postal parish work. The pizza-delivery sidecar checked
target-brand delivery/carryout chains, but a separate broad food-service pass
is needed to avoid treating local restaurants, cafes, and fast-food rows as
absent.

## Target-Box Pass

Reusable review layer:
`tables/osm-food-service-washington-minimum-postal-parish-review-2026-08-15.csv`.

Reusable status table:
`tables/washington-food-service-status-2026-08-15.csv`.

The OSM sidecar checks named:

- `amenity=fast_food`,
- `amenity=restaurant`,
- `amenity=cafe`,
- `shop=pizza`.

Status after target-by-target fetch, retries, and narrow one-selector retries
for Clinton and Colfax:

| Food Service Status | Targets |
|---|---:|
| observed | 19 |
| checked_absent | 1 |
| source_gated | 0 |

Mesa is the only checked-absent target. Clinton and Colfax were resolved by
smaller one-selector Overpass requests.

## Classification Impact

The first classifier was regenerated with `food_service_status`.
`postal_only_candidate` drops from three targets to zero. The updated class
counts are:

| Minimum Stack Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 15 |
| postal_food_service_minimum | 3 |
| postal_signal_absent_or_source_gated | 2 |

The three `postal_food_service_minimum` targets are:

- Clallam Bay,
- La Conner,
- Lopez Island.

Colfax moves to `postal_everyday_service_minimum` after the narrow retry.
Darrington and Mesa remain outside postal minimum-stack classes because the
post-office sidecar is checked absent for both.

## Boundary

This sidecar may say named OSM food-service rows are observed in bounded target
boxes. It may not claim complete restaurant inventory, QSR adequacy, customer
behavior, delivery range, spending, trade area, or no local food service where
the source is not checked.
