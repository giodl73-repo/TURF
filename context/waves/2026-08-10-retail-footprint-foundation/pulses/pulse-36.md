# Pulse 36: Atlanta QSR Backfill

## Goal

Backfill Georgia QSR so TURF can compare Atlanta against the Washington/Puget
Sound QSR layer.

## Changes

- Added `queries/overture-qsr-georgia-2026-07-22.sql`.
- Ran the Georgia QSR Overture extract.
- Added `fixtures/stores/overture-qsr-georgia-2026-07-22.csv`.
- Added `fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv`.
- Added `fixtures/geography/georgia-qsr-zcta-county-primary-2020.csv`.
- Added `fixtures/geography/georgia-qsr-county-cbsa-2023.csv`.
- Added Georgia QSR extraction and review notes.
- Added Atlanta CBSA drilldown, ring report, statewide summaries, and
  `reports/qsr-atlanta-comparison.md`.

## Readout

Georgia QSR raw rows:

| Brand | Rows |
|---|---:|
| Burger King | 271 |
| McDonald's | 452 |
| Taco Bell | 256 |
| Wendy's | 290 |
| Total | 1269 |

Georgia reviewed rows:

| Review status | Rows |
|---|---:|
| packet_ready | 1259 |
| needs_review | 10 |

Atlanta-Sandy Springs-Roswell CBSA (`12060`) has 639 packet-ready QSR rows:

| Brand | Stores |
|---|---:|
| Burger King | 119 |
| McDonald's | 229 |
| Taco Bell | 135 |
| Wendy's | 156 |
| Total | 639 |

Compared with Seattle-Tacoma-Bellevue's 274 QSR rows, Atlanta has 2.3x the
observed QSR footprint in this release. The Atlanta ring read is contested in
urban core, inner suburb, outer suburb, and exurb.

## Validation

```powershell
duckdb -c ".read queries/overture-qsr-georgia-2026-07-22.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-qsr-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-qsr-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-qsr-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv fixtures\geography\georgia-qsr-zcta-county-primary-2020.csv fixtures\geography\georgia-qsr-county-cbsa-2023.csv
cargo run -p turf-cli -- ring-metro-review 12060 33.7490 -84.3880 fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv fixtures\geography\georgia-qsr-zcta-county-primary-2020.csv fixtures\geography\georgia-qsr-county-cbsa-2023.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
