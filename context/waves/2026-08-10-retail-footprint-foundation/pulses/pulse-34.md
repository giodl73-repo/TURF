# Pulse 34: QSR Overture Acquisition Gate

## Goal

Turn the QSR restaurant decision into a source-policy-safe acquisition gate for
Washington McDonald's, Burger King, Wendy's, and Taco Bell rows.

## Changes

- Added `fixtures/stores/qsr-overture-brand-filters.csv`.
- Added `queries/overture-qsr-washington-2026-07-22.sql`.
- Added `docs/research/overture-qsr-washington-extraction-2026-07-22.md`.
- Updated the restaurant expansion and chain-sequence docs to point at the QSR
  acquisition gate.
- Updated the README with the QSR query path.

## Readout

QSR remains the next implementation layer, but the commit does not add
unsourced restaurant locator rows. The query uses the same Overture release,
Washington address-region filter, and Washington bbox guard as the prior
Washington retail extracts.

The first review output should be:

```text
fixtures/stores/overture-qsr-washington-review-2026-07-22.csv
```

That reviewed layer should then feed:

- Seattle-Tacoma-Bellevue CBSA QSR drilldown;
- Bremerton-Silverdale-Port Orchard CBSA QSR drilldown;
- ferry-side place comparisons for Bainbridge Island, Kingston, Bremerton,
  Poulsbo, Silverdale, and Port Orchard.

## Local Tooling Note

The current shell did not have `duckdb` on `PATH`, so the live Parquet extract
was not run in this pulse. The acquisition query is checked in so the next
environment with DuckDB can run it directly.

## Validation

```powershell
git diff --check
```
