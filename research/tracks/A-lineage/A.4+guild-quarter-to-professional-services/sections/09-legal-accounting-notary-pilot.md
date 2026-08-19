# 09 Legal / Accounting / Notary Pilot

This pilot applies the local professional-services false-positive contract to
the 12 depth-ready A.4 service-quarter grids.

The query is intentionally conservative. It uses structured OSM office tags
only:

- `office=lawyer`,
- `office=accountant`,
- `office=notary`.

It does not use broad name-regex scraping. That means checked-absent outcomes
are limited to this structured-tag query profile and should not be treated as
complete absence of local legal, accounting, or notary services.

## Results

The pass reviewed 173 OSM rows:

- 163 packet-ready rows,
- 10 excluded rows,
- 0 rows missing coordinates after geometry-centroid fallback,
- 146 packet-ready legal rows,
- 17 packet-ready accounting rows,
- 0 structured notary rows.

Field outcomes:

- Dense legal/accounting texture: Loop / River North, Downtown LA / Koreatown /
  Mid-Wilshire, West LA / Century City / Culver City.
- Observed legal/accounting texture: Arlington / Grand Prairie, Ontario Mills /
  Rancho Cucamonga, Riverside / Tyler / Corona, South Bay / Torrance, Cherry
  Hill / Moorestown.
- Structured-tag checked absent: Kitsap Mall / Silverdale, Midway / Ford City.
- Source-gated: Long Beach / Lakewood, Northeast Roosevelt.

The exclusions are doing useful work. The review contract rejected unnamed
office candidates and one accounting back-office/platform candidate while
preserving address-incomplete named offices as packet-ready rows when a
coordinate was present.

## Reusable Tables

- `tables/osm-local-professional-services-lan-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-lan-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-lan-pilot-summary-2026-08-16.csv`
- `tables/service-quarter-lan-pilot-classification-2026-08-16.csv`

## Next Gate

Retry Long Beach / Lakewood and Northeast Roosevelt for the same structured
legal/accounting/notary profile before broadening the source contract. After
that, the next depth layer should be a real-estate pilot kept separate from
loan/mortgage and generic business-service rows.

## Claim Boundary

The pilot establishes public footprint texture only. It does not establish
professional quality, clientele, income, wealth, credit, legal status, case
type, business health, demand, catchment, protected traits, or individual
behavior.
