# RET Fifth Metro Scale Decision

## Scope

This report decides whether TURF should add a fifth metro after the Washington,
Atlanta, Chicago, and Dallas/Fort Worth type-discovery passes.

Evidence sources:

```text
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-atlanta-pre-scale-readiness.csv
reports/ret-next-scale-decision.md
```

## Decision

TURF is ready to add a fifth metro for type discovery.

It is not ready for final atlas ranking. The scale move should stay explicitly
scoped as `type_discovery`, with source gates preserved in the profile.

## Why The Gate Is Now Open

The four-metro profile has enough resolved structure to support another metro:

| Region | Status |
|---|---|
| Washington | Full 11-dimension clean baseline with zero source gates. |
| Atlanta | Full 11-dimension profile; all rows remain partial for ranking, but Camp Creek and Northlake are now usable comparison fields and no row is source-limited. |
| Chicago | Seven comparable pre-scale fields after Old Orchard and Orland source resolution. |
| Dallas/Fort Worth | Eight comparable pre-scale fields after Las Colinas source resolution. |

The earlier blockers are resolved:

- Atlanta no longer has a `source_limited` row.
- Chicago no longer has a partial row.
- Dallas/Fort Worth no longer has a partial row.
- The remaining Atlanta gates are explicit source limits, not hidden absences.

## What Remains Limited

Atlanta is still not a final-ranking baseline. Remaining source-gated layers
are concentrated in:

- dollar store,
- laundromat,
- park/open space,
- transit,
- selected bank, gas/convenience, hardware, library, and gym targets.

The latest Northlake service pass narrowed the biggest uncertainty. Northlake
now reads as `finance_car_trip_health_trade_wellness_legacy_mall_field` with 6
observed dimensions and 4 source-gated dimensions.

## Fifth Metro Recommendation

Choose Los Angeles / Inland Empire as metro 5.

Reason:

- It adds a polycentric freeway retail pattern not represented by Washington,
  Atlanta, Chicago, or Dallas/Fort Worth.
- It should stress-test whether TURF can distinguish coastal core, valley,
  freeway-edge, and inland growth fields inside one mega-region.
- It is a better next contrast than another relatively contained single-core
  metro.

## Starting Field Targets

The first Los Angeles / Inland Empire target set should be bounded and typed,
not exhaustive:

| Candidate Field | Pattern To Test |
|---|---|
| Downtown LA / Koreatown / Mid-Wilshire | Dense urban mixed-service field. |
| Glendale / Burbank | Valley media/retail edge field. |
| West LA / Century City / Culver City | Affluent office-retail service field. |
| South Bay / Torrance | Coastal-suburban mall and auto-service field. |
| Ontario Mills / Rancho Cucamonga | Inland freeway power-center field. |
| Riverside / Tyler / Corona edge | Inland Empire secondary-core/growth field. |
| Long Beach / Lakewood | Port/coastal grid and mall-service field. |

## Next Pulse

Pulse 128 should create the Los Angeles / Inland Empire anchor-field target
fixture and a query/report shell for the first pre-scale layers. The first
layers should be:

1. post office,
2. grocery,
3. mass retail,
4. pharmacy,
5. retail complex.

That mirrors the Dallas/Fort Worth pre-scale path and gives a fast comparable
stack before expanding to the full 11-dimension Washington contract.
