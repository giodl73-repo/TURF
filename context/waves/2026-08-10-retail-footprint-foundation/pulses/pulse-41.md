# Pulse 41: RET Place Spacing Profile

## Goal

Add same-place spacing evidence so RET can distinguish category capacity from
rivalry-supported candidates.

## Changes

- Added `queries/ret-profile-v0-place-spacing-summary.sql`.
- Added `reports/ret-profile-v0-place-spacing-summary.csv`.
- Added `reports/ret-seattle-atlanta-spacing-readout.md`.
- Linked the spacing readout from README and the capacity synthesis.

## Output

The generated spacing summary reports, by selected place and category:

- total stores
- brand count
- nearest opposite-brand spacing
- median nearest opposite-brand spacing
- close nearest-opposite links under 0.25 miles
- close nearest-opposite links under 0.5 miles
- spacing profile hint

## Learning

Capacity is not rivalry by itself. This pulse adds the first evidence tier that
can promote co-presence into a stronger rivalry candidate when same-category
brands are repeatedly close inside a selected place.

## Validation

```powershell
duckdb -c ".read queries/ret-profile-v0-place-spacing-summary.sql"
git diff --check
```
