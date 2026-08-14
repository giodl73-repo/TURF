# Source Policy and Claim Boundary

## Source Policy

Allowed evidence:

- repo-generated TURF reports and CSVs,
- public Census geography relationship files,
- public OSM/Overpass civic rows already reviewed into TURF fixtures,
- public USPS/Census documentation cited in `references.bib`,
- public historical sources cited before historical claims are expanded.

Blocked evidence and claims:

- no restricted USPS address files,
- no scraped official retailer locator data unless terms allow reuse,
- no proprietary POI or mobility data in the public repo,
- no unsourced claims about company districts,
- no claims about individual customers, residents, protected traits, income,
  risk, mobility behavior, or neighborhood quality.

## Claim Boundary

This module may claim:

- postal/address infrastructure is a public addressability layer,
- post offices can be observed as civic service points in selected TURF fields,
- ZIP/ZCTA-derived keys are useful analysis context when their limits are
  stated,
- postal civic evidence can reinforce or qualify a TURF field type.

This module may not claim:

- ZIP Codes or ZCTAs are official neighborhoods,
- post offices define culture, behavior, identity, or customer base,
- retail chains intentionally reproduce historical parish systems,
- commercial footprints are official corporate territories,
- field families are legal, municipal, Census, or USPS boundaries.

## Modeling Boundary

Postal evidence is not a catchment assignment. TURF should continue to separate
observed footprint, bounded field, source gate, checked absence, analogy, and
future model hypothesis.
