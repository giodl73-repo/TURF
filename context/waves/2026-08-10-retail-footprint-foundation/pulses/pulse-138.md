# Pulse 138: Los Angeles Auto-Parts Layer

Date: 2026-08-13

## Intent

Add auto parts as the trade and car-service sidecar layer for the same seven Los
Angeles / Inland Empire fields, then compare it against QSR saturation.

## Changes

- Added California auto-parts Overture extraction and conservative review
  queries.
- Generated reviewed California auto-parts fixtures.
- Added a seven-field LA / Inland Empire auto-parts summary.
- Added a QSR / auto-parts comparison readout.

## Evidence

- `queries/overture-auto-parts-california-2026-07-22.sql`
- `queries/overture-auto-parts-california-review-2026-07-22.sql`
- `fixtures/stores/overture-auto-parts-california-2026-07-22.csv`
- `fixtures/stores/overture-auto-parts-california-review-2026-07-22.csv`
- `queries/ret-los-angeles-anchor-field-auto-parts-summary.sql`
- `reports/ret-los-angeles-anchor-field-auto-parts-summary.csv`
- `reports/ret-los-angeles-anchor-field-auto-parts-summary.md`
- `reports/ret-los-angeles-qsr-auto-parts-comparison.md`

## Result

California auto parts validates with 1,308 packet-ready rows after excluding 14
rows. AutoZone and O'Reilly dominate the reviewed California layer; NAPA is
sparse and Advance Auto Parts has no packet-ready rows under the current exact
filter.

All seven selected LA fields have multi-brand auto-service corridor signal, but
Riverside / Tyler / Corona and Long Beach / Lakewood carry far deeper
auto-service density than the affluent West LA or Glendale / Burbank fields.

## Next

The next pulse should decide whether QSR and auto parts become standard
pre-scale sidecar dimensions. If yes, backfill them for Chicago/Dallas field
targets before changing the core cross-metro type-discovery profile or adding a
sixth metro.
