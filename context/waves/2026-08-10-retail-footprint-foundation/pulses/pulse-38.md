# Pulse 38: RET Place Capacity Matrix

## Goal

Make the "0 / 1 / 2+ of each store type" enclave idea executable for selected
Puget Sound and Atlanta places.

## Changes

- Added `queries/ret-profile-v0-place-capacity-matrix.sql`.
- Added `reports/ret-profile-v0-place-capacity-matrix.csv`.
- Added `reports/ret-profile-v0-place-capacity-readout.md`.
- Updated RET Profile v0 docs, README, wave table, and role review.

## Output

The matrix gives each selected place capacity bands for:

- Home Depot and Lowe's
- AutoZone, NAPA, O'Reilly, and Advance Auto
- McDonald's, Burger King, Taco Bell, and Wendy's

Bands mean:

- `0`: observed absence in an active checked source layer
- `1`: one direct row
- `2+`: repeated direct capacity
- `source_gate_pending`: do not infer absence because that source layer has not
  been acquired for that state

## Learning

Co-presence is a capacity signal before it is a rivalry signal. Marietta and
Alpharetta can be read as dual-anchor home-improvement nodes plus full QSR
nodes. Atlanta city has Home Depot and all four QSR brands but no direct Lowe's
row in this release. Bainbridge Island and Kingston remain thin direct-store
layers in the checked data, which matters because ferry context changes what a
direct absence means.

## Validation

```powershell
duckdb -c ".read queries/ret-profile-v0-place-capacity-matrix.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
