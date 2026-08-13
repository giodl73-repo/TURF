# Pulse 121: Atlanta Gym Source Resolution

## Goal

Continue the before-more-metros source-resolution pass by retrying Atlanta gym
source gates and refreshing the cross-metro profile.

## Changes

- Retried Perimeter widened, Northlake, and Decatur / Emory gym extraction
  through an alternate Overpass endpoint.
- Added five packet-ready Perimeter gym rows.
- Added one packet-ready Northlake gym row.
- Removed Perimeter and Northlake from the Atlanta gym source-gate fixture.
- Kept Decatur / Emory source-gated because the retry timed out.
- Regenerated Atlanta gym, context summary, pre-scale readiness, and
  cross-metro profile CSVs.
- Added `reports/ret-atlanta-gym-source-resolution-pass.md`.
- Updated README, reports, wave state, and role review.

## Findings

Perimeter widened is now a dense wellness-service edge-city field, stacking gym
signal with postal, transit, and health layers.

Northlake now has library, pharmacy, and gym signal. It moves from
`source_limited_field` to `partial_profile_field` locally and from
`source_limited` to `type_discovery_partial` in the cross-metro comparison
profile.

Camp Creek is the only remaining Atlanta source-limited comparison row because
it still has one observed layer.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-atlanta-pre-scale-readiness.sql"
duckdb -c ".read queries/ret-cross-metro-type-discovery-profile.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The next reasonable target is Camp Creek source resolution or
Chicago's remaining post-office/gym source gates before adding a fifth metro.
