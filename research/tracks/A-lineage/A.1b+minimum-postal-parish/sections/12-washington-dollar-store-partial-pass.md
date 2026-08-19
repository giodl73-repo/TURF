# Washington Dollar Store Pass

## Fetcher Update

The OSM civic fetcher now sends brand-targeted selectors for `dollar_store`.
The target brands are:

- Dollar Tree,
- Dollar General,
- Family Dollar.

This avoids a broad `shop=variety_store` scrape and keeps the sidecar focused
on value-errand chain signal.

## Target-Box Pass

Reusable review layer:
`tables/osm-dollar-store-washington-minimum-postal-parish-partial-review-2026-08-15.csv`.

Reusable status table:
`tables/washington-dollar-store-status-2026-08-15.csv`.

After the first pass, targeted retry, and final three-target retry, the status
is:

| Dollar Store Status | Targets |
|---|---:|
| observed | 6 |
| checked_absent | 14 |
| source_gated | 0 |

The observed targets are:

- Bingen: Dollar General,
- Cathlamet: Dollar General,
- Connell: Dollar General,
- Darrington: Family Dollar,
- Loon Lake: Dollar General,
- Mattawa: Dollar General.

The final retry resolved the prior source gates:

- Buckley: checked absent,
- Mattawa: observed Dollar General,
- Mesa: checked absent.

## Current Read

Dollar stores are not merely an urban or suburban edge signal in this pilot.
They appear in sparse places that otherwise entered the queue through only one
reviewed chain layer. That makes the sidecar important for distinguishing
`postal_only_candidate` from value-errand minimum stacks.

The sidecar is complete for this bounded target-box pass. It remains an OSM
target-brand sidecar, not an exhaustive retail inventory.

## Boundary

This pass may say that target-brand dollar-store signal is observed in six
bounded target boxes and checked absent in 14. It may not infer income,
spending, retail quality, service adequacy, or customer behavior.
