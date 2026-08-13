# Pulse 137: Los Angeles QSR Layer

Date: 2026-08-13

## Intent

Run the next post-LA scale gate: retry the five LA post-office source gates and
add a QSR sidecar layer across the same seven Los Angeles / Inland Empire
fields.

## Changes

- Added California QSR Overture extraction and conservative review queries.
- Generated reviewed California QSR fixtures.
- Added a seven-field LA / Inland Empire QSR summary.
- Recorded the LA post-office retry attempt and preserved the remaining source
  gates after endpoint failures.

## Evidence

- `queries/overture-qsr-california-2026-07-22.sql`
- `queries/overture-qsr-california-review-2026-07-22.sql`
- `fixtures/stores/overture-qsr-california-2026-07-22.csv`
- `fixtures/stores/overture-qsr-california-review-2026-07-22.csv`
- `queries/ret-los-angeles-anchor-field-qsr-summary.sql`
- `reports/ret-los-angeles-anchor-field-qsr-summary.csv`
- `reports/ret-los-angeles-anchor-field-qsr-summary.md`
- `reports/ret-los-angeles-post-office-retry-pass.md`

## Result

California QSR validates with 2,834 packet-ready rows after excluding three
brand false positives. Every selected LA / Inland Empire field has strong QSR
signal: five are four-brand dense QSR grids and two are three-brand
multi-brand QSR corridors.

The five post-office gates remain source-gated. A batch retry returned HTTP
504 from the Kumi Overpass endpoint, and split one-field retries timed out
against the main Overpass endpoint.

## Next

QSR confirms that the LA field labels persist across a high-frequency daily-trip
category. The next pulse should add auto parts as the trade/car-service sidecar
layer, while keeping LA postal gates blocked from final postal ranking until a
resolved civic source exists.
