# Pulse 59: Anchor Profile Summary

## Goal

Add an executable summary over Anchor Profile v0 so the profile can be read as
counts by modifier, geography scope, and region.

## Work

- Added `RetAnchorProfileSummary` and `summarize_ret_anchor_profile`.
- Added `turf-cli summarize-anchor-profile`.
- Added a summary unit test.
- Updated README, profile docs, anchor-modifier docs, wave state, and role
  review.

## Learning

The current anchor profile has 19 rows, 10 mall-signal rows, and 2 edge-city
rows. That gives TURF a quick regression signal: if future source or rule work
changes these counts, the change will be visible before deeper analysis.

## Validation

```powershell
cargo run -p turf-cli -- summarize-anchor-profile reports\ret-anchor-profile-v0.csv
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v0.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
