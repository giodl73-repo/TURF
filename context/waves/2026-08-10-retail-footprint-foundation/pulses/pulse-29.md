# Pulse 29: Bremerton RET Example Review

## Goal

Review the Bremerton place-level RET candidate that differed from the broader
Kitsap CBSA read and promote it into the hand-reviewed example fixture when
the evidence supports it.

## Changes

- Added Bremerton home-improvement `white_space` to
  `fixtures/geography/ret-washington-examples.csv`.
- Added Bremerton auto-parts `contested_service_grid` to the same fixture.
- Regenerated place-level RET evaluation outputs for home improvement and auto
  parts.
- Updated the RET example report, taxonomy notes, and place evaluation report.

## Readout

The reviewed fixture now has 16 examples:

| Geography type | Examples |
|---|---:|
| `place` | 12 |
| `cbsa` | 4 |

The place-level scorecards now match all 12 comparable examples:

| Category | Matches | Mismatches |
|---|---:|---:|
| Home improvement | 6 | 0 |
| Auto parts | 6 | 0 |

Bremerton is the cleanest place-vs-metro contrast so far. The city itself has
no direct packet-ready Home Depot/Lowe's row, but auto parts has seven direct
rows across NAPA, AutoZone, and O'Reilly. At the broader CBSA level, the same
category becomes NAPA-led because the surrounding Kitsap places add NAPA weight.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- summarize-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-puget-sound-place-candidates.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-candidates.csv
git diff --check
```
