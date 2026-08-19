# 12 Loan/Mortgage Finance-Edge Pilot

This pilot adds a separate loan/mortgage edge layer after the real-estate pass.
It stays outside the bank / credit-union finance fabric and outside structured
real-estate office texture.

The query is intentionally bounded:

- OSM `name`, `operator`, or `brand` regex only,
- loan, mortgage, lending, funding, NMLS, or home-loan signal required,
- bank and credit-union branches excluded,
- ATM-only rows excluded,
- payday, check-cashing, title-loan, pawn, and similar short-term cash-service
  candidates excluded,
- real-estate rows excluded unless they carry a loan/mortgage signal.

## Results

The first pass reviewed 12 OSM rows across 12 depth-ready service-quarter
fields:

- 10 packet-ready rows,
- 2 excluded rows,
- 0 rows missing coordinates,
- 4 field-level source gates: Downtown LA / Koreatown / Mid-Wilshire, Long
  Beach / Lakewood, South Bay / Torrance, and Cherry Hill / Moorestown.

Those four source-gated fields were retried as four tiles each. The retry
recovered:

- 16 reviewed rows,
- 12 packet-ready rows,
- 4 exclusions,
- 0 rows missing coordinates,
- 1 source-gated tile in Downtown LA / Koreatown / Mid-Wilshire.

The promoted loan/mortgage classification now has:

- 8 fields with observed loan/mortgage edge texture,
- 4 fields checked absent for the bounded regex profile,
- 0 field-level source gates,
- 1 optional tile retry caveat for Downtown LA / Koreatown / Mid-Wilshire.

The checked-absent fields are Kitsap Mall / Silverdale, Midway / Ford City, Loop
/ River North, and West LA / Century City / Culver City. These are profile
results only; they are not broad lender-absence claims.

## Reusable Tables

- `tables/osm-local-professional-services-loan-mortgage-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-loan-mortgage-pilot-summary-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-loan-mortgage-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-loan-mortgage-pilot-classification-2026-08-16.csv`

## Next Gate

A.4 now has enough category depth to synthesize the service-quarter layer
before adding noisier consulting or generic business-service rows. Consulting
and generic business-service evidence should remain deferred unless a concrete
claim needs them.

## Claim Boundary

The pilot establishes public footprint evidence for named loan, mortgage,
lending, funding, NMLS, or home-loan office signal only. It does not establish
credit quality, approval likelihood, income, wealth, risk, demand, catchment,
borrower identity, protected traits, transaction volume, professional quality,
or individual behavior.
