# ZCTA County Context

TURF uses Census ZCTA relationship files as the first public bridge from
ZIP-derived candidate keys to county context.

## Source

- Census 2020 ZCTA relationship record layouts:
  https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2020-zcta-record-layout.html
- Census 2020 ZCTA5 to County relationship file:
  https://www2.census.gov/geo/docs/maps-data/data/rel2020/zcta520/tab20_zcta520_county20_natl.txt
- Census explanation PDF:
  https://www2.census.gov/geo/pdfs/maps-data/data/rel2020/zcta520/explanation_tab20_zcta520_county20_natl.pdf

## Contract

TURF's bounded county context fixture uses:

| Field | Meaning |
|---|---|
| `zcta_candidate` | ZIP-derived candidate key from reviewed store postal code. |
| `county_geoid` | 2020 Census county GEOID. |
| `county_name` | 2020 Census county name. |
| `relationship_source` | Source file description. |
| `relationship_vintage` | Census relationship vintage. |

## Rule

For this bounded Georgia pass, TURF chooses the county with the largest
`AREALAND_PART` for each ZCTA candidate in the Census ZCTA5-to-county
relationship file.

This is a first context assignment for reporting. It is not a rooftop geocode,
and it does not prove a store is physically inside that county when a ZCTA spans
county lines. Future geometry work should check point-in-polygon or a stronger
geocoder before high-stakes location claims.

## Commands

```powershell
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- export-packet-ready-county fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-county-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
```
