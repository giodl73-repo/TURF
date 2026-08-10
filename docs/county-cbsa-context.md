# County CBSA Context

TURF uses Census metropolitan and micropolitan delineation files as the first
public bridge from counties to metro context.

## Source

- Census delineation files page:
  https://www.census.gov/geographies/reference-files/time-series/demo/metro-micro/delineation-files.html
- Census July 2023 CBSA, metropolitan division, and CSA workbook:
  https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2023/delineation-files/list1_2023.xlsx

## Contract

The bounded Georgia county-CBSA fixture uses:

| Field | Meaning |
|---|---|
| `county_geoid` | Census county GEOID. |
| `county_name` | County name. |
| `cbsa_code` | CBSA code, blank for non-CBSA counties. |
| `cbsa_title` | CBSA title or `Non-CBSA Georgia county`. |
| `cbsa_type` | Metropolitan, micropolitan, or `Non-CBSA`. |
| `csa_code` | Combined statistical area code when present. |
| `csa_title` | Combined statistical area title when present. |
| `central_outlying` | Census central/outlying county label when present. |
| `metro_context_status` | One of `cbsa` or `non_cbsa`. |
| `relationship_source` | Source file description. |
| `relationship_vintage` | Delineation vintage. |

## Rule

TURF assigns county-enriched store rows to the CBSA/micro area attached to their
primary county context. Counties absent from the July 2023 CBSA delineation file
are kept as explicit `non_cbsa` rows.

This is a statistical-area context, not a company operating district and not a
drive-time territory.

## Commands

```powershell
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- export-packet-ready-metro fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
```
