# Pulse 159: Cross-Metro Insurance Sidecar

Date: 2026-08-13

## Intent

Add a second national professional-services sidecar across the current
six-metro, 43-field profile using recognizable insurance agency brands.

## Changes

- Added an Overture insurance extract for State Farm, Allstate, Farmers
  Insurance, GEICO, Nationwide Insurance, and American Family Insurance across
  California, Georgia, Illinois, New Jersey, Pennsylvania, Texas, and
  Washington.
- Added a conservative review query and reviewed fixture.
- Added a cross-metro insurance sidecar query, CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-insurance-profile-states-2026-07-22.sql`
- `queries/overture-insurance-profile-states-review-2026-07-22.sql`
- `fixtures/stores/overture-insurance-profile-states-2026-07-22.csv`
- `fixtures/stores/overture-insurance-profile-states-review-2026-07-22.csv`
- `queries/ret-cross-metro-insurance-sidecar.sql`
- `reports/ret-cross-metro-insurance-sidecar.csv`
- `reports/ret-cross-metro-insurance-sidecar.md`

## Result

The review fixture validates with 21,163 packet-ready rows after excluding 24
brand false positives and 1,810 duplicate candidates. The sidecar finds 33
dense multi-brand insurance-service grids, four multi-brand insurance-service
grids, five insurance-service nodes, and one checked-absent field.

Insurance is broader than tax prep. It reads as local agency/service fabric
rather than a selective consumer-professional corridor layer. Camden Waterfront
/ Cooper is the only checked-absent field, which keeps it distinct from
Northeast Roosevelt and Cherry Hill / Moorestown.

## Next

Compare tax prep and insurance as professional-services sidecars, then decide
whether real estate brokerage is needed or whether TURF should move to gas /
convenience as the car-trip contrast.
