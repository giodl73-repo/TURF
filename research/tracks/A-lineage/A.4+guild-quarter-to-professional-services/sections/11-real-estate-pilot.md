# 11 Real-Estate Pilot

This pilot adds a separate real-estate texture layer after the
legal/accounting/notary pass. It uses the A.4 false-positive contract and keeps
loan/mortgage, leasing-only, and generic business-service rows outside the
real-estate count.

The query is intentionally conservative:

- structured OSM `office=estate_agent` only,
- no broad name-regex scraping,
- mortgage and lending names excluded,
- leasing-only and single-property management names excluded unless they carry
  an explicit brokerage / realty / realtor signal.

## Results

The first pass reviewed 71 OSM rows across 12 depth-ready fields:

- 61 packet-ready rows,
- 10 excluded rows,
- 0 rows missing coordinates,
- 1 field-level source gate: Long Beach / Lakewood.

Long Beach / Lakewood was then retried as four tiles. The retry recovered:

- 18 reviewed rows,
- 16 packet-ready rows,
- 2 exclusions,
- 0 rows missing coordinates,
- 1 source-gated tile, so the Long Beach count remains conservative.

The promoted real-estate classification now has:

- 11 fields with observed structured real-estate texture,
- 1 structured-tag checked-absent field: Northeast Roosevelt,
- 0 field-level source gates.

Northeast Roosevelt is checked absent only for the structured
`office=estate_agent` profile. This is not a broad real-estate service absence
claim.

## Reusable Tables

- `tables/osm-local-professional-services-real-estate-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-real-estate-pilot-summary-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-real-estate-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-real-estate-pilot-classification-2026-08-16.csv`

## Next Gate

Loan/mortgage should be the next pilot, but it must stay separate from bank /
credit-union finance fabric and from real-estate rows. It should be treated as
a finance-edge texture layer, not as a real-estate brokerage layer.

## Claim Boundary

The pilot establishes structured public real-estate office footprint only. It
does not establish housing price, wealth, buyer/renter identity, protected
traits, demand, catchment, transaction volume, professional quality, or
individual behavior.
