# Pulse 122: Chicago Orland Post-Office Source Resolution

## Goal

Continue the before-more-metros source-resolution pass by reducing Chicago's
remaining post-office source gates.

## Changes

- Retried Old Orchard / Skokie and Orland Square post-office extraction through
  an alternate Overpass endpoint.
- Added two packet-ready Orland Square USPS rows: Orland Park Post Office and
  Orland Park Retail Post Office.
- Added Shipping Pros as an excluded private shipping counter.
- Removed Orland Square from the Chicago post-office source-gate fixture.
- Kept Old Orchard / Skokie source-gated because the retry returned a 504
  timeout.
- Regenerated Chicago post-office, Chicago pre-scale stack, and the
  cross-metro type-discovery profile.
- Added `reports/ret-chicago-orland-post-office-source-resolution-pass.md`.
- Updated README, Chicago reports, cross-metro profile report, wave state, and
  role review.

## Findings

Orland Square now has observed postal civic signal stacked with confirmed mall
and grocery support. It moves from `source_limited_retry_or_alternate_source`
to `usable_for_type_discovery` in the Chicago stack.

The cross-metro profile now has six Chicago type-discovery-comparable fields
and one partial field. Old Orchard / Skokie is the remaining Chicago partial
field because both post office and gym are still source-gated.

## Validation

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-post-office-summary.sql"
duckdb -c ".read queries/ret-chicago-pre-scale-field-stack.sql"
duckdb -c ".read queries/ret-cross-metro-type-discovery-profile.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The next reasonable target is Old Orchard post-office/gym resolution
or a fifth-metro decision if the remaining Chicago and Atlanta source limits are
accepted as explicit.
