# 07 Finance Node Retry Closeout

The finance retry used an alternate Overpass endpoint after the primary
endpoint and Kumi endpoint timed out on small bank / credit-union test boxes.
The successful retry is intentionally node-only. It is strong enough to promote
observed finance presence, but it should not be used as a complete count of all
bank / credit-union mapped objects because ways and relations are outside this
retry profile.

## Results

The retry resolved all six formerly source-gated finance fields:

- Midway / Ford City: 1 retained row, 1 operator, observed signal.
- Downtown LA / Koreatown / Mid-Wilshire: 60 retained rows, dense signal.
- Long Beach / Lakewood: 40 retained rows, dense signal.
- Ontario Mills / Rancho Cucamonga: 13 retained rows, observed signal.
- Riverside / Tyler / Corona: 9 retained rows, observed signal.
- West LA / Century City / Culver City: 34 retained rows, dense signal.

Across the retry, A.4 retained 148 packet-ready node rows and excluded six
ATM-only or non-bank finance-name candidates.

## Classification Effect

The promoted A.4 classification now has:

- 12 depth-ready confirmed service-quarter grids,
- 2 finance-core controls,
- 2 asymmetry controls,
- 0 remaining finance-retry fields.

The old source-gated classification remains useful as a record of the first
Overpass pass. The node-retry classification is the current promoted A.4 read.

## Reusable Tables

- `tables/osm-finance-standardization-node-retry-review-2026-08-16.csv`
- `tables/osm-finance-standardization-node-retry-source-gates-2026-08-16.csv`
- `tables/finance-standardization-node-retry-summary-2026-08-16.csv`
- `tables/service-quarter-finance-node-retry-classification-2026-08-16.csv`

## Next Gate

Before adding broad local professional-service categories, define a stricter
false-positive contract for legal, accounting, real-estate, notary, consulting,
loan, mortgage, and generic business-service rows. Those categories are useful
for service-quarter texture, but they are noisier than bank / credit-union,
insurance, and tax-prep evidence.

## Claim Boundary

The retry establishes public finance-footprint presence only. It does not
establish income, wealth, credit quality, lending, assets, customer identity,
demand, catchment, trade area, professional quality, or individual behavior.
