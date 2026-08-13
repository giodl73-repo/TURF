# Pulse 104: Chicago Pre-Scale Field Stack

## Goal

Combine the current Chicago context layers into one pre-scale readout before
adding another metro or another source family.

## Work

- Added a combined Chicago field-stack query.
- Joined post office, gym, pharmacy, mass retail, and grocery summaries.
- Preserved observed, checked-absent, and source-gated dimensions separately.
- Added emerging field-type and readiness classifications.

## Evidence

Generated output:

```text
reports/ret-chicago-pre-scale-field-stack.csv
```

Emerging field types:

- Loop / River North: `urban_core_everyday_grid`.
- Lincoln Park / Lakeview: `inner_neighborhood_everyday_grid`.
- Old Orchard / Skokie: `single_grocery_mall_field`.
- Oakbrook widened: `postal_big_box_edge_field`.
- Woodfield / Schaumburg: `edge_city_grocery_big_box_field`.
- Midway / Ford City: `big_box_grocery_power_field`.
- Orland Square: `grocery_supported_mall_field`.

## Learning

Chicago is ready for type discovery, not final ranking. The non-Overpass stack
is strong enough to classify emerging fields, while OSM post-office and gym
source gates still need retry or alternate source strategy.

Old Orchard and Orland Square should not be downgraded from anchor candidates
yet. Their current stack needs retail-complex confirmation because grocery
shows everyday texture even when mass retail and pharmacy are checked absent in
the selected boxes.

## Artifacts

- `queries/ret-chicago-pre-scale-field-stack.sql`
- `reports/ret-chicago-pre-scale-field-stack.csv`
- `reports/ret-chicago-pre-scale-field-stack.md`

## Validation

```powershell
duckdb -c ".read queries/ret-chicago-pre-scale-field-stack.sql"
```
