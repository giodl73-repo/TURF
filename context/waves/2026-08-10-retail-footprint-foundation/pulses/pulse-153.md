# Pulse 153: Philadelphia Auto-Parts Sidecar

Date: 2026-08-13

## Intent

Add Philadelphia / South Jersey auto-parts sidecar signal across the same eight
fields to compare car-service corridor texture against QSR daily-trip texture.

## Changes

- Added a Pennsylvania / New Jersey Overture auto-parts extract for AutoZone,
  O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto Parts.
- Added a conservative review query and reviewed auto-parts fixture.
- Added the Philadelphia / South Jersey anchor-field auto-parts summary query,
  CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-auto-parts-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-auto-parts-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-auto-parts-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-auto-parts-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-auto-parts-summary.sql`
- `reports/ret-philadelphia-anchor-field-auto-parts-summary.csv`
- `reports/ret-philadelphia-anchor-field-auto-parts-summary.md`

## Result

The Pennsylvania / New Jersey auto-parts review fixture validates with 759
packet-ready rows after excluding 12 brand false positives and one duplicate
candidate. Northeast Roosevelt, South Philadelphia, and Cherry Hill /
Moorestown are multi-brand auto-service corridors. Center City, University
City, King of Prussia, Conshohocken / Plymouth Meeting, and Camden Waterfront
are checked absent for this sidecar.

## Next

Generate the Philadelphia / South Jersey pre-scale field stack and update the
cross-metro type-discovery profile.
