# Chicago Old Orchard Source Resolution Pass

## Scope

This pass retries the two remaining source-gated Old Orchard / Skokie layers
from the Chicago pre-scale field stack:

- post office,
- gym / wellness.

Evidence files:

```text
fixtures/civic/osm-post-office-chicago-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-chicago-anchor-fields-source-gates-2026-08-13.csv
fixtures/civic/osm-gym-chicago-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-gym-chicago-anchor-fields-source-gates-2026-08-13.csv
reports/ret-chicago-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Result

Old Orchard / Skokie resolved both source gates:

| Layer | Result | Reviewed Rows |
|---|---|---:|
| Post office | observed | 1 |
| Gym / wellness | observed | 4 |

The post-office retry promoted Old Orchard Post Office as a packet-ready USPS
row. The gym retry promoted CorePower Yoga, CycleBar, Life Time, and SoulCycle
as packet-ready wellness rows.

## Profile Impact

Old Orchard moved from:

```text
observed_layers=2
source_gated_layers=2
readiness_tier=source_limited_retry_or_alternate_source
comparison_tier=type_discovery_partial
```

to:

```text
observed_layers=4
source_gated_layers=0
readiness_tier=usable_for_type_discovery
comparison_tier=type_discovery_comparable
```

Chicago now has all seven fields in `type_discovery_comparable`.

## Learning

Old Orchard remains a confirmed single-grocery mall field, but the source
resolution changes the confidence level. It is no longer a thin mall row caused
by OSM timeouts. It is a mature north-suburban mall field with observed postal
civic service and wellness anchors inside the bounded field, while mass retail
and pharmacy remain checked absent in this field definition.

That is useful before adding a fifth metro because it makes Chicago a stronger
comparison set for distinguishing:

- mall fields with local civic/wellness service,
- mall fields with grocery and big-box power texture,
- urban everyday grids,
- airport-edge and secondary-core fields.
