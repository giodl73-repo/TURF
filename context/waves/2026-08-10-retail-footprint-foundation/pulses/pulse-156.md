# Pulse 156: Philadelphia Bank / Credit Union Layer

Date: 2026-08-13

## Intent

Add Philadelphia / South Jersey bank / credit union signal as the first
post-scale-decision everyday finance layer.

## Changes

- Ran OSM/Overpass bank / credit union acquisition across all eight
  Philadelphia / South Jersey fields using target-level retries.
- Combined reviewed target outputs into one Philadelphia fixture.
- Added the anchor-field bank / credit union summary query, CSV, and report.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `fixtures/civic/osm-bank-credit-union-philadelphia-anchor-fields-review-2026-08-13.csv`
- `queries/ret-philadelphia-anchor-field-bank-credit-union-summary.sql`
- `reports/ret-philadelphia-anchor-field-bank-credit-union-summary.csv`
- `reports/ret-philadelphia-anchor-field-bank-credit-union-summary.md`

## Result

The reviewed fixture has 161 packet-ready rows across all eight fields. Center
City / Market East, Northeast Roosevelt, and Cherry Hill / Moorestown have
dense finance-service signal. University City, King of Prussia, Conshohocken /
Plymouth Meeting, South Philadelphia, and Camden have observed but lighter
finance-service signal.

## Next

Backfill bank / credit union across the remaining pre-scale metros or add
Philadelphia gas / convenience as the car-trip contrast if finance backfill is
blocked by source stability.
