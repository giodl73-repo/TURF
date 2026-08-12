# Pulse 54: Atlanta Anchor Pressure Audit

## Goal

Test whether Perimeter and North Point / Alpharetta are weak anchor predictions
because of source gaps, tight geometry, or an intentionally conservative active
anchor rule.

## Work

- Added `queries/ret-atlanta-anchor-pressure-audit.sql`.
- Generated `reports/ret-atlanta-anchor-pressure-audit.csv`.
- Added `reports/ret-atlanta-anchor-pressure-audit.md`.
- Updated the wave record, role review, and README command list.

## Learning

Widening the district boxes changes both Perimeter and North Point / Alpharetta
from `mall_anchor_needs_category_depth` to `urban_mall_service_grid`. That means
the core issue was tight district geometry around a mall, not missing mall
detection.

The widened boxes still do not become `active_regional_mall_anchor` because the
current rule requires dual auto-parts depth. That keeps Atlanta edge-city mall
grids separate from Washington suburban active regional anchors.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-pressure-audit.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
