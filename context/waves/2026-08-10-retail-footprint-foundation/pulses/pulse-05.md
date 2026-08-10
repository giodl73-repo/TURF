# Pulse 05: Catchment Model Sketch

## Goal

Add the first executable catchment baseline without pretending TURF knows
private company territories, travel times, or real estate trade areas.

## Changes

- Add `docs/catchment-model.md`.
- Add `fixtures/geography/demand-points.csv`.
- Add `turf-cli catchment <store-points.csv> <demand-points.csv>`.
- Add `turf_core::parse_demand_points` and `turf_core::assign_nearest_store`.
- Use straight-line Haversine distance in miles with deterministic store-id
  tie-breaking.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`
- `cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv`
- `cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv`
- `cargo run -p turf-cli -- catchment fixtures\brands\home-improvement-pois.csv fixtures\geography\demand-points.csv`
- `git diff --check`

## Status

Complete. TURF now has a first distance-only catchment contract that can be
compared against future drive-time, gravity, and overlap models.
