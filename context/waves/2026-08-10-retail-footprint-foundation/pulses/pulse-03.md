# Pulse 03: Open Source Review

## Goal

Ground the postal/address, ZIP, ZCTA, Census geography, and open POI source
choices before TURF builds a place-context contract or automated data fetch.

## Changes

- Add `docs/research/postal-zcta-source-review.md`.
- Add `fixtures/geography/zip-zcta-business-use-hypotheses.csv`.
- Keep company ZIP/ZCTA use as a testable hypothesis until source evidence is
  recorded.
- Keep ZIP Code, ZCTA, postal city, civic place, and market area as separate
  concepts.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`
- `git diff --check`

## Status

Complete. Validation passed with `cargo fmt --check`, `cargo test --workspace`,
`cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`,
and `git diff --check` on 2026-08-10.
