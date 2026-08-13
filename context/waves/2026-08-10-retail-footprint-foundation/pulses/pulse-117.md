# Pulse 117: Next Scale Decision

## Goal

Use the four-metro type-discovery profile to decide what TURF should do before
adding another urban area.

## Changes

- Added `reports/ret-next-scale-decision.md`.
- Updated README, wave state, and role review.

## Findings

The current profile has enough breadth for type discovery: Washington, Atlanta,
Chicago, and Dallas/Fort Worth cover baseline, partial, source-limited,
pre-scale, Sun Belt, edge-city, town-center, and secondary-core field types.

The main gap is source quality, not metro count. Washington is clean, Dallas is
strong, Chicago has material OSM gates, and Atlanta has the heaviest source-gate
load.

## Validation

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The next execution goal should be a civic/postal source-resolution
pass for Atlanta and Chicago before choosing a fifth metro.
