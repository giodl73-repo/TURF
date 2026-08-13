# Pulse 139: Sidecar Standardization Decision

Date: 2026-08-13

## Intent

Decide whether QSR and auto parts should become standard pre-scale sidecar
layers before TURF changes the core cross-metro profile or adds a sixth metro.

## Changes

- Added the sidecar standardization decision.
- Added the Chicago/Dallas sidecar backfill plan.
- Kept QSR and auto parts outside the core cross-metro profile until backfill
  coverage is even.

## Evidence

- `reports/ret-cross-metro-type-discovery-profile.csv`
- `reports/ret-los-angeles-anchor-field-qsr-summary.csv`
- `reports/ret-los-angeles-anchor-field-auto-parts-summary.csv`
- `reports/ret-los-angeles-qsr-auto-parts-comparison.md`
- `reports/ret-sidecar-standardization-decision.md`
- `reports/ret-sidecar-backfill-plan.md`

## Result

QSR and auto parts become standard pre-scale sidecars. They do not become core
profile dimensions yet.

The next pulse should backfill Chicago QSR first, then Chicago auto parts,
Dallas QSR, and Dallas auto parts before TURF changes the cross-metro profile
or selects a sixth metro.
