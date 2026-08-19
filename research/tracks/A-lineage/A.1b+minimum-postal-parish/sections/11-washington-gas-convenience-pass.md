# Washington Gas Convenience Pass

## Source

This pass uses the existing reviewed TURF Overture gas/convenience layer:
`fixtures/stores/overture-gas-convenience-profile-states-review-2026-07-22.csv`.

The pass filters packet-ready Washington rows into the 20 A.1b target boxes.
It does not use a new Overpass fetch.

Reusable target-assigned review layer:
`tables/overture-gas-convenience-washington-minimum-postal-parish-review-2026-07-22.csv`.

Reusable status table:
`tables/washington-gas-convenience-status-2026-07-22.csv`.

## Status Counts

| Gas / Convenience Status | Targets |
|---|---:|
| observed | 15 |
| checked_absent | 5 |
| source_gated | 0 |

The observed subset has 30 packet-ready Overture rows. These are reviewed store
rows, not deduplicated physical station counts.

## Checked-Absent Targets

The five target boxes with no packet-ready gas/convenience rows are:

- Cathlamet,
- Clallam Bay,
- La Conner,
- Loon Lake,
- Lopez Island.

## Current Read

Gas/convenience is a strong everyday-service sidecar in this Washington sparse
queue. It is observed in ferry/island fields such as Clinton, Eastsound, and
Friday Harbor; remote or highway towns such as Darrington, Forks, Mattawa, and
Mesa; and several county-seat or agricultural-town candidates.

This does not imply traffic volume, car ownership, highway dependence, service
adequacy, or customer behavior. It only says that reviewed public POI evidence
places target gas/convenience brands inside the bounded target boxes.

## Classifier Impact

For minimum-stack classification, gas/convenience can now be treated as checked
for all 20 Washington A.1b targets:

- `observed` gas/convenience may support a `postal_gas_minimum` or broader
  everyday-service label when post-office evidence is also observed,
- `checked_absent` gas/convenience should not be inferred as absence of all
  local fuel, convenience, grocery, or service activity,
- row counts should remain row-level evidence unless a later de-duplication
  pass normalizes same-station duplicates.
