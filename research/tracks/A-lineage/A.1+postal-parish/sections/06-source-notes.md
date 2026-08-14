# Source Notes

This section adds the first public-source gate for the A.1 module. It supports
postal/addressability and ZIP/ZCTA boundary discipline, not broad historical
claims.

## USPS Addressability

USPS public guidance supports treating addresses and ZIP Codes as operational
delivery infrastructure:

- USPS ZIP Code Lookup accepts a corporate or residential street address, city,
  and state to return a specific ZIP Code and standardized address format.
- USPS addressing guidance treats correct ZIP Code and ZIP+4 information as
  part of mailpiece address quality for some mail classes and workflows.
- USPS new-construction guidance states that local governments create new
  construction street addresses and report them to USPS for inclusion in
  delivery routes.

Module use:

- TURF may describe USPS infrastructure as a practical addressability system.
- TURF should not describe USPS as the sole creator of local addresses.
- TURF should keep local-government address creation, USPS delivery routing,
  and Census statistical geography separate.

References:

- `usps_zip_lookup`
- `usps_new_construction_addresses`
- `usps_carrier_route_mailings`

## Census ZIP/ZCTA Boundary Discipline

Census public guidance supports TURF's ZIP/ZCTA distinction:

- ZCTAs are Census-created approximate area representations of USPS five-digit
  ZIP Code service areas.
- Census creates ZCTAs using whole Census blocks for statistical reporting.
- Not every USPS ZIP Code has a corresponding ZCTA.
- ZCTAs and ZIP Codes are not the same concept; ZIP Codes are postal delivery
  route infrastructure, while ZCTAs are statistical approximations.

Module use:

- TURF may use ZCTA-derived keys as public statistical context when their
  limits are stated.
- TURF may not treat a ZCTA as an official USPS ZIP Code boundary.
- TURF may not treat ZIP or ZCTA geography as a municipality, neighborhood, or
  corporate territory.

References:

- `census_zcta_guidance`
- `census_zcta_glossary`
- `census_zip_zcta_not_same`
- `census_zcta_relationship_files`

## Current Claim Upgrade

With these sources, the A.1 module can upgrade one narrow claim:

> Postal/address infrastructure and Census ZCTA approximations together form a
> practical public addressability and statistical-context stack for TURF, as
> long as USPS delivery infrastructure and Census statistical approximations are
> kept separate.

The module still cannot claim:

- post offices historically define American neighborhoods,
- ZIP Codes are official polygons,
- ZCTAs are USPS boundaries,
- retail terrain is caused by postal infrastructure,
- postal geography explains customer identity or behavior.
