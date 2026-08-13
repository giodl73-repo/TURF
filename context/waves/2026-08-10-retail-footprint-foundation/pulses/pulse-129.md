# Pulse 129: Los Angeles Post-Office Layer

Date: 2026-08-13

## Intent

Add the first pre-scale layer for Los Angeles / Inland Empire anchor fields,
starting with post office as the civic anchor for the postal-terrain thesis.

## Changes

- Added reviewed OSM post-office rows for bounded LA fields.
- Promoted USPS-like civic post-office rows in Downtown LA / Koreatown /
  Mid-Wilshire and South Bay / Torrance.
- Excluded private shipping and mail counters from the civic layer.
- Preserved five Overpass connection timeouts as source gates, not absences.
- Generated the LA post-office anchor-field summary report.

## Evidence

- `fixtures/civic/osm-post-office-los-angeles-anchor-fields-review-2026-08-13.csv`
- `fixtures/civic/osm-post-office-los-angeles-anchor-fields-source-gates-2026-08-13.csv`
- `queries/ret-los-angeles-anchor-field-post-office-summary.sql`
- `reports/ret-los-angeles-anchor-field-post-office-summary.csv`
- `reports/ret-los-angeles-anchor-field-post-office-summary.md`

## Result

LA now has its first bounded pre-scale context layer. Dense LA core and South
Bay show observed postal civic signal. Glendale/Burbank, West LA, Inland Empire,
Riverside/Corona, and Long Beach/Lakewood remain source-gated until retry or
alternate open-source resolution.
