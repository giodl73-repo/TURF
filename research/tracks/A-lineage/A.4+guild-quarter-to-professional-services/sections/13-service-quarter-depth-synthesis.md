# 13 Service-Quarter Depth Synthesis

This synthesis closes the first A.4 depth pass. It combines the reusable layers
already built for finance, tax prep, insurance, legal/accounting/notary,
real-estate, and loan/mortgage evidence into a single service-quarter texture
classification.

The synthesis uses only public-footprint evidence:

- bank / credit-union finance fabric,
- tax-prep paperwork-service fabric,
- insurance agency-service fabric,
- structured legal/accounting/notary texture,
- structured real-estate office texture,
- bounded loan/mortgage finance-edge texture.

Consulting and generic business-service rows are not added. Their expected
false-positive load is higher than their current value for the central-spine
claim.

## Results

The 12 depth-ready fields resolve into five synthesis classes:

- 6 full professional service-quarter texture fields,
- 1 full professional service-quarter texture field with an optional
  loan/mortgage tile caveat,
- 1 professional service-quarter field with a structured real-estate profile
  gap,
- 2 paperwork/professional core fields with a bounded loan/mortgage profile
  gap,
- 2 base service-quarter / light-texture control fields with real-estate-only
  extension beyond the finance, tax-prep, and insurance base.

The full service-quarter texture fields are:

- Arlington / Grand Prairie,
- Long Beach / Lakewood,
- Ontario Mills / Rancho Cucamonga,
- Riverside / Tyler / Corona,
- South Bay / Torrance,
- Cherry Hill / Moorestown.

Downtown LA / Koreatown / Mid-Wilshire also has full texture, but keeps one
optional loan/mortgage tile caveat from the northeast retry tile.

Northeast Roosevelt keeps a structured real-estate profile gap. Loop / River
North and West LA / Century City / Culver City keep bounded loan/mortgage
profile gaps. Kitsap Mall / Silverdale and Midway / Ford City remain useful as
lighter service-quarter controls: finance, tax prep, insurance, and structured
real-estate texture are observed, while LAN and loan/mortgage profiles are
checked absent only for the bounded profiles used here.

## Reusable Table

- `tables/service-quarter-depth-synthesis-2026-08-16.csv`

## Role Decision

A.4 is strong enough to stand as the central-spine service-quarter module. The
next useful work is not another broad professional-service scrape; it is either
cross-module synthesis across A.1 to A.4 or a very narrow follow-up tied to a
specific claim.

## Claim Boundary

The synthesis supports a public service-quarter terrain classification by
functional analogy only. It does not establish income, wealth, credit quality,
insurance risk, tax status, assets, business quality, professional competence,
protected traits, demand, catchment, transaction volume, customer identity, or
individual behavior.
