# Pulse 149: Philadelphia Mass-Retail Layer

Date: 2026-08-13

## Intent

Add Target / Walmart / Costco / Sam's Club mass-retail signal across the same
Philadelphia / South Jersey fields to separate grocery/postal service grids
from big-box anchor fields.

## Changes

- Added a Pennsylvania / New Jersey Overture mass-retail extract.
- Added a conservative review query and reviewed mass-retail fixture.
- Added the Philadelphia / South Jersey anchor-field mass-retail summary query,
  CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-mass-retail-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-mass-retail-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-mass-retail-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-mass-retail-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-mass-retail-summary.sql`
- `reports/ret-philadelphia-anchor-field-mass-retail-summary.csv`
- `reports/ret-philadelphia-anchor-field-mass-retail-summary.md`

## Result

The Pennsylvania / New Jersey mass-retail review fixture validates with 324
packet-ready rows after excluding 34 service false positives. Cherry Hill /
Moorestown is the only multi-brand big-box anchor among the eight Philadelphia /
South Jersey fields. Center City / Market East, King of Prussia, Northeast
Roosevelt, and South Philadelphia Sports / Port have single-brand big-box
anchors. University City, Conshohocken / Plymouth Meeting, and Camden Waterfront
are checked absent for this layer.

## Next

Add Philadelphia / South Jersey pharmacy signal across the same eight targets,
then retail-complex confirmation to test King of Prussia, Cherry Hill /
Moorestown, and Center City structure.
