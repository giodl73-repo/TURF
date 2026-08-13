# Pulse 102: Chicago Mass-Retail Layer

## Goal

Add a second Chicago non-Overpass layer to test whether big public chains reveal
different anchor-field structure than pharmacy.

## Work

- Added the Illinois Target / Walmart / Costco / Sam's Club Overture extraction
  query.
- Generated and reviewed the Illinois mass-retail layer.
- Promoted primary store rows and excluded embedded department or service rows.
- Intersected the reviewed layer with the seven bounded Chicago anchor fields.

## Evidence

- Raw Illinois rows: 277.
- Reviewed packet-ready rows: 242.
- Reviewed excluded rows: 35.
- Packet-ready brand counts: Walmart 118, Target 85, Costco 25, Sam's Club 14.

Chicago field signal:

- Loop / River North: 2 Target rows.
- Lincoln Park / Lakeview: 3 Target rows.
- Oakbrook widened: Costco and Walmart.
- Woodfield / Schaumburg: Costco.
- Midway / Ford City: Costco and Target.
- Old Orchard / Skokie and Orland Square: checked absent for this exact bounded
  layer.

## Learning

Mass retail separates Chicago field types better than pharmacy alone. The urban
and inner-neighborhood fields show Target-only signal, while Oakbrook and Ford
City show multi-brand big-box anchor signal. Woodfield gets a single Costco
signal. Old Orchard and Orland Square may need wider geometry, retail-complex
signal, or another category before they can be interpreted.

## Artifacts

- `queries/overture-mass-retail-illinois-2026-07-22.sql`
- `fixtures/stores/overture-mass-retail-illinois-2026-07-22.csv`
- `fixtures/stores/overture-mass-retail-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-mass-retail-summary.sql`
- `reports/ret-chicago-anchor-field-mass-retail-summary.csv`
- `reports/ret-chicago-anchor-field-mass-retail-summary.md`
- `docs/research/overture-mass-retail-illinois-extraction-2026-07-22.md`

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-illinois-review-2026-07-22.csv
duckdb -c ".read queries/ret-chicago-anchor-field-mass-retail-summary.sql"
```
