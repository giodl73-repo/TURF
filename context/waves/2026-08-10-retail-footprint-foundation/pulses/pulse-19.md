# Pulse 19: Atlanta Suburban Ring Test

## Goal

Test whether Lowe's appears more suburban in the Atlanta CBSA by classifying
packet-ready stores into distance rings from an explicit Atlanta core point.

## Changes

- Added metro ring classification and ring summary helpers.
- Added `ring-metro-review` to `turf-cli`.
- Added `reports/home-improvement-atlanta-cbsa-rings.txt`.
- Updated `reports/home-improvement-georgia.md` with the ring result.

## Ring Definition

Core point: `33.7490,-84.3880`.

| Ring | Distance from core |
|---|---|
| `urban_core` | Under 10 miles |
| `inner_suburb` | 10 to under 25 miles |
| `outer_suburb` | 25 to under 45 miles |
| `exurb` | 45 miles or more |

## Readout

| Ring | Home Depot | Lowe's | Total | Lowe's share |
|---|---:|---:|---:|---:|
| `urban_core` | 6 | 1 | 7 | 0.143 |
| `inner_suburb` | 31 | 13 | 44 | 0.295 |
| `outer_suburb` | 19 | 6 | 25 | 0.240 |
| `exurb` | 3 | 0 | 3 | 0.000 |

## Interpretation

The Atlanta sample supports a narrower suburbanity hypothesis: Lowe's share is
highest in the inner-suburb ring and second-highest in the outer-suburb ring.
It does not show Lowe's over-indexing in the urban core or far exurb fringe,
and Home Depot still leads every ring.

## Caveat

This is a straight-line distance proxy from a chosen core point. It is not a
Census urban/suburban definition, drive-time model, or company territory claim.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- ring-metro-review 12060 33.7490 -84.3880 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
git diff --check
```
