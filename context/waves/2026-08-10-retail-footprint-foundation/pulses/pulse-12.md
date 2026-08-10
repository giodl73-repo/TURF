# Pulse 12: Georgia Overture Candidate Extract

## Goal

Run the first bounded live Overture Places extraction for Home Depot and Lowe's
without jumping straight to national coverage.

## Changes

- Verify Overture release `2026-07-22.0` places parquet path through Azure blob
  listing.
- Probe active places schema with DuckDB.
- Extract Georgia Home Depot/Lowe's candidate rows from Overture Places.
- Add `fixtures/stores/overture-home-improvement-georgia-2026-07-22.csv`.
- Add `docs/research/overture-georgia-extraction-2026-07-22.md`.
- Link the bounded extract from README and Overture acquisition docs.

## Validation

- `cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-georgia-2026-07-22.csv`
- `cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-candidates-sample.csv`
- `cargo fmt --check`
- `cargo test --workspace`
- `git diff --check`

## Result

- Home Depot candidate rows: 92
- Lowe's candidate rows: 44
- Total candidate rows: 136

## Status

Complete. The extract is committed as candidate data and still requires duplicate
and false-positive review before regional packet generation.
