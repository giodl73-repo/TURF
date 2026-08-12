# Pulse 58: Anchor Profile Generator

## Goal

Add a TURF CLI command that emits Anchor Profile v0 from checked intermediate
reports, so the profile is no longer DuckDB-only.

## Work

- Added `build_ret_anchor_profile_v0` and `render_ret_anchor_profile_csv` in
  `turf-core`.
- Added `turf-cli anchor-profile-v0`.
- Kept `validate-anchor-profile` as the contract check for generated output.
- Updated README, profile docs, anchor-modifier docs, wave state, and role
  review.

## Learning

Anchor Profile v0 can now be regenerated through TURF itself from the existing
North Seattle anchor modifier report, North Seattle enclave profile, Atlanta
district anchor profile, and Atlanta pressure audit. The command preserves the
same explicit geography scopes as the DuckDB profile.

## Validation

```powershell
cargo run -p turf-cli -- anchor-profile-v0 reports\ret-north-seattle-anchor-modifiers.csv reports\ret-north-seattle-enclave-profile.csv reports\ret-atlanta-district-anchor-profile.csv reports\ret-atlanta-anchor-pressure-audit.csv
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v0.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
