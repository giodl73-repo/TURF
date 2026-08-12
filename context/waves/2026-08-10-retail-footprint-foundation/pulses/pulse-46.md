# Pulse 46: Washington Retail Complex Anchor Test

## Goal

Test whether named malls and shopping centers provide an independent anchor
signal for RET regional-anchor and legacy-anchor types.

## Work

- Added a broad Overture Washington retail-complex candidate query.
- Generated raw and reviewed retail-complex fixtures.
- Kept only high-confidence named complexes in the reviewed layer.
- Added retail-complex counts and a `has_mall_complex` flag to the North
  Seattle / South Snohomish enclave profile.
- Documented the name-match noise caveat and review boundary.

## Evidence

Raw extract:

```text
fixtures/stores/overture-retail-complex-washington-2026-07-22.csv
```

Reviewed layer:

```text
fixtures/stores/overture-retail-complex-washington-review-2026-07-22.csv
```

Profile output:

```text
reports/ret-north-seattle-enclave-profile.csv
```

## Learning

Mall evidence is useful as a separate anchor dimension. Lynnwood / Alderwood
and Everett both carry named mall-complex evidence while also carrying broad
store-category stacks. That supports their regional-anchor labels.

Northgate / Lake City is the more interesting case: it has a legacy mall signal
from Northgate Mall, but the current store stack still reads as a neighborhood
grocery-service grid. This suggests TURF should eventually distinguish active
regional anchors, legacy/redeveloping anchors, and ordinary service grids.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-washington-review-2026-07-22.csv
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
