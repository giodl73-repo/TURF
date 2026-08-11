# Pulse 26: RET Metro Candidate Rules

## Goal

Add the first rule-based RET candidate generator for metro-level category
features.

## Changes

- Added `RetMetroCandidate` to `turf-core`.
- Added `suggest_ret_metro_candidates`.
- Added `suggest-ret-metro` to `turf-cli`.
- Added tests for home-improvement anchor-market and dense auto-parts contested
  grid suggestions.
- Generated Washington candidate outputs for home improvement and auto parts.
- Added `reports/ret-metro-candidate-readout.md`.

## Generated Outputs

```text
reports/ret-home-improvement-washington-metro-candidates.csv
reports/ret-auto-parts-washington-metro-candidates.csv
```

## Readout

Home improvement suggestions:

| Enclave type | Metros/regions |
|---|---:|
| `anchor_market` | 18 |

Auto parts suggestions:

| Enclave type | Metros/regions |
|---|---:|
| `anchor_market` | 9 |
| `brand_led_service_mesh` | 5 |
| `contested_service_grid` | 6 |
| `service_mesh` | 4 |

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- suggest-ret-metro home_improvement fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv fixtures\geography\washington-zcta-county-primary-2020.csv fixtures\geography\washington-county-cbsa-2023.csv
cargo run -p turf-cli -- suggest-ret-metro auto_parts fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv fixtures\geography\washington-auto-parts-zcta-county-primary-2020.csv fixtures\geography\washington-auto-parts-county-cbsa-2023.csv
git diff --check
```
