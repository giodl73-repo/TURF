# Source Policy and Claim Boundary

## Source Policy

Allowed evidence:

- repo-generated TURF reports and CSVs,
- public post-office, Census, ZCTA, county, and place context sources,
- reviewed public POI layers for QSR, gas/convenience, dollar stores, grocery,
  pharmacy, and other everyday-service layers,
- A.1 source-boundary rules for USPS/Census distinctions.

Blocked evidence and claims:

- no restricted USPS address files,
- no proprietary POI, mobility, sales, or customer datasets,
- no claims about residents, protected traits, income, culture, behavior,
  vehicle ownership, spending, or neighborhood quality,
- no claim that absence from national-chain layers means absence of local
  service.

## Claim Boundary

This module may claim:

- a minimum postal parish is a candidate place type defined by sparse public
  footprint evidence,
- post-office-only and post-office-plus-one-stack classes are useful research
  hypotheses,
- checked absence and source gates must remain distinct,
- the current 43-field profile is insufficient for national smallest-parish
  claims.

This module may not claim:

- the smallest postal parish in the country before a national or sampled data
  pass exists,
- post offices alone define social community,
- a place with no national-chain evidence lacks local commerce,
- sparse footprint implies decline, poverty, isolation, or service inadequacy,
- ZIP, ZCTA, city, CDP, county, postal locality, and TURF field are
  interchangeable.

## Modeling Boundary

A.1b is a candidate-discovery module. It does not assign catchments, service
adequacy, drive-time access, or local importance.
