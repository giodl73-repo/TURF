# Pulse 120: Atlanta Library Source Resolution

## Goal

Continue the before-more-metros source-resolution goal by resolving Atlanta
library gates for the two weakest Atlanta fields.

## Changes

- Retried Northlake and Camp Creek library extraction through an alternate
  Overpass endpoint.
- Added Northlake-Barbara Loar Branch as a packet-ready library row.
- Removed Northlake from the Atlanta library source-gate fixture.
- Removed Camp Creek from the Atlanta library source-gate fixture after the
  retry returned no packet-ready rows.
- Regenerated Atlanta library, civic context, context summary, pre-scale
  readiness, and cross-metro profile CSVs.
- Added `reports/ret-atlanta-library-source-resolution-pass.md`.
- Updated README, source-resolution reports, next-scale decision, wave state,
  and role review.

## Findings

Northlake is no longer civic-blank: it has observed public library signal while
post office remains checked absent. It still stays source-limited because eight
dimensions remain source-gated.

Camp Creek remains thin, but clearer. Post office, library, and pharmacy are
checked absent; wellness is observed; seven dimensions remain source-gated.

Atlanta now has six partial fields and one source-limited field in the local
readiness report. The cross-metro comparison profile still keeps Camp Creek
source-limited because it has only one observed layer, so Atlanta is still not
ready for final ranking against Washington.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-library-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-civic-context-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-atlanta-pre-scale-readiness.sql"
duckdb -c ".read queries/ret-cross-metro-type-discovery-profile.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The next reasonable goal is to resolve another high-gate Atlanta or
Chicago civic/service layer before adding the fifth metro.
