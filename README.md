# TURF

Public retail territory intelligence.

TURF is a Rust CLI and library for turning public point-of-interest, Census,
road, and demographic layers into auditable retail footprint evidence. The
first wedge is simple: compare major chains in a market, infer catchments and
contested borders from public locations, then report which brands dominate,
split, mirror, or avoid each other.

## First command

Run the built-in home improvement fixture:

```powershell
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv
```

The command reads a CSV with `brand`, `store_id`, `city`, `state`, `latitude`,
and `longitude`, then prints brand counts and city-level dominance. It is a
small contract for the larger product: public chain locations go in, market
footprint evidence comes out.

## Product thesis

Retail chains leave a public geography behind. Store locations, roads, cities,
urban areas, Census geography, and competitor footprints can reveal how brands
implicitly divide the United States even when their internal district maps are
private. TURF should make that geography inspectable without pretending to know
unpublished corporate territories.

TURF learns that geography from the ground up. Postal addressing is the first
lesson: addresses, ZIPs, post offices, and delivery-locality conventions are
the practical national location system that often defines American daily life
whether or not a city, town, annexation, or government boundary lines up with
it. The roadmap in `docs\learning-roadmap.md` starts with that "original TURF"
layer before moving to roads, catchments, and retail rivalry.

## Development phases

1. **Addressable America** - postal/address geography, place identity, and the
   difference between mailing, civic, Census, and market boundaries.
2. **Footprint Foundation** - data policy, POI intake contract, and first
   brand/city summary fixture.
3. **Catchment Lines** - nearest-distance and drive-time catchments for each
   store and brand.
4. **Contested Markets** - city, county, CBSA, and urban-area dominance maps.
5. **Corridor Rivalry** - highway and suburban edge patterns across competing
   chains.
6. **National Atlas** - reproducible national reports for selected retail and
   QSR categories.

## Data policy

TURF starts with open or explicitly licensed inputs. Official store locators can
be used for manual validation only when their terms allow it. The repo should
not scrape private APIs or imply it has access to unpublished corporate region
boundaries.

## Non-goals

- TURF does not claim to know a chain's internal districts unless they are
  published by that chain.
- TURF does not replace commercial mobility, real-estate, or site-selection
  platforms.
- TURF does not store raw proprietary POI datasets in the public repo.
- TURF does not own operational territory balancing; TERRAIN owns that planner.

## License

MIT License. Copyright (c) Gio Della-Libera.
