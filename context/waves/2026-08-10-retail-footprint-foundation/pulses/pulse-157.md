# Pulse 157: Philadelphia National Tax-Prep Layer

Date: 2026-08-13

## Intent

Add a national professional-services sidecar using recognizable tax-prep
chains rather than generic local accounting offices.

## Changes

- Added a Pennsylvania / New Jersey Overture tax-prep extract for H&R Block,
  Jackson Hewitt, and Liberty Tax.
- Added a conservative review query and reviewed fixture.
- Added the Philadelphia / South Jersey anchor-field tax-prep summary query,
  CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-tax-prep-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-tax-prep-summary.sql`
- `reports/ret-philadelphia-anchor-field-tax-prep-summary.csv`
- `reports/ret-philadelphia-anchor-field-tax-prep-summary.md`

## Result

The Pennsylvania / New Jersey tax-prep review fixture validates with 873
packet-ready rows after excluding 12 brand false positives and three duplicate
candidates. Northeast Roosevelt and Cherry Hill / Moorestown are multi-brand
tax-prep service grids. Center City and South Philadelphia are tax-prep service
nodes, while University City, King of Prussia, Conshohocken / Plymouth Meeting,
and Camden have single tax-prep anchors.

## Next

Decide whether national tax prep becomes a standard professional-services
sidecar, then test the same layer in another metro before promoting it to the
cross-metro comparison pattern.
