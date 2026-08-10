# Place Context Contract

`place-context` is TURF's first geography contract. It keeps postal, civic,
statistical, lived-place, and market layers separate so later retail-footprint
claims can say which layer they use.

## CSV Fields

| Field | Meaning |
|---|---|
| `place_id` | Stable TURF fixture or record ID. |
| `label` | Human-readable place label for review. |
| `postal_city` | City/locality name carried by the postal address source. |
| `state` | USPS/state abbreviation used by the record. |
| `zip_code` | ZIP Code evidence from address/postal source. |
| `zcta` | Census ZCTA identifier when a ZCTA approximation is being used. |
| `municipality` | Incorporated municipality or `unincorporated`. |
| `county` | County or equivalent. |
| `census_place` | Census place name when available. |
| `cbsa` | Metropolitan or micropolitan statistical area label. |
| `urban_area` | Census urban area label. |
| `lived_place` | Common local identity or neighborhood/district label. |
| `market_area` | TURF's inferred commercial market label. |
| `delivery_relevance` | How relevant the postal layer is for this record. |
| `governance_relevance` | How relevant the civic boundary is for this record. |
| `statistics_relevance` | How relevant Census/statistical geography is for this record. |
| `market_relevance` | How relevant the market label is for this record. |

## Rules

- Do not collapse `postal_city`, `municipality`, `census_place`,
  `lived_place`, and `market_area`.
- Do not treat `zip_code` as a polygon.
- Do not treat `zcta` as an official USPS delivery territory.
- Do not infer a corporate territory from a place context alone.
- Every generated report must preserve the source layer names.

## Commands

```powershell
cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv
cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv
```

The CSV form emits `place_id`, `label`, `finding_kind`, and `finding`. The JSON
form emits the same findings as a `{"findings":[...]}` object for dashboards,
agents, and later packet generation.

Current finding kinds:

- `zip_zcta_mismatch`
- `postal_city_municipality_mismatch`
- `municipality_census_place_mismatch`
- `lived_place_market_area_mismatch`
