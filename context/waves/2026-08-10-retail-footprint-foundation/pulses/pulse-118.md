# Pulse 118: Chicago Post-Office Source Resolution

## Goal

Start the civic/postal source-resolution pass by reducing a Chicago source gate
without adding another metro or store category.

## Changes

- Retried Loop / River North post-office extraction through an alternate
  Overpass endpoint.
- Added 16 Loop / River North reviewed post-office rows.
- Promoted three USPS post offices and excluded 13 private shipping counters.
- Updated post-office review policy to exclude DHL for `post_office`.
- Removed Loop / River North from the Chicago post-office source-gate fixture.
- Regenerated Chicago post-office, Chicago stack, and cross-metro profile CSVs.
- Added `reports/ret-chicago-source-resolution-pass.md`.
- Updated README, reports, wave state, and role review.

## Findings

Loop / River North now has observed postal civic signal: Chicago Loop Post
Office, Fort Dearborn Post Office, and John Hancock Post Office. Its Chicago
stack row improved from two source gates to one source gate and from
`usable_for_type_discovery_retry_osm_before_ranking` to
`usable_for_type_discovery`.

Lincoln Park / Lakeview was retried through the same alternate endpoint and
timed out again, so it remains source-gated.

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

Complete. Chicago source resolution has started; the next pass should retry
another Chicago field or begin Atlanta civic/postal source resolution.
