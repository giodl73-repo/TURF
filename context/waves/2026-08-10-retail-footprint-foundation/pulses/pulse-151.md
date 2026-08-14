# Pulse 151: Philadelphia Retail-Complex Layer

Date: 2026-08-13

## Intent

Add target-limited retail-complex confirmation across the same Philadelphia /
South Jersey fields to test structural mall, shopping-center, plaza, and
retail-district evidence after postal, grocery, mass-retail, and pharmacy
layers.

## Changes

- Added a Pennsylvania / New Jersey Overture retail-complex extract.
- Added a candidate inspection query for the eight Philadelphia / South Jersey
  anchor fields.
- Added a conservative review query and reviewed retail-complex fixture.
- Added the Philadelphia / South Jersey anchor-field retail-complex summary
  query, CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-retail-complex-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/ret-philadelphia-anchor-field-retail-complex-candidates.sql`
- `queries/overture-retail-complex-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-review-2026-07-22.csv`
- `reports/ret-philadelphia-anchor-field-retail-complex-candidates.csv`
- `queries/ret-philadelphia-anchor-field-retail-complex-summary.sql`
- `reports/ret-philadelphia-anchor-field-retail-complex-summary.csv`
- `reports/ret-philadelphia-anchor-field-retail-complex-summary.md`

## Result

The Pennsylvania / New Jersey retail-complex review fixture validates with 18
packet-ready named retail structures. King of Prussia, Northeast Roosevelt, and
Cherry Hill / Moorestown are confirmed mall-complex fields. Conshohocken /
Plymouth Meeting is a confirmed mall anchor. South Philadelphia is a plaza and
shopping-center service field. Center City and University City carry urban
district/plaza evidence. Camden Waterfront / Cooper remains checked absent
because the visible candidate rows are medical, civic, university, and
waterfront facility names rather than retail-complex structure.

## Next

Add Philadelphia / South Jersey QSR sidecar signal, then auto-parts sidecar
signal, before generating the sixth-metro pre-scale field stack.
