# Pulse 14: Georgia Reviewed Footprint Read

## Goal

Use the reviewed Georgia candidate layer to produce a packet-ready store-point
fixture and first statewide Home Depot/Lowe's footprint read.

## Changes

- Added packet-ready conversion helpers in `turf-core`.
- Added `summarize-review` and `export-packet-ready` to `turf-cli`.
- Added `fixtures/brands/home-improvement-georgia-packet-ready.csv`.
- Added `reports/home-improvement-georgia.md`.

## Readout

- Packet-ready stores: 132.
- Home Depot packet-ready stores: 90.
- Lowe's packet-ready stores: 42.
- City/locality groups: 90.
- Contested city/locality groups: 20.
- Dominant city/locality groups: 70.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-georgia-packet-ready.csv
git diff --check
```
