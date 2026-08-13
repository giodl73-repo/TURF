# Pulse 88: Atlanta Civic Context Summary

## Goal

Summarize Atlanta's four civic context dimensions before moving into everyday
anchors.

## Work

- Added `queries/ret-atlanta-anchor-field-civic-context-summary.sql`.
- Generated `reports/ret-atlanta-anchor-field-civic-context-summary.csv`.
- Added `reports/ret-atlanta-anchor-field-civic-context-summary.md`.
- Updated README, wave state, and role review.

## Learning

Current Atlanta civic archetypes:

- Cumberland / Vinings: `postal_only_civic_field`.
- Buckhead / Lenox / Phipps: `postal_library_open_space_civic_stack`.
- Perimeter widened: `postal_transit_edge_city_field`.
- Camp Creek: `fully_source_gated_civic_field`.
- Northlake: `fully_source_gated_civic_field`.
- North Point / Alpharetta widened: `postal_open_space_edge_field`.
- Decatur / Emory: `postal_only_civic_field`.

Buckhead, Perimeter, and North Point are no longer just generic mall or
edge-city fields. The civic stack is differentiating them:

- Buckhead stacks postal, library, and open-space evidence.
- Perimeter stacks postal and MARTA mobility evidence.
- North Point stacks postal and open-space evidence.

Camp Creek and Northlake remain fully source-gated across the civic pass, so
they need another source strategy or later Overpass retry before civic
comparability claims.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-civic-context-summary.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
