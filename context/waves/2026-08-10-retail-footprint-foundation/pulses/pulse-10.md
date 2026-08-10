# Pulse 10: National Store Intake Gate

## Goal

Prepare for national Home Depot and Lowe's coverage without committing scraped
or restricted store-locator data.

## Changes

- Add `NationalStorePoint`.
- Add `parse_national_store_points`.
- Add `validate_national_store_points`.
- Add `turf-cli validate-stores <national-stores.csv>`.
- Add `fixtures/stores/national-store-intake-sample.csv`.
- Add `docs/national-store-intake.md`.
- Add `docs/research/home-improvement-source-policy.md`.
- Link the policy from README and `docs/data-policy.md`.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- validate-stores fixtures\stores\national-store-intake-sample.csv`
- `cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json`
- `git diff --check`

## Status

Complete. TURF can now reject national store rows that do not carry source and
license status before Home Depot/Lowe's acquisition expands beyond fixtures.
