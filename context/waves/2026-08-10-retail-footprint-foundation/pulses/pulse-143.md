# Pulse 143: Dallas/Fort Worth Auto-Parts Sidecar

Date: 2026-08-13

## Intent

Complete the Dallas/Fort Worth standardized sidecar pair by backfilling auto
parts across the same eight anchor-field targets used by QSR.

## Changes

- Added the Texas auto-parts Overture extract query for AutoZone, O'Reilly Auto
  Parts, NAPA Auto Parts, and Advance Auto Parts exact-brand candidates.
- Added a conservative Texas auto-parts review query and reviewed fixture.
- Added the Dallas/Fort Worth anchor-field auto-parts summary query, CSV, and
  report.
- Added the Dallas/Fort Worth QSR / auto-parts comparison report.
- Updated the wave table, README, and `.roles` review with the sidecar-pair
  closeout.

## Evidence

- `queries/overture-auto-parts-texas-2026-07-22.sql`
- `queries/overture-auto-parts-texas-review-2026-07-22.sql`
- `fixtures/stores/overture-auto-parts-texas-2026-07-22.csv`
- `fixtures/stores/overture-auto-parts-texas-review-2026-07-22.csv`
- `queries/ret-dallas-anchor-field-auto-parts-summary.sql`
- `reports/ret-dallas-anchor-field-auto-parts-summary.csv`
- `reports/ret-dallas-anchor-field-auto-parts-summary.md`
- `reports/ret-dallas-qsr-auto-parts-comparison.md`

## Result

The Texas auto-parts review fixture validates with 1,827 packet-ready rows after
excluding 15 rows. Arlington / Grand Prairie is the only dense multi-brand
auto-service grid among the eight Dallas/Fort Worth fields, and it is also the
only four-brand dense QSR grid. NorthPark / Preston Hollow and Galleria /
Addison show smaller two-brand auto-service nodes. Downtown / Uptown Dallas and
Southlake Town Square are checked absent for this auto-parts chain set inside
the current field boxes.

## Next

Compare the completed sidecars against civic/postal and common-store layers
before deciding whether QSR and auto parts stay as sidecars or become standard
profile dimensions before sixth-metro scale.
