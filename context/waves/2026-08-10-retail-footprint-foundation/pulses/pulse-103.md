# Pulse 103: Chicago Grocery Layer

## Goal

Add grocery as the third Chicago non-Overpass layer to test routine
neighborhood-service depth across the same seven anchor fields.

## Work

- Added the Illinois grocery Overture extraction query.
- Generated and reviewed the Illinois grocery layer.
- Promoted primary store rows and excluded pharmacy, fuel, money-services,
  deli, bakery, pickup, distribution, and named internal service rows.
- Intersected the reviewed layer with the seven bounded Chicago anchor fields.

## Evidence

- Raw Illinois rows: 706.
- Reviewed packet-ready rows: 548.
- Reviewed excluded rows: 158.

Chicago field signal:

- Loop / River North: 9 rows across 5 brands.
- Lincoln Park / Lakeview: 10 rows across 5 brands.
- Old Orchard / Skokie: 1 Jewel-Osco row.
- Oakbrook widened: 1 Jewel-Osco row.
- Woodfield / Schaumburg: 4 rows across 4 brands.
- Midway / Ford City: 4 rows across 3 brands.
- Orland Square: 3 rows across 3 brands.

## Learning

Grocery proves the non-Overpass Chicago stack can recover signal across all
seven fields. It also corrects the mass-retail read: Old Orchard and Orland
Square are not everyday-empty fields. Orland Square becomes a grocery-supported
south suburban mall field, while Woodfield and Ford City stack grocery grid
signal with big-box signal.

## Artifacts

- `queries/overture-grocery-illinois-2026-07-22.sql`
- `fixtures/stores/overture-grocery-illinois-2026-07-22.csv`
- `fixtures/stores/overture-grocery-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-grocery-summary.sql`
- `reports/ret-chicago-anchor-field-grocery-summary.csv`
- `reports/ret-chicago-anchor-field-grocery-summary.md`
- `docs/research/overture-grocery-illinois-extraction-2026-07-22.md`

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-illinois-review-2026-07-22.csv
duckdb -c ".read queries/ret-chicago-anchor-field-grocery-summary.sql"
```
