# Dallas Las Colinas Source Resolution Pass

## Scope

This pass retries the only source-gated Las Colinas / Irving layer in the
Dallas/Fort Worth pre-scale field stack:

- post office.

Evidence files:

```text
fixtures/civic/osm-post-office-dallas-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-dallas-anchor-fields-source-gates-2026-08-13.csv
reports/ret-dallas-anchor-field-post-office-summary.csv
reports/ret-dallas-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Result

Las Colinas / Irving resolved its post-office source gate:

| Layer | Result | Packet-Ready Rows | Excluded Rows |
|---|---|---:|---:|
| Post office | observed | 3 | 1 |

Packet-ready rows:

- Carl Range Post Office,
- Irving Post Office - Central Station,
- Irving Post Office - Las Colinas Station.

Eagle Postal Center remains visible but excluded as a private postal counter.

## Profile Impact

Las Colinas moved from:

```text
observed_layers=3
source_gated_layers=1
readiness_tier=type_discovery_partial
comparison_tier=type_discovery_partial
```

to:

```text
observed_layers=4
source_gated_layers=0
readiness_tier=type_discovery_comparable
comparison_tier=type_discovery_comparable
```

Dallas/Fort Worth now has all eight fields in `type_discovery_comparable`.

## Learning

Las Colinas is a clearer airport-office-edge service field after the retry. It
combines observed postal, grocery, pharmacy, and retail-complex evidence while
mass retail stays checked absent inside the bounded field. That is a useful
contrast to Camp Creek and Ford City: airport-adjacent fields can carry
different civic and everyday-service stacks depending on whether the edge is
office/service-oriented or power-center-oriented.
