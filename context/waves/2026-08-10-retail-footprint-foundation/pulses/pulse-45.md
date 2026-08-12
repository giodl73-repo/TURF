# Pulse 45: Washington Drugstore Layer

## Goal

Add a clean exact-brand Washington drugstore layer and test whether it improves
the North Seattle / South Snohomish RET enclave profile.

## Work

- Added the Overture Washington drugstore extraction query for Bartell Drugs,
  CVS Pharmacy, and Walgreens.
- Generated raw and reviewed Washington drugstore fixtures.
- Excluded duplicate `brand/address/city` rows in the reviewed layer.
- Added drugstore counts to the North Seattle enclave profile.
- Documented the source caveat that this is not a complete pharmacy census.

## Evidence

Raw extract:

```text
fixtures/stores/overture-drugstore-washington-2026-07-22.csv
```

Reviewed layer:

```text
fixtures/stores/overture-drugstore-washington-review-2026-07-22.csv
```

Profile output:

```text
reports/ret-north-seattle-enclave-profile.csv
```

## Learning

Drugstores sharpen service-completeness evidence where clean brand rows appear,
but they do not currently reshape the north-end RET type labels. Everett gains
three rows across two drugstore brands. Lynnwood / Alderwood, Shoreline, and
Bothell each gain one row. Aurora and Northgate / Lake City do not gain clean
drugstore rows in this exact-brand layer.

The important data lesson is negative: Overture's exact brand field is too
sparse for full pharmacy access. Future pharmacy modeling should combine clean
drugstore brands with store-name/category evidence and store-with-pharmacy
signals, while keeping the source policy boundary explicit.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-washington-review-2026-07-22.csv
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
