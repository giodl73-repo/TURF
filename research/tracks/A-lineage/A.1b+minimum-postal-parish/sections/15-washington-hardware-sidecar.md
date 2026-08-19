# Washington Hardware Sidecar

## Reason

Hardware is a trade-service sidecar for the minimum postal parish pilot. It is
not needed to prove food-service or gas/convenience signal, but it tests whether
small postal nodes also carry repair, household, or contractor-facing retail
texture.

## Target-Box Pass

Reusable partial review layer:
`tables/osm-hardware-washington-minimum-postal-parish-partial-review-2026-08-15.csv`.

Reusable status table:
`tables/washington-hardware-status-2026-08-15.csv`.

The OSM sidecar checks named `shop=hardware` rows.

Status after target-by-target fetches, retries, and a narrow Colfax retry:

| Hardware Status | Targets |
|---|---:|
| observed | 5 |
| checked_absent | 15 |
| source_gated | 0 |

Observed targets:

- Cathlamet,
- Connell,
- Eastsound,
- Forks,
- Kettle Falls.

Colfax was resolved by a narrow node/way retry and is checked absent for named
OSM hardware rows inside the bounded target box.

## Classification Impact

`hardware_status` is now included in
`tables/washington-minimum-stack-classification-2026-08-15.csv`.

The top-level class split does not change:

| Minimum Stack Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 15 |
| postal_food_service_minimum | 3 |
| postal_signal_absent_or_source_gated | 2 |

The observed hardware targets were already in `postal_everyday_service_minimum`
through food-service, gas/convenience, or dollar-store evidence.

## Boundary

This sidecar may say named OSM hardware rows are observed or checked absent
inside bounded target boxes. It may not infer construction
activity, contractor demand, home repair demand, trade area, service adequacy,
customer behavior, spending, or complete local retail inventory.
