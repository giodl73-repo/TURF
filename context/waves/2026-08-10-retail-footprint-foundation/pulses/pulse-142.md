# Pulse 142: Dallas/Fort Worth QSR Sidecar

Date: 2026-08-13

## Intent

Backfill the standardized QSR sidecar for Dallas/Fort Worth across the existing
eight anchor-field targets before adding another urban area.

## Changes

- Added the Texas QSR Overture extract query for McDonald's, Burger King,
  Wendy's, and Taco Bell exact-brand candidates.
- Added a conservative Texas QSR review query and reviewed fixture.
- Added the Dallas/Fort Worth anchor-field QSR summary query, CSV, and report.
- Updated the wave table and `.roles` review with the QSR sidecar read.

## Evidence

- `queries/overture-qsr-texas-2026-07-22.sql`
- `queries/overture-qsr-texas-review-2026-07-22.sql`
- `fixtures/stores/overture-qsr-texas-2026-07-22.csv`
- `fixtures/stores/overture-qsr-texas-review-2026-07-22.csv`
- `queries/ret-dallas-anchor-field-qsr-summary.sql`
- `reports/ret-dallas-anchor-field-qsr-summary.csv`
- `reports/ret-dallas-anchor-field-qsr-summary.md`

## Result

The Texas QSR review fixture validates with 2,989 packet-ready rows after
excluding five brand false positives. Arlington / Grand Prairie is the only
four-brand dense QSR grid among the eight Dallas/Fort Worth fields. Downtown /
Uptown Dallas, Galleria / Addison, Legacy / Frisco / Plano, and Las Colinas /
Irving read as multi-brand QSR corridors. NorthPark / Preston Hollow reads as a
QSR service node, while Southlake Town Square and Fort Worth West 7th remain
single-anchor QSR fields inside the current target boxes.

## Next

Backfill Dallas/Fort Worth auto parts across the same eight target fields, then
compare QSR daily-trip signal against auto-parts trade/car-service signal before
deciding whether sidecars should influence the core profile contract.
