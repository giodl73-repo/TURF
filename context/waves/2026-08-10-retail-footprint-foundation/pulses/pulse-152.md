# Pulse 152: Philadelphia QSR Sidecar

Date: 2026-08-13

## Intent

Add Philadelphia / South Jersey QSR sidecar signal across the same eight fields
to test daily-trip and corridor texture after the five core pre-scale layers.

## Changes

- Added a Pennsylvania / New Jersey Overture QSR extract for McDonald's,
  Burger King, Wendy's, and Taco Bell.
- Added a conservative review query and reviewed QSR fixture.
- Added the Philadelphia / South Jersey anchor-field QSR summary query, CSV,
  and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-qsr-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-qsr-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-qsr-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-qsr-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-qsr-summary.sql`
- `reports/ret-philadelphia-anchor-field-qsr-summary.csv`
- `reports/ret-philadelphia-anchor-field-qsr-summary.md`

## Result

The Pennsylvania / New Jersey QSR review fixture validates with 1,814
packet-ready rows after excluding two brand false positives. Northeast
Roosevelt is the only four-brand dense QSR grid. South Philadelphia and Cherry
Hill / Moorestown are multi-brand QSR corridors. Center City, University City,
King of Prussia, Conshohocken / Plymouth Meeting, and Camden carry QSR
service-node signal.

## Next

Add Philadelphia / South Jersey auto-parts sidecar signal, then generate the
sixth-metro pre-scale field stack.
