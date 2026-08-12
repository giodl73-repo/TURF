# Pulse 50: Georgia Grocery and Mass Retail Backfill

## Goal

Backfill Georgia grocery and mass-retail layers so Atlanta district anchor
predictions use category coverage closer to the North Seattle profile.

## Work

- Added Georgia mass-retail and grocery Overture extraction queries.
- Generated raw and reviewed Georgia mass-retail and grocery fixtures.
- Wired both reviewed layers into the Atlanta district anchor profile.
- Added new district modifiers for urban mall-grocery grids and legacy
  mall-grocery service grids.

## Evidence

Mass retail:

```text
fixtures/stores/overture-mass-retail-georgia-review-2026-07-22.csv
```

Grocery:

```text
fixtures/stores/overture-grocery-georgia-review-2026-07-22.csv
```

Updated district profile:

```text
reports/ret-atlanta-district-anchor-profile.csv
```

## Learning

The backfill materially changes the Atlanta district predictions. Buckhead /
Lenox / Phipps becomes an `urban_mall_grocery_grid`: mall evidence stacks with
four grocery brands and mass retail, but not with home-improvement or auto-parts
inside the district slice.

Northlake becomes a `legacy_mall_grocery_service_grid`: Northlake Mall appears
with strong grocery depth but little QSR or big-box service evidence in the
current slice.

Perimeter remains underclassified relative to intuition because the slice has
mall, grocery, mass retail, QSR, and one home-improvement brand, but no auto
parts and no dual home-improvement depth. That is useful pressure on the rules
and geometry.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-georgia-review-2026-07-22.csv
duckdb -c ".read queries/ret-atlanta-district-anchor-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
