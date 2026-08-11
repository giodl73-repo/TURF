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
cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv
cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv
cargo run -p turf-cli -- catchment fixtures\brands\home-improvement-pois.csv fixtures\geography\demand-points.csv
cargo run -p turf-cli -- market-packet "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv
cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json
cargo run -p turf-cli -- validate-stores fixtures\stores\national-store-intake-sample.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-postal-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-county-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- ring-metro-review 12060 33.7490 -84.3880 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 42660 fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 42660 fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- validate-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- summarize-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- suggest-ret-metro auto_parts fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- evaluate-ret-metro fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-washington-metro-candidates.csv
cargo run -p turf-cli -- validate-ret-place-targets fixtures\geography\ret-puget-sound-place-targets.csv
cargo run -p turf-cli -- suggest-ret-place auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-candidates.csv
cargo run -p turf-cli -- ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-georgia-packet-ready.csv
```

The command reads a CSV with `brand`, `store_id`, `city`, `state`, `latitude`,
and `longitude`, then prints brand counts and city-level dominance. It is a
small contract for the larger product: public chain locations go in, market
footprint evidence comes out.

The `place-context` command inspects the foundational geography contract. It
keeps postal city, ZIP Code, ZCTA, municipality, county, Census place, lived
place, and market area separate, then reports where those layers disagree.

The `catchment` command assigns public demand points to their nearest fixture
store by straight-line distance. It is an auditable baseline for later drive-time
and gravity models, not a claim about corporate territories.

The `market-packet` command combines those contracts into a first readable
report. The checked-in example is `reports\home-improvement-atlanta.md`, with a
JSON companion for dashboards and future atlas generation.

The `validate-packet` command checks a market-packet JSON file against TURF's
current required-field contract without adding a runtime schema dependency.

The `validate-stores` command checks the stricter national chain store intake
contract. Home Depot and Lowe's national coverage must pass that source and
license gate before TURF generates broader packets.

The `validate-store-review` command checks the reviewed candidate layer that
marks extracted rows as `packet_ready`, `needs_review`, or `exclude`.

The `summarize-review` command reads the reviewed candidate layer, reports
review status counts, and summarizes the packet-ready footprint.

The `summarize-postal-review` command groups packet-ready rows by source postal
code and a ZIP-derived `zcta_candidate` key for later Census joins. TURF keeps
that key separate from confirmed Census ZCTA geometry.

The `summarize-county-review` command joins packet-ready postal rows to a
Census ZCTA-to-county context fixture and reports primary county dominance.

The `summarize-metro-review` command joins county-enriched rows to a Census
CBSA/micropolitan context fixture and reports metro-level dominance.

The `drilldown-metro-review` command focuses one CBSA and reports brand count,
county dominance, and nearest opposite-brand spacing.

The `ring-metro-review` command classifies one CBSA by distance from an explicit
core point and reports brand mix by ring.

The `validate-ret` and `summarize-ret` commands check and summarize Retail
Enclave Typology examples.

The `suggest-ret-metro` command derives conservative RET candidate labels from
packet-ready metro store features.

The `evaluate-ret-metro` command compares generated metro RET candidates with
hand-reviewed RET examples.

The `suggest-ret-place` command derives RET candidate labels for a curated
place target list, including ferry or barrier context. The `evaluate-ret-place`
command scores those generated place candidates against hand-reviewed RET
examples.

The `ret-place-spacing` command reports same-place nearest opposite-brand
spacing for curated RET place targets.

The first approved national acquisition path is Overture Places, documented in
`docs\overture-home-improvement-acquisition.md`.

The first bounded live candidate extract is Georgia:
`fixtures\stores\overture-home-improvement-georgia-2026-07-22.csv`.

The first reviewed candidate layer is:
`fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv`.

The first statewide reviewed footprint report is:
`reports\home-improvement-georgia.md`.

The first Puget Sound ferry-aware read is:
`reports\home-improvement-seattle-puget-sound.md`.

The first chain expansion decision is:
`docs\chain-expansion-sequence.md`.

The first auto-parts comparison report is:
`reports\auto-parts-seattle-puget-sound.md`.

The first cross-category spread comparison is:
`reports\washington-category-spread-comparison.md`.

RET, Retail Enclave Typology, is introduced in:
`docs\ret-taxonomy.md`.

The first rule-based RET candidate readout is:
`reports\ret-metro-candidate-readout.md`.

The first RET candidate evaluation is:
`reports\ret-metro-candidate-evaluation.md`.

The first place-level RET candidate evaluation is:
`reports\ret-place-candidate-evaluation.md`.

The first same-place RET competitor-spacing readout is:
`reports\ret-place-spacing-readout.md`.

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

The next category sequence is auto parts first, then Target/Walmart, then
Costco as a later regional destination-store contrast.

## Data policy

TURF starts with open or explicitly licensed inputs. Official store locators can
be used for manual validation only when their terms allow it. The repo should
not scrape private APIs or imply it has access to unpublished corporate region
boundaries. The Home Depot / Lowe's acquisition gate is documented in
`docs\research\home-improvement-source-policy.md`.

## Non-goals

- TURF does not claim to know a chain's internal districts unless they are
  published by that chain.
- TURF does not replace commercial mobility, real-estate, or site-selection
  platforms.
- TURF does not store raw proprietary POI datasets in the public repo.
- TURF does not own operational territory balancing; TERRAIN owns that planner.

## License

MIT License. Copyright (c) Gio Della-Libera.
