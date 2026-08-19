# 06 Finance Standardization Pass

This pass standardizes bank / credit-union evidence for the Chicago, Dallas,
and Los Angeles fields in the first A.4 service-quarter target set.

The fetch used OSM / Overpass with an explicit research User-Agent and retained
ATM-only exclusions as exclusions rather than finance rows. The pass queried 10
selected targets, produced 141 raw review rows, retained 140 packet-ready
bank / credit-union rows, and excluded one ATM-only candidate.

## Results

Four target fields fetched usable finance evidence:

- Loop / River North: 63 bank / credit-union rows, 20 operators, dense signal.
- Arlington / Grand Prairie: 19 retained rows, 14 operators, observed signal.
- South Bay / Torrance: 50 rows, 31 operators, dense signal.
- Old Orchard / Skokie: 8 rows, 8 operators, observed signal.

Six target fields were source-gated by Overpass errors, not evidence absences:

- Midway / Ford City: 504 Gateway Timeout.
- Downtown LA / Koreatown / Mid-Wilshire: 429 Too Many Requests.
- Long Beach / Lakewood: 429 Too Many Requests.
- Ontario Mills / Rancho Cucamonga: 429 Too Many Requests.
- Riverside / Tyler / Corona: 504 Gateway Timeout.
- West LA / Century City / Culver City: 504 Gateway Timeout.

The combined classification now has six depth-ready service-quarter fields:
Kitsap Mall / Silverdale, Loop / River North, Arlington / Grand Prairie, South
Bay / Torrance, Cherry Hill / Moorestown, and Northeast Roosevelt.

## Reusable Tables

- `tables/osm-finance-standardization-review-2026-08-16.csv`
- `tables/osm-finance-standardization-source-gates-2026-08-16.csv`
- `tables/finance-standardization-summary-2026-08-16.csv`
- `tables/service-quarter-finance-standardized-classification-2026-08-16.csv`

## Next Gate

Retry the six source-gated finance fields with smaller boxes or alternate
Overpass endpoints before adding noisier professional-service categories such
as legal, accounting, real-estate, notary, or generic business services.

## Claim Boundary

Finance evidence is public footprint evidence only. It does not establish
income, wealth, credit quality, lending, assets, customer identity, demand,
catchment, trade area, professional quality, or individual behavior.
