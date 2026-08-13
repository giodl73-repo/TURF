# Pulse 126: Atlanta Northlake Service Source Resolution

## Intent

Reduce Atlanta's remaining source-gate burden before deciding whether TURF is
ready to add a fifth metro.

## Work

- Retried Northlake bank / credit union.
- Retried Northlake gas / convenience.
- Retried Northlake and Decatur / Emory hardware.
- Attempted Northlake and Decatur / Emory laundromat; Overpass returned `429
  Too Many Requests`, so the laundromat gates remain unresolved.
- Promoted packet-ready Northlake finance, gas/convenience, and hardware rows.
- Removed Northlake from the corresponding source-gate fixtures.
- Removed Decatur / Emory from the hardware source-gate fixture as checked
  absent.
- Regenerated Atlanta service summaries, context summary, readiness, and
  cross-metro profile.

## Evidence

```text
fixtures/civic/osm-bank-credit-union-atlanta-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-gas-convenience-atlanta-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-hardware-atlanta-anchor-fields-review-2026-08-13.csv
reports/ret-atlanta-pre-scale-readiness.csv
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-atlanta-northlake-service-source-resolution-pass.md
```

## Result

Northlake moved to a usable comparison field:

```text
observed_dimensions=6
source_gated_dimensions=4
checked_absent_dimensions=1
atlanta_context_archetype=finance_car_trip_health_trade_wellness_legacy_mall_field
```

## Learning

Northlake is no longer a thin source-gated legacy mall row. It is a
finance/car-trip/health/trade/wellness service field with a checked post-office
absence and remaining dollar-store, laundromat, park/open-space, and transit
gates.
