# Washington Laundromat Sidecar

## Reason

Laundromat is a household-service sidecar for the minimum postal parish pilot.
It tests whether small postal nodes carry visible shared-laundry service
texture in addition to food-service, gas/convenience, dollar-store, and
hardware signals.

## Target-Box Pass

Reusable review layer:
`tables/osm-laundromat-washington-minimum-postal-parish-review-2026-08-15.csv`.

Reusable status table:
`tables/washington-laundromat-status-2026-08-15.csv`.

The OSM sidecar checks named `shop=laundry` rows.

Status after target-by-target fetches and retries:

| Laundromat Status | Targets |
|---|---:|
| observed | 0 |
| checked_absent | 20 |
| source_gated | 0 |

The reviewed table is header-only because the completed pass returned no named
laundromat rows in any bounded target box.

## Classification Impact

`laundromat_status` is now included in
`tables/washington-minimum-stack-classification-2026-08-15.csv`.

The top-level class split does not change:

| Minimum Stack Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 15 |
| postal_food_service_minimum | 3 |
| postal_signal_absent_or_source_gated | 2 |

No target becomes `postal_laundromat_minimum` in this pilot.

## Boundary

This sidecar may say named OSM laundromat/laundry rows are checked absent
inside bounded target boxes. It may not infer housing tenure, income, appliance
ownership, service adequacy, customer behavior, spending, or complete local
household-service inventory.
