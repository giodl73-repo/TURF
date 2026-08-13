# Pulse 108: Type-Discovery Profile Validator

## Goal

Make the cross-metro type-discovery profile a checked contract rather than a
report convention.

## Work

- Added a typed row contract for cross-metro type-discovery profiles.
- Added parser and validator functions.
- Added CLI command `validate-type-discovery-profile`.
- Added Rust tests for valid profiles, invalid comparison tiers, and invalid
  layer-count totals.
- Documented the validator in the README and report.

## Evidence

Validator command:

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

Current output:

```text
valid,reports\ret-cross-metro-type-discovery-profile.csv,20
```

## Learning

TURF now has a reusable gate for scaling typed-enclave discovery. New metros can
be added to the profile only if they preserve region, profile basis, observed
layers, source-gated layers, checked absences, readiness, and comparison tier.

## Validation

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```
