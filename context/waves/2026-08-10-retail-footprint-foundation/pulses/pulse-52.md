# Pulse 52: Cumberland Retail Complex Review Fix

## Goal

Fix the Cumberland/Vinings anchor prediction by correcting the Georgia
retail-complex review priority for Cumberland Mall.

## Work

- Regenerated the Georgia retail-complex reviewed layer.
- Preferred the in-district Atlanta Cumberland Mall point over an outlying
  Marietta duplicate candidate.
- Regenerated the Atlanta district anchor profile.
- Updated the Atlanta district report to distinguish review-quality fixes from
  district-geometry fixes.

## Evidence

Reviewed layer:

```text
fixtures/stores/overture-retail-complex-georgia-review-2026-07-22.csv
```

Updated profile:

```text
reports/ret-atlanta-district-anchor-profile.csv
```

## Learning

The previous Cumberland/Vinings miss was not mainly a district-box problem. The
review layer promoted a poor Cumberland Mall duplicate outside the district and
excluded the in-district Atlanta Cumberland Mall point.

After correction, Cumberland/Vinings carries both Cumberland Mall and Cumberland
Marketplace and upgrades from `capacity_profile_mixed` to
`urban_mall_service_grid`.

This is an important predictor lesson: before changing geography, check whether
the reviewed source layer selected the right representative point.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-georgia-review-2026-07-22.csv
duckdb -c ".read queries/ret-atlanta-district-anchor-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
