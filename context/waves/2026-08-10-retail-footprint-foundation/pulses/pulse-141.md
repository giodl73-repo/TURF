# Pulse 141: Chicago Auto-Parts Sidecar

Date: 2026-08-13

## Intent

Backfill Chicago auto parts across the same seven anchor-field targets and
compare the trade/car-service signal against the Chicago QSR sidecar.

## Changes

- Added Illinois auto-parts Overture extraction and conservative review queries.
- Generated reviewed Illinois auto-parts fixtures.
- Added a seven-field Chicago auto-parts sidecar summary.
- Added a Chicago QSR / auto-parts comparison readout.

## Evidence

- `queries/overture-auto-parts-illinois-2026-07-22.sql`
- `queries/overture-auto-parts-illinois-review-2026-07-22.sql`
- `fixtures/stores/overture-auto-parts-illinois-2026-07-22.csv`
- `fixtures/stores/overture-auto-parts-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-auto-parts-summary.sql`
- `reports/ret-chicago-anchor-field-auto-parts-summary.csv`
- `reports/ret-chicago-anchor-field-auto-parts-summary.md`
- `reports/ret-chicago-qsr-auto-parts-comparison.md`

## Result

Illinois auto parts validates with 616 packet-ready rows after excluding six
rows. Ford City is the only Chicago multi-brand auto-service corridor in the
seven-field target set. Woodfield / Schaumburg is a smaller auto-service node,
Old Orchard has one auto-parts anchor, and the core/inner-neighborhood fields
are checked absent for this sidecar.

## Next

The next pulse should start Dallas/Fort Worth sidecar backfill with QSR, then
Dallas/Fort Worth auto parts before any core profile promotion decision.
