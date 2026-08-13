# Atlanta Pre-Scale Readiness

## Scope

This report reviews whether Atlanta is ready to act as the second
11-dimension anchor-field baseline after Washington.

Generated output:

```text
reports/ret-atlanta-pre-scale-readiness.csv
```

## Decision

Atlanta is ready for **type discovery**, but not ready for final cross-metro
ranking.

The 11-dimension contract is complete: post office, library, park/open space,
transit, bank/credit union, gas/convenience, pharmacy, dollar store, hardware,
laundromat, and gym are all represented in the combined summary. The problem is
resolution quality. Washington has zero source-gated dimensions in its
completed baseline, while Atlanta still carries enough source-gated dimensions
to avoid final ranking.

## Field Readiness

| Field | Observed | Source-Gated | Checked Absent | Tier | Recommended Action |
|---|---:|---:|---:|---|---|
| Cumberland / Vinings | 4 | 6 | 1 | `partial_profile_field` | `usable_for_type_discovery_not_final_ranking` |
| Buckhead / Lenox / Phipps | 6 | 5 | 0 | `partial_profile_field` | `usable_for_type_discovery_not_final_ranking` |
| Perimeter widened | 4 | 6 | 1 | `partial_profile_field` | `usable_for_type_discovery_not_final_ranking` |
| Camp Creek | 3 | 3 | 5 | `usable_comparison_field` | `usable_for_cross_metro_comparison` |
| Northlake | 6 | 4 | 1 | `usable_comparison_field` | `usable_for_cross_metro_comparison` |
| North Point / Alpharetta widened | 4 | 6 | 1 | `partial_profile_field` | `usable_for_type_discovery_not_final_ranking` |
| Decatur / Emory | 4 | 6 | 1 | `partial_profile_field` | `usable_for_type_discovery_not_final_ranking` |

## What We Can Trust

The Atlanta pass is already strong enough to learn typed enclave shapes:

- Cumberland / Vinings: finance, household-service, and wellness service field.
- Buckhead / Lenox / Phipps: civic/open-space/small-trade mall field.
- Perimeter widened: postal/transit/health/wellness edge-city field.
- Camp Creek: finance/car-trip/wellness airport-edge field with checked
  post-office, library, transit, hardware, and pharmacy absence.
- Northlake: finance/car-trip/health/trade/wellness legacy mall field with
  checked post-office absence and remaining dollar-store, laundromat, park, and
  transit source gates.
- North Point / Alpharetta widened: open-space/health/wellness edge-city
  field.
- Decatur / Emory: finance/car-trip/health service village.

Those are legitimate type-discovery labels because they come from observed
rows, checked absent rows, or explicitly visible source gates.

## What We Cannot Claim Yet

Atlanta is not resolved enough to rank against Washington by total context
strength. The high source-gate count means a field with fewer observed
dimensions may be undersourced rather than genuinely thinner.

The riskiest layers are the OSM/Overpass categories with repeated target
timeouts:

- dollar store
- bank / credit union
- gas / convenience
- hardware
- some civic layers for Camp Creek and Northlake

Camp Creek and Northlake no longer have post-office timeouts, but neither
result produced a packet-ready USPS row. Camp Creek's library, transit, and
hardware retries also returned no packet-ready rows. Those are useful negative
evidence, not observed civic-anchor signal.

Camp Creek is no longer source-limited. The airport-edge field has finance,
gas/convenience, and gym signal, but its remaining source-gated layers still
make it inappropriate for final ranking against Washington.

Northlake gained observed bank, gas/convenience, and hardware signal in the
latest service pass. Its unresolved question is now narrower: whether the
legacy mall node has hidden park/open-space, transit, dollar-store, or
laundromat rows behind source gates.

## Next Step

Scale to another metro only if the goal is to discover whether the same field
types recur. Before using Atlanta for final atlas rankings, run a source
strategy cleanup pass: retry source-gated categories during a better Overpass
window or introduce another open reviewed source path for routine-service
categories.
