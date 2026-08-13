# Pulse 125: Dallas Las Colinas Source Resolution

## Intent

Resolve the only Dallas/Fort Worth type-discovery partial row before choosing
whether TURF should scale to a fifth metro.

## Work

- Retried Las Colinas / Irving post office using the bounded Dallas/Fort Worth
  anchor-field target.
- Promoted packet-ready USPS-like rows into the Dallas post-office review
  fixture.
- Kept Eagle Postal Center visible but excluded as a private postal counter.
- Removed only Las Colinas / Irving from the Dallas post-office source-gate
  fixture.
- Regenerated Dallas post-office, Dallas pre-scale stack, and cross-metro
  profile outputs.

## Evidence

```text
fixtures/civic/osm-post-office-dallas-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-dallas-anchor-fields-source-gates-2026-08-13.csv
reports/ret-dallas-anchor-field-post-office-summary.csv
reports/ret-dallas-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-dallas-las-colinas-source-resolution-pass.md
```

## Result

Las Colinas / Irving moved from partial to comparable:

```text
observed_layers=4
source_gated_layers=0
checked_absent_layers=1
comparison_tier=type_discovery_comparable
```

Dallas/Fort Worth now contributes eight comparable type-discovery fields.

## Learning

Las Colinas is a postal/grocery/health/complex office-edge field with checked
mass-retail absence. That makes it a useful airport-adjacent contrast to
power-center airport-edge fields.
