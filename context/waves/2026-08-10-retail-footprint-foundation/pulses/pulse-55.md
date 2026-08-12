# Pulse 55: Edge-City Mall Rule Candidate

## Goal

Promote the Atlanta pressure-audit learning into a documented candidate anchor
modifier without relaxing the active regional-anchor rule.

## Work

- Added `docs/ret-anchor-modifiers.md`.
- Added `queries/ret-edge-city-mall-rule-audit.sql`.
- Generated `reports/ret-edge-city-mall-rule-audit.csv`.
- Added `reports/ret-edge-city-mall-rule-audit.md`.
- Updated the wave record, role review, and README pointers.

## Learning

`edge_city_mall_service_grid` separates widened Atlanta edge-city mall fields
from Washington active regional mall anchors. Perimeter and North Point /
Alpharetta have broad mall/service evidence after widening, but each has only
one auto-parts brand in the current checked field. Alderwood and Everett keep
the active-anchor label because they have repeated auto-parts depth.

## Validation

```powershell
duckdb -c ".read queries/ret-edge-city-mall-rule-audit.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
