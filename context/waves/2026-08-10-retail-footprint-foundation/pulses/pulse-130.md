# Pulse 130: Los Angeles Mass-Retail Layer

Date: 2026-08-13

## Intent

Add a second Los Angeles / Inland Empire pre-scale layer that does not depend
on the post-office Overpass gates and tests Target/Walmart/Costco/Sam's Club
big-box anchor signal across the same seven bounded fields.

## Changes

- Added a California Overture Places mass-retail extract for Target, Walmart,
  Costco, and Sam's Club.
- Added a conservative California review layer that excludes attached
  departments, fuel, mobile, food court, grocery-format, and specialty service
  rows.
- Generated a Los Angeles / Inland Empire anchor-field mass-retail summary.
- Documented the Target-only versus multi-brand field split.

## Evidence

- `queries/overture-mass-retail-california-2026-07-22.sql`
- `queries/overture-mass-retail-california-review-2026-07-22.sql`
- `queries/ret-los-angeles-anchor-field-mass-retail-summary.sql`
- `fixtures/stores/overture-mass-retail-california-2026-07-22.csv`
- `fixtures/stores/overture-mass-retail-california-review-2026-07-22.csv`
- `reports/ret-los-angeles-anchor-field-mass-retail-summary.csv`
- `reports/ret-los-angeles-anchor-field-mass-retail-summary.md`

## Result

Downtown LA / Koreatown / Mid-Wilshire and West LA / Century City / Culver City
are Target-only fields in this layer. Glendale/Burbank, South Bay/Torrance,
Ontario/Rancho Cucamonga, Riverside/Tyler/Corona, and Long Beach/Lakewood carry
multi-brand mass-retail signal.
