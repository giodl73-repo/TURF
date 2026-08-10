# TURF Product Plan

## Positioning

TURF is a public retail territory intelligence atlas. It answers practical
questions about how chains divide markets: which brand owns a city, which
metros are split, where two chains form a border, where one chain mirrors
another, and where white space remains.

## First wedge

Home improvement is the first category because Home Depot and Lowe's are large,
well-known, geographically comparable chains. The first useful output is a
market packet that summarizes store counts, city dominance, catchment overlap,
and contested boundaries.

## Core users

- Retail market analysts comparing chain footprints.
- Franchise and real-estate teams looking for white space.
- Operators studying competitor coverage.
- Researchers and journalists explaining commercial geography.

## Initial capabilities

1. Normalize public POI rows into stable brand/store records.
2. Summarize brand counts by city, state, county, CBSA, and urban area.
3. Assign population or places to nearest stores using distance first, then
   drive time once routing inputs are approved.
4. Detect contested cities and border zones where rival catchments overlap.
5. Emit CSV, JSON, SVG, and GeoJSON packets for downstream review.

## Source policy

Preferred seed sources are open and reproducible datasets such as Overture Maps
Places plus public Census/TIGER/ACS layers. Commercial POI datasets can be
supported as user-supplied inputs, but licensed raw data must not be committed.
Official store directories are validation references only unless their terms
allow automated collection and redistribution.

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
