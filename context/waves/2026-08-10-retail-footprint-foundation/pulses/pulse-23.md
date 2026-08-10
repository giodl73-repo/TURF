# Pulse 23: Washington Category Spread Comparison

## Goal

Compare the Washington home-improvement and auto-parts spreads directly so TURF
can distinguish destination big-box geography from neighborhood service
geography.

## Changes

- Added `reports/washington-category-spread-comparison.md`.
- Compared packet-ready rows, city reach, ZCTA reach, county reach, metro
  spreads, and ferry-side coverage.
- Updated the wave and role review records.

## Readout

| Measure | Home improvement | Auto parts |
|---|---:|---:|
| Packet-ready rows | 92 | 507 |
| Cities with rows | 52 | 172 |
| ZCTA candidates | 64 | 230 |
| Counties | 22 | 39 |
| Seattle CBSA rows | 42 | 197 |
| Bremerton CBSA rows | 4 | 17 |

## Learning

Home improvement is a destination big-box layer: sparse, regional, and
Home-Depot-led. Auto parts is a neighborhood service layer: dense, fragmented,
and more sensitive to local/ferry-side geography.

Kingston is the clearest example. It is absent from the home-improvement
packet-ready layer and present in the auto-parts layer through two NAPA rows.

## Validation

```powershell
git diff --check
```
