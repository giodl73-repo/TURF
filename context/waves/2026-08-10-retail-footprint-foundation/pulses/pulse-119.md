# Pulse 119: Atlanta Post-Office Source Resolution

## Goal

Continue the civic/postal source-resolution pass by resolving one Atlanta
source gate without adding another metro or store category.

## Changes

- Retried Northlake and Camp Creek post-office extraction through an alternate
  Overpass endpoint.
- Added three reviewed Northlake post-office-tagged rows.
- Kept all three Northlake rows excluded as private shipping counters.
- Removed Northlake from the Atlanta post-office source-gate fixture.
- Added two reviewed Camp Creek post-office-tagged rows.
- Kept both Camp Creek rows excluded as private shipping counters.
- Removed Camp Creek from the Atlanta post-office source-gate fixture.
- Updated the Atlanta post-office query to use the reviewed fixture schema
  explicitly.
- Regenerated Atlanta post-office, civic context, context summary, pre-scale
  readiness, and cross-metro profile CSVs.
- Added `reports/ret-atlanta-source-resolution-pass.md`.
- Updated README, reports, wave state, and role review.

## Findings

Northlake and Camp Creek did not gain postal civic signal. They became better
understood: post-office moved from source-gated to checked absent, with private
shipping counters retained in the audit fixture.

Northlake remains source-limited overall, but its source-gated dimensions drop
from 10 to 9 and its checked-absent dimensions rise from 0 to 1.

Camp Creek remains source-limited overall, but its source-gated dimensions drop
from 9 to 8 and its checked-absent dimensions rise from 1 to 2.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-post-office-summary.sql"
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

Complete. Atlanta post-office source resolution has no remaining source-gated
target fields; the next pass should target a civic/service layer that can reduce
more Atlanta source gates.
