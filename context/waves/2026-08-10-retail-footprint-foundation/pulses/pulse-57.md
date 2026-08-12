# Pulse 57: Anchor Profile Contract

## Goal

Turn Anchor Profile v0 from a report-only CSV into a checked contract that can
be validated by the TURF CLI.

## Work

- Added a typed RET anchor profile parser and validator in `turf-core`.
- Added `turf-cli validate-anchor-profile`.
- Added contract tests for valid anchor profile rows and invalid modifiers.
- Updated README, profile docs, anchor-modifier docs, wave state, and role
  review.

## Learning

The anchor profile now has a stable v0 shape: geography scope, category counts,
source modifier, final anchor modifier, and an evidence summary. This makes the
next implementation step smaller because generated anchor-profile outputs can
be checked before they are interpreted.

## Validation

```powershell
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v0.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
