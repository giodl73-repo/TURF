# Pulse 43: Washington Mass Retail Layer

## Goal

Add Target, Walmart, and Costco as a mass-retail layer to test whether
North Seattle / South Snohomish anchor and corridor types hold up.

## Changes

- Added `queries/overture-mass-retail-washington-2026-07-22.sql`.
- Added raw and reviewed Washington mass-retail fixtures.
- Added extraction and review notes.
- Refreshed `reports/ret-north-seattle-enclave-profile.csv`.
- Updated the North Seattle enclave readout and role review.

## Output

Washington has 115 packet-ready mass-retail rows:

- Costco: 30
- Target: 36
- Walmart: 49

No Sam's Club rows appeared in this Washington Overture filter.

North-end impact:

- Lynnwood / Alderwood has Costco, Target, and Walmart rows and remains
  `regional_anchor_absorber`.
- Everett has Costco, Target, and Walmart rows and becomes
  `regional_anchor_node`.
- Aurora / North Seattle remains `retail_corridor`, with no direct mass-retail
  row in the selected slice.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-washington-review-2026-07-22.csv
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
