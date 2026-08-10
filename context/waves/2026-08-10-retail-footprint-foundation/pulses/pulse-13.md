# Pulse 13: Georgia Overture Candidate Review

## Goal

Turn the raw Georgia Overture Home Depot/Lowe's candidate extract into a
reviewable dataset that can feed packet work without losing audit history.

## Changes

- Added the reviewed store candidate contract:
  `docs/store-candidate-review.md`.
- Added `ReviewedStorePoint` parsing and `validate-store-review`.
- Added the reviewed Georgia candidate file:
  `fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv`.
- Added the review note:
  `docs/research/overture-georgia-review-2026-07-22.md`.

## Review Counts

| Review status | Rows |
|---|---:|
| `packet_ready` | 132 |
| `needs_review` | 3 |
| `exclude` | 1 |
| Total | 136 |

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-home-improvement-georgia-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
git diff --check
```
