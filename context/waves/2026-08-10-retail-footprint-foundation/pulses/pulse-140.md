# Pulse 140: Chicago QSR Sidecar

Date: 2026-08-13

## Intent

Backfill the first standardized sidecar layer by adding Chicago QSR across the
existing seven Chicago anchor-field targets.

## Changes

- Added Illinois QSR Overture extraction and conservative review queries.
- Generated reviewed Illinois QSR fixtures.
- Added a seven-field Chicago QSR sidecar summary.
- Recorded the sidecar role review.

## Evidence

- `queries/overture-qsr-illinois-2026-07-22.sql`
- `queries/overture-qsr-illinois-review-2026-07-22.sql`
- `fixtures/stores/overture-qsr-illinois-2026-07-22.csv`
- `fixtures/stores/overture-qsr-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-qsr-summary.sql`
- `reports/ret-chicago-anchor-field-qsr-summary.csv`
- `reports/ret-chicago-anchor-field-qsr-summary.md`

## Result

Illinois QSR validates with 1,397 packet-ready rows after excluding two brand
false positives. Chicago field-level QSR separates the sidecar terrain:
Lincoln Park / Lakeview and Midway / Ford City are four-brand dense QSR grids;
Loop / River North and Woodfield / Schaumburg are multi-brand corridors; Old
Orchard remains a single-QSR-anchor field.

## Next

The next pulse should backfill Chicago auto parts using the same seven target
fields before moving to Dallas/Fort Worth sidecars.
