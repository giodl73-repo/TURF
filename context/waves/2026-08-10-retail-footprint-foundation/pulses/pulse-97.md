# Pulse 97: Atlanta Pre-Scale Readiness

## Goal

Convert the completed 11-dimension Atlanta context pass into a scale decision.

## Work

- Added `queries/ret-atlanta-pre-scale-readiness.sql`.
- Generated `reports/ret-atlanta-pre-scale-readiness.csv`.
- Added `reports/ret-atlanta-pre-scale-readiness.md`.
- Updated README, wave state, and role review.

## Learning

Atlanta is ready for type discovery, but not final cross-metro ranking.

The contract shape now matches Washington's 11 dimensions, but the resolution
quality does not. Washington has zero source-gated dimensions in its completed
baseline. Atlanta fields still carry at least five source-gated dimensions:

- Cumberland / Vinings: 4 observed, 6 source-gated, 1 checked absent.
- Buckhead / Lenox / Phipps: 6 observed, 5 source-gated, 0 checked absent.
- Perimeter widened: 3 observed, 7 source-gated, 1 checked absent.
- Camp Creek: 1 observed, 9 source-gated, 1 checked absent.
- Northlake: 1 observed, 10 source-gated, 0 checked absent.
- North Point / Alpharetta widened: 4 observed, 6 source-gated, 1 checked
  absent.
- Decatur / Emory: 4 observed, 7 source-gated, 0 checked absent.

This supports the next metro only as type discovery. Final atlas ranking needs
a source-strategy cleanup pass for source-gated Atlanta categories.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-pre-scale-readiness.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
