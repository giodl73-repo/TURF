# Pulse 18: Atlanta CBSA Drilldown

## Goal

Focus the statewide Georgia read on the Atlanta-Sandy Springs-Roswell GA CBSA,
where the Home Depot/Lowe's signal is largest.

## Changes

- Added CBSA filtering, county-in-metro summary, and nearest opposite-brand
  spacing helpers.
- Added `drilldown-metro-review` to `turf-cli`.
- Added `reports/home-improvement-atlanta-cbsa-drilldown.txt`.
- Updated `reports/home-improvement-georgia.md` with Atlanta CBSA drilldown
  findings.

## Readout

- Atlanta CBSA packet-ready stores: 79.
- Home Depot: 59.
- Lowe's: 20.
- Largest counties: Gwinnett 13, Fulton 13, Cobb 11, DeKalb 7.
- Opposite-brand nearest neighbor under 0.5 miles: 12 stores.
- Opposite-brand nearest neighbor under 1.0 mile: 24 stores.
- Nearest opposite-brand neighbor in same county: 55 stores.

## Caveat

Nearest competitor spacing is straight-line distance between Overture-derived
candidate points. It is not drive time, trade-area overlap, or a company
territory claim.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
git diff --check
```
