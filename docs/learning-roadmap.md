# TURF Learning Roadmap

TURF should teach the geography before it ranks the chains. The first lesson is
that the United States is already divided into many overlapping systems of
service, delivery, identity, and commerce. Retail territory intelligence only
makes sense after those layers are visible.

## Thesis

The postal system is the original public TURF layer. Addresses, ZIP Codes, post
offices, delivery routes, and city/state naming conventions create the practical
geography people use to find homes, businesses, schools, jobs, stores, and each
other. Whether a place is incorporated, unincorporated, annexed, renamed,
ignored by a metro definition, or split across government boundaries, the postal
address often becomes the lived criterion of American place.

TURF should treat ZIP/postal addressability as foundational because it is how
daily life becomes locatable. Do not treat postal geography as the same thing as
municipal, Census, market, or corporate geography. The point is to learn where
those systems agree, diverge, override each other in practice, and create
surprising borders.

## Core Hypothesis

Major companies likely use ZIP Codes, ZCTAs, ZIP3 groupings, carrier-route-like
geographies, or derived postal/address layers as one of their baseline units for
territory planning, trade-area analysis, logistics, marketing, franchise
coverage, and reporting. TURF should make that hypothesis testable.

The product should not assert that every company uses ZCTAs, or that ZCTAs are
the same as ZIP Codes. The stronger claim is more useful and easier to prove:
postal/address geography is a common foundational layer, and companies then
combine it with roads, demographics, stores, demand, franchise rights, delivery
cost, and internal operating regions.

Evidence TURF should collect:

- Public methodology notes from retailers, QSR chains, real-estate tools, and
  logistics vendors.
- Source schemas that expose ZIP, ZIP3, ZCTA, postal city, or address fields.
- Market reports that aggregate by ZIP/ZCTA, county, CBSA, DMA, trade area, or
  custom territory.
- Cases where company geography departs from postal geography because of roads,
  stores, franchise contracts, delivery cost, or local identity.

## Learning Ladder

### 1. Addressable America

Question: How does a place become findable?

Inputs to study:

- Street addresses and address ranges.
- ZIP Codes and ZIP Code Tabulation Areas.
- Post offices, preferred city names, acceptable city names, and delivery
  locality conventions.
- Census address and TIGER geography concepts.

Outputs:

- Address-geography primer.
- Postal vs. municipal place examples.
- Glossary separating address, delivery, city, ZIP, ZCTA, county, and metro.
- "Lived place" notes where postal identity matters more than city hall,
  incorporation status, or a regional-planning boundary.
- ZIP/ZCTA business-use hypothesis register with evidence status: observed,
  plausible, contradicted, or unknown.

### 2. Administrative America

Question: What official boundaries does a place belong to?

Inputs to study:

- States, counties, county subdivisions, incorporated places, Census designated
  places, tracts, block groups, blocks, CBSAs, and urban areas.
- Local edge cases where mailing city, municipality, county, and Census place do
  not match.

Outputs:

- Boundary comparison fixture.
- Place identity report that shows every known public boundary for one point.
- First `place-context` packet contract.
- Explicit disagreements between postal city, legal municipality, Census place,
  county, and metro assignment.

### 3. Movement America

Question: What places are close in practice?

Inputs to study:

- Roads, travel-time approximations, corridors, barriers, and adjacency.
- Distance-first catchments before paid or remote drive-time APIs.

Outputs:

- Nearest-node and nearest-store examples.
- Corridor and barrier notes.
- Catchment uncertainty fields.

### 4. Commercial America

Question: How do public business footprints reveal market structure?

Inputs to study:

- Open or explicitly licensed POI datasets.
- User-supplied chain/store CSVs.
- Validation-only official store directories where terms allow inspection.

Outputs:

- Brand/store normalization contract.
- City, ZIP/ZCTA, county, CBSA, and urban-area footprint summaries.
- Dominant, contested, mirrored, avoided, and white-space market labels.

### 5. Rivalry America

Question: Where do chains create borders?

Inputs to study:

- Home Depot vs. Lowe's.
- AutoZone/O'Reilly/NAPA/Advance auto-parts grids.
- Target vs. Walmart.
- Best Buy vs. Walmart/Target electronics adjacency.
- McDonald's/Burger King/Wendy's QSR grids.
- Category-specific chains where stores follow malls, highways, suburbs,
  downtowns, campuses, industrial corridors, or rural county seats.

Outputs:

- Rivalry packet.
- Catchment overlap report.
- Border-zone and white-space atlas pages.

## Chain Expansion Sequence

After the Home Depot/Lowe's foundation, TURF should add auto parts first, then
Target/Walmart, and treat Costco as a later regional destination-store contrast.

Auto parts teaches denser neighborhood and corridor service geography.
Target/Walmart then tests a bigger mass-retail distinction: which places are
Walmart places, Target places, both, or neither. Costco is still useful,
especially in Puget Sound, but it should follow because its lower store count
pushes the problem toward wider destination catchments.

The current decision note is `docs/chain-expansion-sequence.md`.

## First Roadmap Wave

The first roadmap wave should not download everything. It should produce a
small, inspectable learning pack:

1. Pick three test places where postal, municipal, county, and Census geography
   differ.
2. Add hand-authored fixtures for those places.
3. Emit a `place-context` report that lists the layers without pretending one is
   authoritative for every purpose.
4. Connect those places to the home-improvement fixture so chain dominance can
   be read against postal and civic geography.
5. Mark which layer is most relevant for lived identity, delivery, governance,
   statistics, and retail market analysis.

## Non-Goals

- Do not redistribute USPS data or official store-locator data without an
  explicit source policy allowing it.
- Do not claim ZIP Codes are polygons unless the source is explicitly a polygon
  approximation such as ZCTA.
- Do not collapse mailing city, municipality, county, Census place, lived place,
  and retail market into one field.
- Do not skip source-policy research before adding automated fetches.
