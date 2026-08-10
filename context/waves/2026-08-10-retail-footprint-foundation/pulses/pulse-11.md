# Pulse 11: Overture Acquisition Plan

## Goal

Define the first approved open-data acquisition path for national Home Depot
and Lowe's store coverage.

## Changes

- Add `docs/overture-home-improvement-acquisition.md`.
- Add `fixtures/stores/overture-home-improvement-candidates-sample.csv`.
- Link the Overture acquisition path from README, national store intake docs,
  and source policy.
- Record Overture source references and candidate brand filters.
- Keep this as a planning and candidate-shape pulse, not a national bulk
  extract.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-candidates-sample.csv`
- `cargo run -p turf-cli -- validate-stores fixtures\stores\national-store-intake-sample.csv`
- `git diff --check`

## Status

Complete. TURF now has an Overture-backed acquisition plan and sample candidate
shape before running any bulk national extraction.
