# Pulse 53: RET Anchor Prediction Audit

## Goal

Compare Washington and Atlanta anchor predictions with a shared diagnostic
vocabulary so RET can distinguish true anchor signals from data, geometry, and
rule pressure.

## Work

- Added `queries/ret-anchor-prediction-audit.sql`.
- Generated `reports/ret-anchor-prediction-audit.csv`.
- Added `reports/ret-anchor-prediction-audit.md`.
- Updated the wave record, role review, and README command list.

## Learning

The rules are now falsifiable at the anchor layer. Mall presence alone does not
force an active-anchor label. Lynnwood / Alderwood and Everett pass as active
regional mall anchors, Northgate / Lake City and Northlake read as legacy or
redeveloping mall service grids, and Perimeter plus North Point / Alpharetta
remain pressure cases.

The Cumberland/Vinings review fix matters because it changed the prediction
without changing the rule. The error was source review quality, not a missing
typology.

## Validation

```powershell
duckdb -c ".read queries/ret-anchor-prediction-audit.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
