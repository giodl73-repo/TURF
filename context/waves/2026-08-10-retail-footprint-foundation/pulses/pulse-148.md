# Pulse 148: Philadelphia Grocery Layer

Date: 2026-08-13

## Intent

Add the first common-store layer for Philadelphia / South Jersey so postal civic
signal can be compared against everyday food-errand structure.

## Changes

- Added a Pennsylvania / New Jersey Overture grocery extract for selected
  regional and national grocery brands.
- Added a conservative review query and reviewed grocery fixture.
- Added the Philadelphia / South Jersey anchor-field grocery summary query, CSV,
  and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-grocery-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-grocery-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-grocery-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-grocery-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-grocery-summary.sql`
- `reports/ret-philadelphia-anchor-field-grocery-summary.csv`
- `reports/ret-philadelphia-anchor-field-grocery-summary.md`

## Result

The Pennsylvania / New Jersey grocery review fixture validates with 799
packet-ready rows after excluding 33 service or office false positives. Five of
the eight Philadelphia / South Jersey fields show multi-brand grocery-grid
signal. Conshohocken / Plymouth Meeting is a grocery service field, Camden
Waterfront / Cooper is a single grocery anchor, and King of Prussia is checked
absent for this exact grocery chain set inside the bounded field.

## Next

Add Philadelphia / South Jersey mass retail across the same eight targets so the
stack can separate dense grocery/service fields from big-box and superregional
mall fields.
