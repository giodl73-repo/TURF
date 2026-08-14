# Pulse 161: Cross-Metro Gas / Convenience Sidecar

Date: 2026-08-13

## Intent

Add the car-trip contrast chosen by Pulse 160 using recognizable national and
super-regional gas, convenience, and travel-stop operator names across the
current six-metro, 43-field profile.

## Changes

- Added an Overture gas / convenience extract across California, Georgia,
  Illinois, New Jersey, Pennsylvania, Texas, and Washington.
- Added a conservative review layer for public-facing gas, convenience, and
  travel-stop candidates.
- Added a cross-metro gas / convenience sidecar query, CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-gas-convenience-profile-states-2026-07-22.sql`
- `queries/overture-gas-convenience-profile-states-review-2026-07-22.sql`
- `fixtures/stores/overture-gas-convenience-profile-states-2026-07-22.csv`
- `fixtures/stores/overture-gas-convenience-profile-states-review-2026-07-22.csv`
- `queries/ret-cross-metro-gas-convenience-sidecar.sql`
- `reports/ret-cross-metro-gas-convenience-sidecar.csv`
- `reports/ret-cross-metro-gas-convenience-sidecar.md`

## Result

The review fixture validates with 26,002 packet-ready rows after excluding 333
brand false positives and 1,412 duplicate candidates.

Across 43 fields, the sidecar finds 15 dense multi-brand car-trip grids, 14
multi-brand car-trip corridors, nine gas / convenience service nodes, and five
single gas / convenience anchors. There are no checked-absent fields in this
national-operator layer.

Los Angeles / Inland Empire is dense in every selected field. Dallas/Fort Worth
and Atlanta show edge-city and corridor concentration. Washington and Chicago
are more selective, which makes gas / convenience a sharper car-trip contrast
than insurance.

## Next

Compare QSR, auto parts, and gas / convenience as the car-service / car-trip
stack.
