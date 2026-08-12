# Pulse 51: Georgia Drugstore Layer

## Goal

Add Georgia exact-brand drugstore evidence to the district anchor profile and
test whether service-completeness changes the predictions.

## Work

- Added a Georgia drugstore Overture extraction query.
- Generated raw and reviewed Georgia drugstore fixtures.
- Wired reviewed drugstore rows into the Atlanta district anchor profile.
- Updated the district report with drugstore-aware counts and learning.

## Evidence

Raw extract:

```text
fixtures/stores/overture-drugstore-georgia-2026-07-22.csv
```

Reviewed layer:

```text
fixtures/stores/overture-drugstore-georgia-review-2026-07-22.csv
```

Updated district profile:

```text
reports/ret-atlanta-district-anchor-profile.csv
```

## Learning

Drugstores add service-completeness evidence, but they do not erase the
distinction between mall-service grids and active regional mall anchors.
Buckhead / Lenox / Phipps remains an `urban_mall_grocery_grid` with stronger
service support. Northlake remains a `legacy_mall_grocery_service_grid`.
Perimeter remains `mall_anchor_needs_category_depth`.

This is a good sign: one additional service layer does not mechanically upgrade
every mall district. The rules still require a broader stack for active regional
anchor calls.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-georgia-review-2026-07-22.csv
duckdb -c ".read queries/ret-atlanta-district-anchor-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
