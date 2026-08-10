# Postal and ZCTA Source Review

## Question

How should TURF treat ZIP Codes, ZCTAs, postal addressability, and company use
of postal-derived geographies before building a place-context contract?

## Decision

Adopt postal/address geography as TURF's first learning layer, but keep four
concepts separate in every contract:

1. `postal_address` - the formatted address used for delivery and lookup.
2. `zip_code` - the USPS delivery code associated with an address or route.
3. `zcta` - the Census statistical area approximating the distribution of
   ZIP Codes.
4. `market_area` - TURF's inferred commercial geography, never assumed to be
   the same as any postal or Census layer.

Treat "major companies use ZIP/ZCTA/postal-derived geography" as a testable
hypothesis. It is plausible and strategically important, but TURF should record
source evidence by company, industry, geography type, and use case before
promoting it to a claim.

## Findings

### PZ-001 - Postal addressability is operational infrastructure

Source: USPS Publication 28, Postal Addressing Standards:
https://pe.usps.com/text/pub28/welcome.htm

Implication: TURF can safely frame postal addressability as a national operating
layer for locating deliverable places, provided it cites USPS standards and does
not redistribute restricted USPS datasets. Address parsing, normalization, and
city/state/ZIP handling should be modeled as address evidence, not as municipal
truth.

Confidence: high.

### PZ-002 - USPS lookup is address-based and not proof of occupancy

Source: USPS ZIP Code lookup guidance:
https://postalpro.usps.com/zip-code-lookup

Implication: TURF should not infer that a person, company, or store exists at an
address merely because a ZIP lookup succeeds. A ZIP can help locate or validate
an address format, but POI existence needs a separate source.

Confidence: high.

### PZ-003 - ZCTAs are not ZIP Codes

Source: Census ZCTA guidance:
https://www.census.gov/programs-surveys/geography/guidance/geo-areas/zctas.html

Implication: TURF must keep ZIP and ZCTA fields separate. ZIP Codes are
delivery-oriented and point/route associated; ZCTAs are Census-created areal
representations built for statistical publication. Reports should say "ZCTA"
when using Census polygons and "ZIP Code" only when the source is postal or
address-level.

Confidence: high.

### PZ-004 - ZCTA relationship files are the bridge to public geography

Source: Census 2020 ZCTA relationship file layouts:
https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2020-zcta-record-layout.html

Implication: TURF can use Census relationship files to connect ZCTAs to
counties, county subdivisions, places, tracts, and blocks. That gives a clean
public path for the first `place-context` packet without needing restricted USPS
source data.

Confidence: high.

### PZ-005 - TIGER/Line can supply public geography, not business presence

Source: Census TIGER/Line technical documentation:
https://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2025/TGRSHP2025_TechDoc.pdf

Implication: TIGER/Line and related Census files are appropriate for civic,
statistical, and ZCTA geometry. They do not prove retail presence or company
territory. TURF should join them with separate POI evidence.

Confidence: high.

### PZ-006 - Overture Places is the first candidate open POI layer

Source: Overture Places guide:
https://docs.overturemaps.org/guides/places/

Implication: Overture Places is a suitable first research target for brand/store
points because it is designed around POIs, categories, addresses, and brand-like
location entities. TURF still needs a source-policy review for license, fields,
coverage, and freshness before automated ingestion.

Confidence: medium-high.

## Adopt Now

- Use `zip_code` and `zcta` as separate fields in the upcoming
  `place-context` contract.
- Add `source_family`, `source_url`, `source_vintage`, `rights_status`, and
  `geometry_kind` to any geography or POI-derived report.
- Model postal identity as lived-place evidence, not as a replacement for
  municipality, county, Census place, CBSA, or market area.
- Maintain a ZIP/ZCTA business-use hypothesis register with status values:
  `observed`, `plausible`, `contradicted`, and `unknown`.

## Prototype Next

- A hand-authored `place-context` fixture for three places where postal city,
  municipality, county, Census place, and ZCTA diverge.
- A small ZCTA-to-place/county relationship report using public Census
  relationship files.
- A first Overture Places field inventory for home improvement and QSR chains.

## Defer

- Automated USPS data acquisition.
- Claims about every major company's internal territory basis.
- Drive-time catchments from paid or remote APIs.
- Store-locator scraping.

## Non-Goals

- TURF does not define ZIP Codes as polygons.
- TURF does not treat ZCTAs as official USPS delivery territories.
- TURF does not claim internal corporate region knowledge from public
  footprints.
- TURF does not commit raw restricted postal, commercial POI, or locator data.
