# Pulse 04: Place-Context Contract

## Goal

Define the first executable contract for separating postal, ZIP/ZCTA, civic,
Census, lived-place, and market geography.

## Changes

- Add `docs/place-context-contract.md`.
- Add `fixtures/geography/place-contexts.csv`.
- Add `turf-cli place-context <place-contexts.csv>`.
- Add `turf-cli place-context --json <place-contexts.csv>`.
- Add tests that preserve ZIP and ZCTA as separate fields.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`
- `cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv`
- `cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv`
- `git diff --check`

## Status

Complete. Validation passed with `cargo fmt --check`, `cargo test --workspace`,
`cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`,
`cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv`,
`cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv`,
and `git diff --check` on 2026-08-10.
