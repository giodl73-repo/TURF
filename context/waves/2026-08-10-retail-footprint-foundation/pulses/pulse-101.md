# Pulse 101: Chicago Pharmacy Layer

## Goal

Use a non-Overpass everyday source to test whether Chicago is blocked as a
type-discovery metro or only blocked on the current OSM/Overpass acquisition
path.

## Work

- Added the Illinois exact-brand Overture drugstore extraction query.
- Generated and reviewed the Illinois drugstore layer.
- Promoted only primary `CVS Pharmacy` and `Walgreens` store rows.
- Excluded clinic, beauty, photo, specialty, hospital, provider, and other
  non-primary rows as `brand_false_positive`.
- Intersected the reviewed layer with the seven bounded Chicago anchor fields.

## Evidence

- Raw Illinois rows: 249.
- Reviewed packet-ready rows: 170.
- Reviewed excluded rows: 79.
- Loop / River North: 7 packet-ready pharmacy rows.
- Lincoln Park / Lakeview: 1 packet-ready pharmacy row.
- Old Orchard / Skokie, Oakbrook widened, Woodfield / Schaumburg, Midway / Ford
  City, and Orland Square: checked absent for this exact-brand layer.

## Learning

Chicago is not blocked as a type-discovery metro. The OSM/Overpass path is the
current blocker. Pharmacy gives a clean urban-core and inner-neighborhood
health-errand signal without source gates.

## Artifacts

- `queries/overture-drugstore-illinois-2026-07-22.sql`
- `fixtures/stores/overture-drugstore-illinois-2026-07-22.csv`
- `fixtures/stores/overture-drugstore-illinois-review-2026-07-22.csv`
- `queries/ret-chicago-anchor-field-pharmacy-summary.sql`
- `reports/ret-chicago-anchor-field-pharmacy-summary.csv`
- `reports/ret-chicago-anchor-field-pharmacy-summary.md`
- `docs/research/overture-drugstore-illinois-extraction-2026-07-22.md`

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-illinois-review-2026-07-22.csv
duckdb -c ".read queries/ret-chicago-anchor-field-pharmacy-summary.sql"
```
