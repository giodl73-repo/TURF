# Pulse 98: Chicago Context Targets

## Goal

Add the third-metro anchor-field target set for type discovery after
Washington and Atlanta.

## Work

- Added `fixtures/geography/ret-chicago-anchor-field-targets.csv`.
- Added `queries/ret-chicago-anchor-field-targets.sql`.
- Generated `reports/ret-chicago-anchor-field-targets.csv`.
- Added `reports/ret-chicago-anchor-field-targets.md`.
- Updated README, wave state, and role review.

## Learning

Chicago gives TURF a third metro with different urban form:

- Loop / River North: dense downtown civic/service field.
- Lincoln Park / Lakeview: inner neighborhood service field.
- Old Orchard / Skokie: mature north suburban regional mall field.
- Oakbrook widened: west suburban edge-city mall/service field.
- Woodfield / Schaumburg: large regional mall plus edge-city service grid.
- Midway / Ford City: southwest airport-edge retail field.
- Orland Square: south suburban regional mall/service field.

All seven target rows validate as `ready_for_context_extraction`.

## Validation

```powershell
duckdb -c ".read queries/ret-chicago-anchor-field-targets.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
