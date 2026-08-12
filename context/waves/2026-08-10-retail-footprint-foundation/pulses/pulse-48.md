# Pulse 48: Atlanta Retail Complex Anchor Backfill

## Goal

Backfill Georgia retail-complex evidence and compare Atlanta anchor modifiers
against the North Seattle anchor modifier vocabulary.

## Work

- Added the Georgia retail-complex Overture extraction query.
- Generated raw and reviewed Georgia retail-complex fixtures.
- Added an Atlanta anchor-modifier query over the existing selected-place
  capacity matrix.
- Added an Atlanta anchor-modifier CSV and Markdown readout.

## Evidence

Raw extract:

```text
fixtures/stores/overture-retail-complex-georgia-2026-07-22.csv
```

Reviewed layer:

```text
fixtures/stores/overture-retail-complex-georgia-review-2026-07-22.csv
```

Modifier output:

```text
reports/ret-atlanta-anchor-modifiers.csv
```

## Learning

Atlanta city reads differently from North Seattle. The Atlanta row has many
mall and village signals at once, so the city-level modifier is
`urban_multi_mall_service_grid`.

Marietta and Alpharetta look like active suburban mall anchors. Cumberland Mall
and North Point Mall appear with dual home-improvement capacity, QSR depth, and
auto-parts service.

The next step is a district-slice model for Atlanta, especially
Cumberland/Vinings, Buckhead/Lenox/Phipps, Perimeter, Camp Creek, and
Northlake. City labels are too coarse for these anchor districts.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-georgia-review-2026-07-22.csv
duckdb -c ".read queries/ret-atlanta-anchor-modifiers.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
