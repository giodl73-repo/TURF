# Pulse 109: Dallas Scale Target Gate

## Goal

Set a reasonable pre-scale goal before adding more urban areas, then define the
next bounded metro target set.

## Changes

- Added Dallas/Fort Worth anchor-field targets.
- Added a DuckDB target-gate query and generated target CSV.
- Added a scale-goal report naming the remaining high-signal, non-contentious
  layers before broader rollout.
- Recorded Dallas/Fort Worth as the fourth-metro type-discovery candidate.

## Decision

Dallas/Fort Worth is the next metro because it tests a polycentric Sun Belt
metroplex: downtown/uptown core, affluent mall field, edge-city mall/office
field, growth-edge retail, airport/office edge, mid-cities power field,
planned suburban town center, and a second urban core in Fort Worth.

The scale gate is concrete: do not add a fifth metro until Dallas/Fort Worth
has a pre-scale stack, synthesis, and cross-metro rows that pass
`validate-type-discovery-profile`.

## Validation

```powershell
duckdb -c ".read queries/ret-dallas-anchor-field-targets.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. Target gate generated and validation passed.
