# Pulse 160: Professional-Services Sidecar Comparison

Date: 2026-08-13

## Intent

Compare national tax-prep and national insurance sidecars across the 43-field
profile, then decide whether TURF needs another professional-services layer or
should move to a different contrast.

## Changes

- Added a cross-metro professional-services comparison query.
- Generated the 43-field comparison CSV.
- Added a comparison report deciding against immediate real estate brokerage.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/ret-cross-metro-professional-services-sidecar-comparison.sql`
- `reports/ret-cross-metro-professional-services-sidecar-comparison.csv`
- `reports/ret-cross-metro-professional-services-sidecar-comparison.md`
- `reports/ret-cross-metro-tax-prep-sidecar.csv`
- `reports/ret-cross-metro-insurance-sidecar.csv`

## Result

The comparison identifies 12 confirmed professional-services grids, 21
insurance-broad / tax-prep-light fields, eight light professional-services
nodes, one insurance-without-tax-prep field, and one tax-prep-without-insurance
field.

Tax prep is selective consumer professional-service signal. Insurance is broad
local agency/service fabric. Together they are enough to establish a
professional-services sidecar pattern without adding real estate brokerage yet.

## Next

Move to cross-metro gas / convenience as the car-trip contrast.
