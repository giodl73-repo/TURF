# Pulse 01: Workspace Foundation

## Goal

Create the repository foundation and first tested public-footprint contract.

## Changes

- Add Rust workspace skeleton.
- Add README and product plan.
- Add data-policy note.
- Add wave and pulse scaffolding.
- Add repo-specific skills.
- Add a home-improvement POI fixture.
- Add `summarize` command for brand counts and city dominance.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`
- `git diff --check`

## Status

Complete. Validation passed with `cargo fmt --check`, `cargo test --workspace`,
`cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`,
and `git diff --check` on 2026-08-10.
