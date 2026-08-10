# TURF Data Policy

TURF must keep public and licensed data boundaries explicit.

## Allowed seed inputs

- Open POI layers with redistribution-compatible licenses.
- User-supplied CSV exports where the user controls the license.
- Census, TIGER, ACS, county, CBSA, urban-area, and other public geography
  layers with documented source and vintage.
- Small hand-authored fixtures for tests and examples.

## Validation-only inputs

Official store directories and store locators can be used to check coverage
when their terms permit manual inspection. They should not be scraped, cached,
or redistributed unless the source policy explicitly allows it.

Home Depot and Lowe's national acquisition is governed by
`docs/research/home-improvement-source-policy.md`.

## Disallowed repository contents

- Raw proprietary POI datasets.
- Undocumented scraped locator responses.
- Secret API keys, paid-data exports, or customer-provided market files.
- Claims that inferred catchments are official corporate districts.

## Required report language

Use "inferred catchment," "public footprint," "dominance," "contested market,"
or "white space" for TURF outputs. Use "official region" only when a chain
publishes the boundary or district assignment.
