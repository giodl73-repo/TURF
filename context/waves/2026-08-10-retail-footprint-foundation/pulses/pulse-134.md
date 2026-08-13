# Pulse 134: Los Angeles Retail-Complex Confirmation

Date: 2026-08-13

## Intent

Add retail-complex confirmation for the same seven LA / Inland Empire fields so
the pre-scale stack can test whether store-layer types are anchored by named
mall, plaza, district, towne-center, or shopping-center structure.

## Changes

- Added a California Overture Places retail-complex extract.
- Added a target-limited California retail-complex review layer.
- Generated the LA / Inland Empire anchor-field retail-complex summary.
- Folded retail-complex confirmation into the LA pre-scale field stack.

## Evidence

- `queries/overture-retail-complex-california-2026-07-22.sql`
- `queries/overture-retail-complex-california-review-2026-07-22.sql`
- `queries/ret-los-angeles-anchor-field-retail-complex-summary.sql`
- `queries/ret-los-angeles-pre-scale-field-stack.sql`
- `fixtures/stores/overture-retail-complex-california-2026-07-22.csv`
- `fixtures/stores/overture-retail-complex-california-review-2026-07-22.csv`
- `reports/ret-los-angeles-anchor-field-retail-complex-summary.csv`
- `reports/ret-los-angeles-anchor-field-retail-complex-summary.md`
- `reports/ret-los-angeles-pre-scale-field-stack.csv`
- `reports/ret-los-angeles-pre-scale-field-stack.md`

## Result

All seven LA / Inland Empire fields have named complex structure. Downtown LA /
Koreatown / Mid-Wilshire and South Bay / Torrance are fully comparable with no
source gates. The other five fields are type-discovery comparable with postal
retry gates preserved.
