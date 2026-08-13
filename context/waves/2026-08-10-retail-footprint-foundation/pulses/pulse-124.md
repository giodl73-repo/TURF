# Pulse 124: Chicago Old Orchard Source Resolution

## Intent

Resolve Chicago's last type-discovery partial row before deciding whether TURF
is ready to scale to a fifth metro.

## Work

- Retried Old Orchard / Skokie post office using the bounded Chicago
  anchor-field target.
- Retried Old Orchard / Skokie gym / wellness using the same bounded target.
- Promoted packet-ready USPS and wellness rows into reviewed OSM civic
  fixtures.
- Removed only Old Orchard from the corresponding post-office and gym
  source-gate fixtures.
- Regenerated Chicago post-office, gym, pre-scale stack, and cross-metro
  profile outputs.

## Evidence

```text
fixtures/civic/osm-post-office-chicago-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-gym-chicago-anchor-fields-review-2026-08-13.csv
reports/ret-chicago-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-chicago-old-orchard-source-resolution-pass.md
```

## Result

Old Orchard / Skokie moved from source-limited partial to usable type discovery:

```text
observed_layers=4
source_gated_layers=0
checked_absent_layers=2
comparison_tier=type_discovery_comparable
```

Chicago now contributes seven comparable type-discovery fields.

## Learning

Old Orchard is not just a thin mall/grocery row. With source gates resolved, it
reads as a mature north-suburban mall field with observed postal civic service
and wellness anchors, while mass retail and pharmacy remain checked absent
inside the bounded field.
