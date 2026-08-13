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
cargo run -p turf-cli -- ret-place-spacing-summary auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- suggest-ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
cargo run -p turf-cli -- summarize-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v0.csv
cargo run -p turf-cli -- anchor-profile-v0 reports\ret-north-seattle-anchor-modifiers.csv reports\ret-north-seattle-enclave-profile.csv reports\ret-atlanta-district-anchor-profile.csv reports\ret-atlanta-anchor-pressure-audit.csv
cargo run -p turf-cli -- summarize-anchor-profile reports\ret-anchor-profile-v0.csv
cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v1.csv
cargo run -p turf-cli -- summarize-anchor-profile reports\ret-anchor-profile-v1.csv
duckdb -c ".read queries/overture-qsr-washington-2026-07-22.sql"
duckdb -c ".read queries/overture-qsr-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-auto-parts-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-mass-retail-washington-2026-07-22.sql"
duckdb -c ".read queries/overture-grocery-washington-2026-07-22.sql"
duckdb -c ".read queries/overture-mass-retail-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-grocery-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-grocery-illinois-2026-07-22.sql"
duckdb -c ".read queries/overture-drugstore-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-drugstore-washington-2026-07-22.sql"
duckdb -c ".read queries/overture-drugstore-illinois-2026-07-22.sql"
duckdb -c ".read queries/overture-mass-retail-illinois-2026-07-22.sql"
duckdb -c ".read queries/overture-retail-complex-washington-2026-07-22.sql"
duckdb -c ".read queries/overture-retail-complex-georgia-2026-07-22.sql"
duckdb -c ".read queries/overture-retail-complex-illinois-2026-07-22.sql"
duckdb -c ".read queries/overture-retail-complex-washington-anchor-fields-2026-07-22.sql"
duckdb -c ".read queries/overture-post-office-washington-anchor-fields-2026-07-22.sql"
python scripts\fetch_osm_post_offices.py --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13
python scripts\fetch_osm_post_offices.py --target-id cumberland-vinings --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-post-office-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --retries 2 --request-timeout-seconds 30 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type library --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-library-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
python scripts\fetch_osm_civic.py --facility-type library --target-id buckhead-lenox-phipps --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-library-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 2 --request-timeout-seconds 30 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type transit_center --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-transit-center-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
python scripts\fetch_osm_civic.py --facility-type transit_center --target-id perimeter-wide --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-transit-center-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type park --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-park-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
python scripts\fetch_osm_civic.py --facility-type park --target-id buckhead-lenox-phipps --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-park-atlanta-buckhead-lenox-phipps.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type bank_credit_union --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-bank-credit-union-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
python scripts\fetch_osm_civic.py --facility-type bank_credit_union --target-id cumberland-vinings --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-bank-credit-union-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-dollar-store-tacoma-mall.csv --source-date 2026-08-13 --retries 3
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id camp-creek --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-dollar-store-atlanta-camp-creek.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type gas_convenience --target-id bellevue-core --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-gas-bellevue.csv --source-date 2026-08-13 --retries 2
python scripts\fetch_osm_civic.py --facility-type gas_convenience --target-id decatur-emory --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\osm-gas-convenience-atlanta-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type gym --target-id bellevue-core --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-gym-bellevue-core.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type gym --target-id north-point-wide --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-gym-atlanta-north-point-wide.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type hardware --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-hardware-tacoma-mall.csv --source-date 2026-08-13 --retries 3
python scripts\fetch_osm_civic.py --facility-type hardware --target-id buckhead-lenox-phipps --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-hardware-atlanta-buckhead-lenox-phipps.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
python scripts\fetch_osm_civic.py --facility-type laundromat --target-id tacoma-mall --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\tmp-laundromat-tacoma-mall.csv --source-date 2026-08-13 --retries 3 --request-timeout-seconds 30
python scripts\fetch_osm_civic.py --facility-type laundromat --target-id cumberland-vinings --targets fixtures\geography\ret-atlanta-anchor-field-targets.csv --output fixtures\civic\tmp-laundromat-atlanta-cumberland-vinings.csv --source-date 2026-08-13 --retries 1 --request-timeout-seconds 25 --endpoint https://overpass.kumi.systems/api/interpreter
duckdb -c ".read queries/ret-washington-anchor-field-post-office-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-post-office-summary.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-post-office-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-library-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-library-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-transit-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-transit-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-park-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-park-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-civic-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-bank-credit-union-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-bank-credit-union-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-pharmacy-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-dollar-store-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-hardware-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-laundromat-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-atlanta-pre-scale-readiness.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-pharmacy-summary.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-mass-retail-summary.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-grocery-summary.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-retail-complex-summary.sql"
duckdb -c ".read queries/ret-chicago-pre-scale-field-stack.sql"
duckdb -c ".read queries/ret-washington-anchor-field-dollar-store-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-gas-convenience-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-gas-convenience-summary.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-gym-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-hardware-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-laundromat-summary.sql"
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-auto-parts-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- drilldown-metro-review 42660 fixtures\stores\overture-qsr-washington-review-2026-07-22.csv fixtures\geography\washington-qsr-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv fixtures\geography\georgia-qsr-zcta-county-primary-2020.csv fixtures\geography\georgia-qsr-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-georgia-packet-ready.csv
duckdb -c ".read queries/ret-profile-v0-metro-comparison.sql"
duckdb -c ".read queries/ret-profile-v0-place-capacity-matrix.sql"
duckdb -c ".read queries/ret-profile-v0-place-spacing-summary.sql"
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
duckdb -c ".read queries/ret-north-seattle-anchor-modifiers.sql"
duckdb -c ".read queries/ret-atlanta-anchor-modifiers.sql"
duckdb -c ".read queries/ret-atlanta-district-anchor-profile.sql"
duckdb -c ".read queries/ret-anchor-prediction-audit.sql"
duckdb -c ".read queries/ret-atlanta-anchor-pressure-audit.sql"
duckdb -c ".read queries/ret-edge-city-mall-rule-audit.sql"
duckdb -c ".read queries/ret-anchor-profile-v0.sql"
duckdb -c ".read queries/ret-anchor-profile-v1.sql"
duckdb -c ".read queries/ret-anchor-profile-v1-delta.sql"
duckdb -c ".read queries/ret-anchor-profile-v1-examples.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
duckdb -c ".read queries/ret-washington-retail-complex-coverage.sql"
duckdb -c ".read queries/ret-washington-anchor-field-targets.sql"
duckdb -c ".read queries/ret-atlanta-anchor-field-targets.sql"
duckdb -c ".read queries/ret-chicago-anchor-field-targets.sql"
duckdb -c ".read queries/ret-washington-anchor-field-candidates-from-statewide.sql"
duckdb -c ".read queries/ret-washington-anchor-field-candidate-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-reviewed-complexes.sql"
duckdb -c ".read queries/ret-washington-anchor-field-review-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-profile.sql"
duckdb -c ".read queries/overture-bellevue-core-anchor-complexes-2026-07-22.sql"
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
spacing for curated RET place targets. The `ret-place-spacing-summary` command
aggregates those rows into place-level spacing features.

The `suggest-ret-place-spacing` command generates place RET candidates using
those spacing features as supporting evidence.

The `validate-restaurant-targets` and `summarize-restaurant-targets` commands
check the next restaurant expansion sequence: QSR first, then fast casual, then
casual dining.

The `validate-anchor-profile` command checks the RET Anchor Profile v0 CSV
contract before anchor modifiers are consumed by later reports or CLI commands.

The `anchor-profile-v0` command emits that same profile contract from checked
intermediate anchor reports.

The `summarize-anchor-profile` command reads Anchor Profile v0 and reports
counts by modifier, geography scope, and region.

The first QSR acquisition query is:
`queries\overture-qsr-washington-2026-07-22.sql`.

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

The restaurant expansion sequence is:
`docs\restaurant-chain-expansion.md`.

The Washington QSR Overture acquisition gate is:
`docs\research\overture-qsr-washington-extraction-2026-07-22.md`.

The first Washington QSR Puget Sound report is:
`reports\qsr-seattle-puget-sound.md`.

The first Atlanta QSR comparison report is:
`reports\qsr-atlanta-comparison.md`.

The first auto-parts comparison report is:
`reports\auto-parts-seattle-puget-sound.md`.

The first Atlanta auto-parts comparison report is:
`reports\auto-parts-atlanta-comparison.md`.

The first cross-category spread comparison is:
`reports\washington-category-spread-comparison.md`.

RET, Retail Enclave Typology, is introduced in:
`docs\ret-taxonomy.md`.

RET anchor modifiers are documented in:
`docs\ret-anchor-modifiers.md`.

The first rule-based RET candidate readout is:
`reports\ret-metro-candidate-readout.md`.

The first RET candidate evaluation is:
`reports\ret-metro-candidate-evaluation.md`.

The first place-level RET candidate evaluation is:
`reports\ret-place-candidate-evaluation.md`.

The first same-place RET competitor-spacing readout is:
`reports\ret-place-spacing-readout.md`.

The first spacing-aware place candidate evaluation is:
`reports\ret-place-spacing-candidate-evaluation.md`.

The first neutral RET profile contract is:
`docs\ret-profile-v0.md`.

The first RET Profile v0 metro comparison is:
`reports\ret-profile-v0-readout.md`.

The first RET Profile v0 place capacity matrix is:
`reports\ret-profile-v0-place-capacity-readout.md`.

The first Seattle/Atlanta RET capacity synthesis is:
`reports\ret-seattle-atlanta-capacity-synthesis.md`.

The first cross-region anchor prediction audit is:
`reports\ret-anchor-prediction-audit.md`.

The first Atlanta anchor pressure audit is:
`reports\ret-atlanta-anchor-pressure-audit.md`.

The first edge-city mall rule audit is:
`reports\ret-edge-city-mall-rule-audit.md`.

The first integrated anchor profile is:
`reports\ret-anchor-profile-v0.md`.

The second integrated anchor profile is:
`reports\ret-anchor-profile-v1.md`.

The RET Anchor Profile v1 delta report is:
`reports\ret-anchor-profile-v1-delta.md`.

The RET Anchor Profile v1 examples report is:
`reports\ret-anchor-profile-v1-examples.md`.

The Anchor Field Context v0 dimension report is:
`reports\ret-anchor-field-context-dimensions.md`.

The Washington Anchor Field Context v0 report is:
`reports\ret-washington-anchor-field-context-v0.md`.

The Washington Anchor Field Context archetype report is:
`reports\ret-washington-anchor-field-context-archetypes.md`.

The Washington anchor-field bank / credit union readout is:
`reports\ret-washington-anchor-field-bank-credit-union-summary.md`.

The Washington anchor-field dollar-store readout is:
`reports\ret-washington-anchor-field-dollar-store-summary.md`.

The Washington anchor-field gas / convenience readout is:
`reports\ret-washington-anchor-field-gas-convenience-summary.md`.

The Washington anchor-field gym readout is:
`reports\ret-washington-anchor-field-gym-summary.md`.

The Washington anchor-field hardware readout is:
`reports\ret-washington-anchor-field-hardware-summary.md`.

The Washington anchor-field laundromat readout is:
`reports\ret-washington-anchor-field-laundromat-summary.md`.

The Washington retail-complex source coverage audit is:
`reports\ret-washington-retail-complex-coverage.md`.

The Washington anchor-field extraction targets are:
`reports\ret-washington-anchor-field-targets.md`.

The Atlanta anchor-field context scale targets are:
`reports\ret-atlanta-anchor-field-targets.md`.

The Chicago anchor-field type-discovery targets are:
`reports\ret-chicago-anchor-field-targets.md`.

The Chicago anchor-field post-office readout is:
`reports\ret-chicago-anchor-field-post-office-summary.md`.

The Chicago anchor-field gym source-gate readout is:
`reports\ret-chicago-anchor-field-gym-summary.md`.

The Chicago anchor-field pharmacy readout is:
`reports\ret-chicago-anchor-field-pharmacy-summary.md`.

The Chicago anchor-field mass-retail readout is:
`reports\ret-chicago-anchor-field-mass-retail-summary.md`.

The Chicago anchor-field grocery readout is:
`reports\ret-chicago-anchor-field-grocery-summary.md`.

The Chicago anchor-field retail-complex readout is:
`reports\ret-chicago-anchor-field-retail-complex-summary.md`.

The Chicago pre-scale field stack readout is:
`reports\ret-chicago-pre-scale-field-stack.md`.

The Atlanta anchor-field post-office readout is:
`reports\ret-atlanta-anchor-field-post-office-summary.md`.

The Atlanta anchor-field library readout is:
`reports\ret-atlanta-anchor-field-library-summary.md`.

The Atlanta anchor-field park readout is:
`reports\ret-atlanta-anchor-field-park-summary.md`.

The Atlanta anchor-field transit readout is:
`reports\ret-atlanta-anchor-field-transit-summary.md`.

The Atlanta anchor-field civic context summary is:
`reports\ret-atlanta-anchor-field-civic-context-summary.md`.

The Atlanta anchor-field bank / credit union readout is:
`reports\ret-atlanta-anchor-field-bank-credit-union-summary.md`.

The Atlanta anchor-field gas / convenience readout is:
`reports\ret-atlanta-anchor-field-gas-convenience-summary.md`.

The Atlanta anchor-field pharmacy readout is:
`reports\ret-atlanta-anchor-field-pharmacy-summary.md`.

The Atlanta anchor-field dollar-store source-gate readout is:
`reports\ret-atlanta-anchor-field-dollar-store-summary.md`.

The Atlanta anchor-field hardware readout is:
`reports\ret-atlanta-anchor-field-hardware-summary.md`.

The Atlanta anchor-field laundromat readout is:
`reports\ret-atlanta-anchor-field-laundromat-summary.md`.

The Atlanta anchor-field gym readout is:
`reports\ret-atlanta-anchor-field-gym-summary.md`.

The Atlanta anchor-field context summary is:
`reports\ret-atlanta-anchor-field-context-summary.md`.

The Atlanta pre-scale readiness decision is:
`reports\ret-atlanta-pre-scale-readiness.md`.

The Washington anchor-field retail-complex extraction plan is:
`docs\research\overture-retail-complex-washington-anchor-fields-extraction-2026-07-22.md`.

The first Washington anchor-field extraction attempt is:
`reports\ret-washington-anchor-field-extraction-attempt.md`.

The Washington anchor-field local candidate summary is:
`reports\ret-washington-anchor-field-candidate-summary.md`.

The Washington anchor-field reviewed complex summary is:
`reports\ret-washington-anchor-field-review-summary.md`.

The Washington anchor-field profile impact readout is:
`reports\ret-washington-anchor-field-profile.md`.

The Bellevue core anchor acquisition gap note is:
`reports\ret-bellevue-core-anchor-acquisition-gap.md`.

The first Seattle/Atlanta RET spacing readout is:
`reports\ret-seattle-atlanta-spacing-readout.md`.

The first North Seattle / South Snohomish enclave profile is:
`reports\ret-north-seattle-enclave-profile.md`.

The first North Seattle anchor-modifier readout is:
`reports\ret-north-seattle-anchor-modifiers.md`.

The first Atlanta anchor-modifier readout is:
`reports\ret-atlanta-anchor-modifiers.md`.

The first Atlanta district anchor profile is:
`reports\ret-atlanta-district-anchor-profile.md`.

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

The next category sequence is QSR restaurants, then Target/Walmart, then fast
casual, casual dining, and Costco as later contrast layers.

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
