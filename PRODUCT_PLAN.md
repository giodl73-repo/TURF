# TURF Product Plan

## Positioning

TURF is a public retail territory intelligence atlas. It answers practical
questions about how chains divide markets: which brand owns a city, which
metros are split, where two chains form a border, where one chain mirrors
another, and where white space remains.

## First wedge

The first learning wedge is postal/address geography because it shows how the
country is already divided for location, delivery, and place naming. ZIP/postal
addressability is foundational: for many practical purposes it defines where
American life happens even when city, town, county, metro, or other government
boundaries do not line up. The first retail wedge is home improvement because
Home Depot and Lowe's are large, well-known, geographically comparable chains.
The first useful retail output is a market packet that summarizes store counts,
city dominance, catchment overlap, and contested boundaries.

## Core users

- Retail market analysts comparing chain footprints.
- Franchise and real-estate teams looking for white space.
- Operators studying competitor coverage.
- Researchers and journalists explaining commercial geography.

## Initial capabilities

1. Normalize public POI rows into stable brand/store records.
2. Produce a place-context packet that separates address, delivery locality,
   ZIP/ZCTA, lived place, municipality, county, Census place, CBSA, urban area,
   and market.
3. Summarize brand counts by city, state, county, CBSA, and urban area.
4. Assign population or places to nearest stores using distance first, then
   drive time once routing inputs are approved.
5. Detect contested cities and border zones where rival catchments overlap.
6. Emit CSV, JSON, SVG, and GeoJSON packets for downstream review.

## Source policy

Preferred seed sources are open and reproducible datasets such as Overture Maps
Places plus public Census/TIGER/ACS layers. Commercial POI datasets can be
supported as user-supplied inputs, but licensed raw data must not be committed.
Official store directories are validation references only unless their terms
allow automated collection and redistribution.

Postal/address sources need the same treatment. TURF may study postal concepts,
document source policy, and use open or user-supplied address fixtures, but it
must not redistribute restricted USPS data or treat ZIP Codes as authoritative
polygons when the available input is a ZCTA or other approximation.

The starting business hypothesis is that major companies commonly use postal or
postal-derived geographies, including ZIP, ZIP3, ZCTA, carrier-route-like
layers, or address-derived trade areas, as one baseline for planning. TURF must
test and qualify that hypothesis by source, industry, and use case instead of
turning it into an unsupported universal claim.

## Learning roadmap

The roadmap in `docs\learning-roadmap.md` sequences the project as a learning
atlas:

1. Addressable America.
2. Administrative America.
3. Movement America.
4. Commercial America.
5. Rivalry America.

## Shared-system boundary

- FLETCH is planned for fetch/cache manifests and source registries.
- PROOF is planned for Markdown and generated report validation.
- CROP and PEBBLE are planned for portable context and report packets.
- RLINE and METIS-CORE are planned only if repeated graph or partition kernels
  emerge from TURF and TERRAIN together.
- TERRAIN remains the operational territory planner; TURF owns public footprint
  inference and market atlas outputs.

## Risks

- Public POI coverage can be incomplete or stale.
- Postal, Census, civic, and retail geographies can disagree in ways users may
  mistake for data errors.
- Store locators may restrict automated use.
- City boundaries are not market boundaries; TURF must report uncertainty.
- Drive-time APIs can dominate runtime and cost if not cached carefully.

## Foundation validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv
git diff --check
```
