# Pulse 15: Georgia Postal Footprint Read

## Goal

Attach the first postal layer to the Georgia Home Depot/Lowe's packet-ready
rows without confusing source ZIP Codes with confirmed Census ZCTA geometry.

## Changes

- Added postal packet-ready conversion helpers in `turf-core`.
- Added `summarize-postal-review` and `export-packet-ready-postal` to
  `turf-cli`.
- Added `fixtures/brands/home-improvement-georgia-packet-ready-postal.csv`.
- Updated `reports/home-improvement-georgia.md` with postal readout tables.

## Readout

- Packet-ready stores: 132.
- ZIP/ZCTA-candidate groups: 106.
- Contested ZIP/ZCTA-candidate groups: 21.
- Dominant ZIP/ZCTA-candidate groups: 85.
- Home Depot leads 86 ZIP/ZCTA-candidate groups.
- Lowe's leads 20 ZIP/ZCTA-candidate groups.

## Source Caveat

The `zcta_candidate` field is a ZIP-derived candidate join key. It is not a
confirmed Census ZCTA polygon join. TURF will use Census ZCTA relationship files
or TIGER/Line-derived context before claiming ZCTA, county, CBSA, or urban-area
membership.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-postal-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready-postal fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
git diff --check
```
