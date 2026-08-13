# Pulse 132: Los Angeles Pharmacy Layer

Date: 2026-08-13

## Intent

Add the Los Angeles / Inland Empire pharmacy layer so the pre-scale stack can
separate grocery-rich fields from fuller health-errand service grids.

## Changes

- Added a California Overture Places drugstore extract for CVS Pharmacy,
  Walgreens, Rite Aid, and Good Neighbor Pharmacy.
- Added a conservative California drugstore review layer that excludes clinics,
  specialty rows, and brand/name mismatches.
- Generated the LA / Inland Empire anchor-field pharmacy summary.
- Documented the multi-brand versus CVS-only health-errand split.

## Evidence

- `queries/overture-drugstore-california-2026-07-22.sql`
- `queries/overture-drugstore-california-review-2026-07-22.sql`
- `queries/ret-los-angeles-anchor-field-pharmacy-summary.sql`
- `fixtures/stores/overture-drugstore-california-2026-07-22.csv`
- `fixtures/stores/overture-drugstore-california-review-2026-07-22.csv`
- `reports/ret-los-angeles-anchor-field-pharmacy-summary.csv`
- `reports/ret-los-angeles-anchor-field-pharmacy-summary.md`

## Result

All seven fields have exact-brand pharmacy signal. Downtown LA / Koreatown /
Mid-Wilshire, West LA / Century City / Culver City, Riverside / Tyler / Corona,
and Long Beach / Lakewood are multi-brand health-errand fields. Glendale /
Burbank, South Bay / Torrance, and Ontario / Rancho Cucamonga are CVS-only in
this exact-brand slice.
