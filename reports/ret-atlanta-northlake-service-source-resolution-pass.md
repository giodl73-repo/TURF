# Atlanta Northlake Service Source Resolution Pass

## Scope

This pass retries high-impact everyday service gates for Atlanta's weakest
remaining comparison row, Northlake, and checks Decatur / Emory hardware in the
same bounded hardware request.

Retried layers:

- Northlake bank / credit union,
- Northlake gas / convenience,
- Northlake hardware,
- Decatur / Emory hardware,
- Northlake and Decatur / Emory laundromat.

The laundromat retry hit Overpass `429 Too Many Requests`, so those source
gates remain unresolved.

## Result

Northlake resolved three everyday-service layers:

| Layer | Result | Packet-Ready Rows |
|---|---|---:|
| Bank / credit union | observed | 8 |
| Gas / convenience | observed dense | 9 |
| Hardware | observed | 1 |

Decatur / Emory hardware resolved as checked absent in the bounded field.

## Profile Impact

Northlake moved from:

```text
observed_dimensions=3
source_gated_dimensions=7
atlanta_context_archetype=partial_context_source_gate
```

to:

```text
observed_dimensions=6
source_gated_dimensions=4
atlanta_context_archetype=finance_car_trip_health_trade_wellness_legacy_mall_field
readiness_tier=usable_comparison_field
```

Northlake remains `type_discovery_partial` in the cross-metro profile because
the full 11-dimension Atlanta baseline still has source gates, but it is no
longer a weak or mostly unknown field.

## Learning

Northlake is a legacy mall service node, not just a library/health/wellness
partial row. The bounded service retry exposed finance, car-trip, hardware,
pharmacy, and wellness texture around the mall node. The remaining unknowns are
narrower: dollar store, laundromat, park/open-space, and transit.

This is strong evidence for the typed-enclave thesis. A retired or legacy mall
field can still behave as an everyday service enclave even when civic anchors
are thinner than a downtown or edge-city field.
