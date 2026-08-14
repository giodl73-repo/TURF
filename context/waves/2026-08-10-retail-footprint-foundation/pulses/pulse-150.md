# Pulse 150: Philadelphia Pharmacy Layer

Date: 2026-08-13

## Intent

Add exact-brand drugstore pharmacy signal across the same Philadelphia / South
Jersey fields to test health-errand texture after postal, grocery, and
mass-retail layers.

## Changes

- Added a Pennsylvania / New Jersey Overture drugstore extract for CVS Pharmacy,
  Walgreens, Rite Aid, and Good Neighbor Pharmacy.
- Added a conservative review query and reviewed drugstore fixture.
- Added the Philadelphia / South Jersey anchor-field pharmacy summary query,
  CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/overture-drugstore-pennsylvania-new-jersey-2026-07-22.sql`
- `queries/overture-drugstore-pennsylvania-new-jersey-review-2026-07-22.sql`
- `fixtures/stores/overture-drugstore-pennsylvania-new-jersey-2026-07-22.csv`
- `fixtures/stores/overture-drugstore-pennsylvania-new-jersey-review-2026-07-22.csv`
- `queries/ret-philadelphia-anchor-field-pharmacy-summary.sql`
- `reports/ret-philadelphia-anchor-field-pharmacy-summary.csv`
- `reports/ret-philadelphia-anchor-field-pharmacy-summary.md`

## Result

The Pennsylvania / New Jersey drugstore review fixture validates with 498
packet-ready rows after excluding 111 clinic, specialty, beauty, photo,
hospital, provider, and brand/name false-positive rows. Center City / Market
East is the only multi-brand health-errand field. University City, Northeast
Roosevelt, Conshohocken / Plymouth Meeting, and Cherry Hill / Moorestown have
CVS-only observed pharmacy signal. King of Prussia, South Philadelphia Sports /
Port, and Camden Waterfront / Cooper are checked absent for this exact-brand
layer.

## Next

Add Philadelphia / South Jersey retail-complex confirmation across the same
eight targets so King of Prussia, Cherry Hill / Moorestown, Center City, and the
other fields can be structurally typed before the sidecar layers are added.
