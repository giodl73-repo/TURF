# Pulse 131: Los Angeles Grocery Layer

Date: 2026-08-13

## Intent

Add the Los Angeles / Inland Empire grocery layer so Target-only mass-retail
fields can be distinguished from weak everyday-service fields.

## Changes

- Added a California Overture Places grocery extract for selected statewide,
  Southern California, and national/specialty grocery brands.
- Added a conservative California grocery review layer with service-row and
  brand/name mismatch exclusions.
- Generated the LA / Inland Empire anchor-field grocery summary.
- Documented that all seven fields carry multi-brand grocery-grid signal.

## Evidence

- `queries/overture-grocery-california-2026-07-22.sql`
- `queries/overture-grocery-california-review-2026-07-22.sql`
- `queries/ret-los-angeles-anchor-field-grocery-summary.sql`
- `fixtures/stores/overture-grocery-california-2026-07-22.csv`
- `fixtures/stores/overture-grocery-california-review-2026-07-22.csv`
- `reports/ret-los-angeles-anchor-field-grocery-summary.csv`
- `reports/ret-los-angeles-anchor-field-grocery-summary.md`

## Result

All seven selected Los Angeles / Inland Empire fields classify as
`multi_brand_grocery_grid`. Downtown LA and West LA remain Target-only in the
mass-retail layer, but the grocery layer shows they are strong everyday-service
fields rather than sparse retail fields.
