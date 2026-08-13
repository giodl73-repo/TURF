# RET Sidecar Backfill Plan

## Scope

This plan defines the minimum backfill before QSR and auto parts can influence
the cross-metro type-discovery profile.

## Current Coverage

| Region | QSR Sidecar | Auto-Parts Sidecar | Status |
| --- | --- | --- | --- |
| Washington / Puget Sound | available at metro/place level | available at metro/place level | useful but not aligned to the current anchor-field profile |
| Atlanta | available at metro level | available at metro level | useful but not aligned to all anchor fields |
| Chicago | missing | missing | backfill needed |
| Dallas/Fort Worth | missing | missing | backfill needed |
| Los Angeles / Inland Empire | aligned to seven anchor fields | aligned to seven anchor fields | complete sidecar pilot |

## Backfill Order

1. Chicago QSR sidecar.
2. Chicago auto-parts sidecar.
3. Dallas/Fort Worth QSR sidecar.
4. Dallas/Fort Worth auto-parts sidecar.

Reason: Chicago has the six-layer stack with the most OSM source gates, so
commercial sidecars are likely to show whether daily-trip and trade-service
signal can stabilize field labels before more civic retry work.

## Minimum Outputs Per Region

Each region should add:

- Overture extract query for the state source if missing,
- conservative review query,
- reviewed fixture passing `validate-store-review`,
- anchor-field QSR summary,
- anchor-field auto-parts summary,
- QSR / auto-parts comparison readout,
- pulse and `.roles` review.

## Field Alignment

The sidecars must use existing target boxes:

```text
fixtures/geography/ret-chicago-anchor-field-targets.csv
fixtures/geography/ret-dallas-anchor-field-targets.csv
```

Do not create new field boxes for sidecars unless the existing targets are
proven unusable.

## Promotion Gate

Only after Chicago and Dallas are backfilled should TURF decide whether QSR and
auto parts stay as sidecars or become sixth and seventh dimensions in a
standard seven-layer pre-scale profile.

Promotion requires:

- all five comparable pre-scale metros have an explicit sidecar status,
- validators pass for every reviewed sidecar fixture,
- the role review confirms that sidecars change or strengthen field labels
  enough to justify profile-contract churn.
