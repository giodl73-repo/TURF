# Pulse 105: Chicago Retail-Complex Confirmation

## Goal

Confirm whether Chicago grocery and mass-retail field labels are anchored by
named mall, shopping-center, or retail-complex structures.

## Work

- Added the Illinois retail-complex Overture extraction query.
- Generated a noisy raw candidate layer.
- Reviewed a target-limited subset for the seven Chicago fields.
- Promoted nine high-confidence named complex rows.
- Added the Chicago retail-complex summary and refreshed the pre-scale stack.

## Evidence

Reviewed packet-ready rows:

- Westfield Old Orchard Mall.
- Oakbrook Center.
- The District at Oakbrook Center.
- Woodfield Mall.
- Woodfield Village Green.
- Ford City Mall.
- Burbank Shopping Center.
- Orland Square Mall.
- Orland Square Shopping Center.

Updated field types:

- Old Orchard / Skokie: `confirmed_single_grocery_mall_field`.
- Oakbrook widened: `confirmed_postal_big_box_edge_field`.
- Woodfield / Schaumburg: `confirmed_edge_city_mall_grocery_field`.
- Midway / Ford City: `confirmed_mall_big_box_grocery_field`.
- Orland Square: `confirmed_grocery_supported_mall_field`.

## Learning

Retail-complex confirmation resolves the main uncertainty from the grocery and
mass-retail pass. Old Orchard and Orland Square are confirmed mall fields rather
than weak fields. Woodfield and Ford City now stack named mall structure with
grocery and big-box evidence. Oakbrook remains the cleanest suburban comparison
field because it has postal, big-box, grocery, and retail-complex signal.

## Artifacts

- `queries/overture-retail-complex-illinois-2026-07-22.sql`
- `fixtures/stores/overture-retail-complex-illinois-2026-07-22.csv`
- `fixtures/stores/overture-retail-complex-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-retail-complex-summary.sql`
- `reports/ret-chicago-anchor-field-retail-complex-summary.csv`
- `reports/ret-chicago-anchor-field-retail-complex-summary.md`
- `docs/research/overture-retail-complex-illinois-extraction-2026-07-22.md`
- `queries/ret-chicago-pre-scale-field-stack.sql`
- `reports/ret-chicago-pre-scale-field-stack.csv`
- `reports/ret-chicago-pre-scale-field-stack.md`

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-retail-complex-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-retail-complex-illinois-review-2026-07-22.csv
duckdb -c ".read queries/ret-chicago-anchor-field-retail-complex-summary.sql"
duckdb -c ".read queries/ret-chicago-pre-scale-field-stack.sql"
```
