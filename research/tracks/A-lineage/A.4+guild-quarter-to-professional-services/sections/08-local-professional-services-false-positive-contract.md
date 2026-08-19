# 08 Local Professional Services False-Positive Contract

A.4 can now move beyond bank / credit-union, tax prep, and insurance evidence,
but local professional-service categories need stricter rules before they enter
the sidecar. These categories are useful service-quarter texture, but they are
noisier because they often mix public-facing offices with headquarters, back
offices, tenant directories, online-only services, and unrelated corporate
entities.

## Inclusion Rule

Promote a local professional-service row only when it has a named, physical,
public-facing service point inside the bounded target field. A row needs a name
or operator, a coordinate or address, a category-specific service function, a
source, a review status, and a review reason.

## Exclusion Rule

Exclude or defer rows that are generic offices, headquarters-only locations,
corporate departments, ambiguous tenant-directory entries, unnamed offices,
online-only services, or service claims without a local physical service point.

## Category Rules

The reusable category contract is:
`tables/local-professional-services-false-positive-contract.csv`.

The reusable review-status contract is:
`tables/local-professional-services-review-status-contract.csv`.

Categories are ordered by review risk:

- Lower risk: legal, accounting, notary.
- Medium risk: real estate, loan / mortgage.
- High risk: consulting and generic business service.

Loan and mortgage offices must stay separate from bank / credit-union finance
fabric. They can add edge texture later, but they should not be folded into the
core finance count.

Generic business-service rows are deferred by default. They should enter A.4
only after a later rule can separate public-facing service storefronts from
ordinary office tenants.

## Next Query Order

The next evidence pass should be narrow:

1. Legal/accounting/notary as a paperwork-and-advice texture pilot.
2. Real estate as a separate property-transaction texture pilot.
3. Loan/mortgage only as a separate finance-edge texture pilot.
4. Consulting and generic business service only after the first three pilots
   prove that review rules are stable.

## Claim Boundary

Local professional-service evidence is public footprint evidence only. It does
not establish professional quality, customer identity, income, wealth, credit,
insurance risk, legal status, business health, demand, catchment, protected
traits, or individual behavior.
