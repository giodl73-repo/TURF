# Pulse 33: Restaurant Expansion Targets

## Goal

Set the next restaurant expansion sequence and make the chain target list
executable before extracting any restaurant POI rows.

## Changes

- Updated `docs/chain-expansion-sequence.md` to put QSR after auto parts and
  before Target/Walmart.
- Added `docs/restaurant-chain-expansion.md`.
- Added `fixtures/stores/restaurant-chain-targets.csv`.
- Added `RestaurantChainTarget`.
- Added restaurant target parser, validator, and segment summary.
- Added `validate-restaurant-targets` and `summarize-restaurant-targets` to
  `turf-cli`.
- Added parser/validator tests.

## Readout

The initial restaurant sequence is:

| Segment | Chains | Purpose |
|---|---|---|
| QSR | McDonald's Burger King Wendy's Taco Bell | Dense daily-life restaurant grid. |
| Fast casual | Chipotle Five Guys | Selective urban and suburban nodes. |
| Casual dining | Olive Garden Cheesecake Factory | Regional dining anchors and lifestyle nodes. |

QSR is the next implementation layer. It should be extracted and reviewed in
Washington before Target/Walmart so TURF can compare daily restaurant grids
against home-improvement anchors and auto-parts service meshes.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
cargo run -p turf-cli -- summarize-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
git diff --check
```
