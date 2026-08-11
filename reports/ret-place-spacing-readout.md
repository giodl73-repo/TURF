# RET Place Spacing Readout

## Scope

This report adds same-place nearest opposite-brand spacing for the Puget Sound
RET place targets.

The command uses reviewed packet-ready rows and only compares competitors
inside the same curated place target. It does not compute drive time, ferry
impedance, or cross-water service areas.

## Command Shape

```powershell
cargo run -p turf-cli -- ret-place-spacing auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- ret-place-spacing home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
```

Generated outputs:

```text
reports/ret-auto-parts-puget-sound-place-spacing.csv
reports/ret-home-improvement-puget-sound-place-spacing.csv
```

## Findings

Auto parts:

| Place | Closest opposite-brand pair | Distance |
|---|---|---:|
| Bremerton WA | NAPA / O'Reilly | 0.06 mi |
| Port Orchard WA | AutoZone / O'Reilly | 0.15 mi |
| Silverdale WA | O'Reilly / NAPA | 0.20 mi |
| Poulsbo WA | O'Reilly / NAPA | 0.88 mi |

Home improvement:

| Place | Closest opposite-brand pair | Distance |
|---|---|---:|
| Silverdale WA | Lowe's / Home Depot | 0.44 mi |

## Interpretation

Bremerton is not just a three-brand city count. It has a very tight
NAPA/O'Reilly pair at 0.06 miles and additional same-city AutoZone, NAPA, and
O'Reilly spacing under 0.6 miles. That supports `contested_service_grid` more
strongly than count data alone.

Kingston remains different: it has same-place NAPA rows but no same-place
opposite-brand auto-parts spacing. That supports keeping Kingston as
`ferry_side_enclave` rather than `contested_service_grid`.

Home improvement shows the category contrast again. Among the current target
places, only Silverdale has a same-place Home Depot/Lowe's pair. The other
ferry-side places are either direct-row white space or single-anchor markets.
