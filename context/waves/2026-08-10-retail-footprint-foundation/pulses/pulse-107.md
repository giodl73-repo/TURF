# Pulse 107: Cross-Metro Type-Discovery Profile

## Goal

Create a reusable cross-metro synthesis contract so Washington, Atlanta, and
Chicago can be compared without hiding differences in source depth.

## Work

- Added a SQL profile that normalizes Washington, Atlanta, and Chicago field
  outputs.
- Preserved `profile_basis` so full 11-dimension contexts are distinct from
  Chicago's pre-scale 6-layer stack.
- Added observed, source-gated, checked-absent, readiness, and comparison-tier
  fields.
- Documented the first 20-row generated readout.

## Evidence

Generated output:

```text
reports/ret-cross-metro-type-discovery-profile.csv
```

Profile basis:

- `full_11_dimension_context`: 13 fields.
- `pre_scale_6_layer_stack`: 7 fields.

Comparison tiers:

- Washington: 6 `baseline_comparable` fields.
- Atlanta: 5 `type_discovery_partial` fields and 2 `source_limited` fields.
- Chicago: 5 `type_discovery_comparable` fields and 2
  `type_discovery_partial` fields.

## Learning

The reusable profile makes the scale gate explicit. Washington remains the
baseline. Atlanta is useful for type discovery but source-limited. Chicago is
not a full 11-dimension baseline yet, but five fields are comparable enough for
type discovery.

## Artifacts

- `queries/ret-cross-metro-type-discovery-profile.sql`
- `reports/ret-cross-metro-type-discovery-profile.csv`
- `reports/ret-cross-metro-type-discovery-profile.md`

## Validation

```powershell
duckdb -c ".read queries/ret-cross-metro-type-discovery-profile.sql"
```
