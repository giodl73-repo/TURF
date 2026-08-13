# Pulse 115: Dallas Pre-Scale Field Stack

## Goal

Combine the five Dallas/Fort Worth layers into a pre-scale field stack and set
the next learning goal before adding another urban area.

## Changes

- Added `queries/ret-dallas-pre-scale-field-stack.sql`.
- Generated `reports/ret-dallas-pre-scale-field-stack.csv`.
- Added `reports/ret-dallas-pre-scale-field-stack.md`.
- Updated README, wave state, and role review.

## Findings

Dallas/Fort Worth is ready for type-discovery synthesis, but not final ranking.
The current stack has five clean comparable fields, two comparable fields with
USPS source gates, and one partial office-edge field.

The strongest learning is that grocery and retail complexes cover every target
field, while mass retail, pharmacy, and post offices create the useful
contrasts. Southlake is not weak because it lacks Target/Walmart/Costco/Sam's
Club inside the box; it reads as a town-center grocery-health-complex field.

## Validation

```powershell
duckdb -c ".read queries/ret-dallas-pre-scale-field-stack.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The next pulse should synthesize Dallas/Fort Worth and add the
comparable rows to the cross-metro type-discovery profile before scaling to a
fifth metro.
