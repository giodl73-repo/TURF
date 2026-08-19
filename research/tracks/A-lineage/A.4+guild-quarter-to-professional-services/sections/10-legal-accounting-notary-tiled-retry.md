# 10 Legal / Accounting / Notary Tiled Retry

This retry closes the field-level source gates left by the structured
legal/accounting/notary pilot. It keeps the same structured OSM profile:

- `office=lawyer`,
- `office=accountant`,
- `office=notary`.

The only change is query shape. Long Beach / Lakewood and Northeast Roosevelt
were split into four tiles each to reduce endpoint load. This preserves
comparability with the first pilot while allowing partial-tile evidence to be
kept separate from field-level absence claims.

## Results

The tiled retry reviewed 19 rows:

- 19 packet-ready rows,
- 0 exclusions,
- 0 rows missing coordinates,
- 13 legal rows,
- 5 accounting rows,
- 1 notary row.

Field outcomes:

- Long Beach / Lakewood: 18 packet-ready rows, including 13 legal, 4
  accounting, and 1 notary row. Three of four tiles fetched; the southwest tile
  remained source-gated, so the count is conservative.
- Northeast Roosevelt: 1 packet-ready accounting row. All four tiles fetched.

The promoted LAN classification now has no field-level source gates:

- 3 dense legal/accounting texture fields,
- 7 observed legal/accounting/notary texture fields,
- 2 structured-tag checked-absent fields.

Kitsap Mall / Silverdale and Midway / Ford City remain checked absent only for
the structured OSM legal/accounting/notary tag profile. This is not a broad
absence claim for local professional services.

## Reusable Tables

- `tables/osm-local-professional-services-lan-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-lan-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-lan-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-lan-tiled-retry-classification-2026-08-16.csv`

## Next Gate

Keep A.4 in depth mode. The next category should be a real-estate pilot kept
separate from loan/mortgage and generic business-service rows.

## Claim Boundary

The retry establishes structured public professional-service footprint only. It
does not establish professional quality, clientele, income, wealth, credit,
legal status, case type, business health, demand, catchment, protected traits,
or individual behavior.
