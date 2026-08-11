# Pulse 44: Washington Grocery Layer

## Goal

Add grocery as a neighborhood-completeness layer for the North Seattle / South
Snohomish enclave profile.

## Changes

- Added `queries/overture-grocery-washington-2026-07-22.sql`.
- Added raw and reviewed Washington grocery fixtures.
- Added extraction and review notes.
- Refreshed `reports/ret-north-seattle-enclave-profile.csv`.
- Updated the North Seattle enclave readout and role review.

## Output

Washington has 394 packet-ready grocery rows:

- Albertsons: 18
- Fred Meyer: 34
- Grocery Outlet: 79
- Metropolitan Market: 9
- QFC: 48
- Safeway: 166
- Trader Joe's: 30
- Whole Foods Market: 10

North-end impact:

- Northgate / Lake City becomes `neighborhood_grocery_service_grid`.
- Lynnwood / Alderwood remains `regional_anchor_absorber`, now with six grocery
  brands stacked on mass retail and home improvement.
- Everett remains `regional_anchor_node`, now with five grocery brands.
- Mountlake Terrace and Kenmore move away from pure thin-edge reads because
  grocery shows daily-life service capacity.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-washington-review-2026-07-22.csv
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
