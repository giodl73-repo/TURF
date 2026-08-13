# Atlanta Gym Source Resolution Pass

## Scope

This pass continues the before-more-metros source-resolution goal by retrying
the three Atlanta gym gates:

- Perimeter widened
- Northlake
- Decatur / Emory

Generated and refreshed outputs:

```text
reports/ret-atlanta-anchor-field-gym-summary.csv
reports/ret-atlanta-anchor-field-context-summary.csv
reports/ret-atlanta-pre-scale-readiness.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Result

Perimeter widened now has five packet-ready gym rows: Body Awareness Studio,
Crunch Fitness, LA Fitness, Orangetheory Fitness, and Pure Barre. That turns
Perimeter into a dense wellness-service edge-city field.

Northlake now has one packet-ready gym row: LA Fitness. Combined with its
observed library and pharmacy layers, this moves Northlake below the local
`source_limited_field` threshold.

Decatur / Emory still timed out on retry. Its gym layer remains source-gated
instead of being treated as absent.

## Profile Impact

Atlanta now has six type-discovery-partial comparison fields and one
source-limited field. Camp Creek is the remaining source-limited row because it
still has only one observed layer.

The important learning is that source resolution changes field type, not just
counts. Northlake is no longer a health-only partial field; it is a legacy
suburban mall node with library, pharmacy, and wellness signal. Perimeter adds
wellness density to its existing postal/transit/health edge-city texture.

## Next Step

The next scale gate should target Camp Creek or Chicago. For Atlanta, the most
useful Camp Creek layers are transit, park/open space, bank / credit union, gas
/ convenience, dollar store, hardware, and laundromat. For Chicago, the biggest
open source-quality issue remains the gym layer and the remaining post-office
source gates.
