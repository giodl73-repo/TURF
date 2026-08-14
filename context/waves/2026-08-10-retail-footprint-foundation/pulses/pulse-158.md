# Pulse 158: Cross-Metro Tax-Prep Gap Fill

Date: 2026-08-13

## Intent

Fill the national tax-prep sidecar gap across the current six-metro,
43-field type-discovery profile.

## Changes

- Added a missing-profile-state Overture tax-prep extract for California,
  Georgia, Illinois, Texas, and Washington.
- Added a conservative review query and reviewed fixture for those states.
- Added a cross-metro tax-prep sidecar query, CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-tax-prep-profile-states-2026-07-22.sql`
- `queries/overture-tax-prep-profile-states-review-2026-07-22.sql`
- `fixtures/stores/overture-tax-prep-profile-states-2026-07-22.csv`
- `fixtures/stores/overture-tax-prep-profile-states-review-2026-07-22.csv`
- `queries/ret-cross-metro-tax-prep-sidecar.sql`
- `reports/ret-cross-metro-tax-prep-sidecar.csv`
- `reports/ret-cross-metro-tax-prep-sidecar.md`

## Result

The missing-profile-state review fixture validates with 4,176 packet-ready
rows after excluding 375 brand false positives and eight duplicate candidates.
Combined with the Pennsylvania / New Jersey fixture, tax prep now covers all
43 current profile fields. The sidecar finds 12 multi-brand tax-prep service
grids, 15 tax-prep service nodes, 15 single tax-prep anchors, and one
checked-absent field.

Los Angeles / Inland Empire is the strongest region with six multi-brand
tax-prep grids. Arlington / Grand Prairie, Northeast Roosevelt, and Cherry Hill
/ Moorestown are convergence fields where tax prep reinforces QSR, auto parts,
finance, and retail-corridor evidence.

## Next

Decide whether to add another national professional-services layer, such as
insurance or real estate brokerage, or move to the gas / convenience car-trip
contrast.
