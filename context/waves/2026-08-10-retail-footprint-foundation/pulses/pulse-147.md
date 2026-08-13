# Pulse 147: Philadelphia Post-Office Layer

Date: 2026-08-13

## Intent

Start the Philadelphia / South Jersey sixth-metro stack with the original
postal/civic TURF layer.

## Changes

- Fetched OSM/Overpass post-office candidates across all eight Philadelphia /
  South Jersey anchor-field targets.
- Reviewed private shipping counters out of the post-office layer.
- Added an explicit source-gate fixture for the pass.
- Added the Philadelphia / South Jersey post-office summary query, CSV, and
  report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `fixtures/civic/osm-post-office-philadelphia-anchor-fields-review-2026-08-13.csv`
- `fixtures/civic/osm-post-office-philadelphia-anchor-fields-source-gates-2026-08-13.csv`
- `queries/ret-philadelphia-anchor-field-post-office-summary.sql`
- `reports/ret-philadelphia-anchor-field-post-office-summary.csv`
- `reports/ret-philadelphia-anchor-field-post-office-summary.md`

## Result

All eight Philadelphia / South Jersey fields have observed post-office signal
and no source-gated targets in this pass. Center City / Market East and
Northeast Philadelphia / Roosevelt Boulevard are the densest postal civic
fields. Cherry Hill / Moorestown provides immediate South Jersey postal signal
after excluding FedEx/UPS private counters.

## Next

Add the first common-store layer for Philadelphia / South Jersey, starting with
grocery, then mass retail, pharmacy, retail complex, QSR, and auto parts under
the sixth-metro sidecar contract.
