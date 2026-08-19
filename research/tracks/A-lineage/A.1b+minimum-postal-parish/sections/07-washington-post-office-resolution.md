# Washington Post-Office Resolution

## Resolved Gate

The A.1b Washington pilot now has a checked post-office pass from OSM/Overpass.
The reusable checked layer is:
`tables/osm-post-office-washington-minimum-postal-parish-review-2026-08-15.csv`.

The status readout is:
`tables/washington-post-office-status-2026-08-15.csv`.

The checked layer contains 20 post-office rows across 18 of the 20 candidate
target boxes. Darrington and Mesa returned no post-office elements on clean
single-target retries, so they are `checked_absent` for this OSM target-box
pass.

## Status Counts

| Post-Office Status | Targets |
|---|---:|
| observed | 18 |
| checked_absent | 2 |
| source_gated | 0 |

Within the observed targets:

- seven targets have at least one post-office row with complete street-address
  and postal-code tags,
- eleven targets have post-office geometry but incomplete OSM address tags,
- Bingen and Friday Harbor each return two post-office rows inside the target
  box and need later de-duplication or source reconciliation.

## Claim Boundary

This pass resolves only the post-office layer for bounded target boxes. It does
not prove municipal, ZIP, ZCTA, CDP, postal-locality, or county identity. It
also does not establish a minimum postal parish class by itself.

The next classifier still needs everyday-service sidecars against the same
target boxes:

- gas/convenience,
- dollar store,
- QSR confirmation where the current queue has no QSR signal,
- grocery/pharmacy confirmation where the current queue has no provisioning
  signal.

Those sidecar fetches need an explicit review guard for rows whose OSM address
tags point outside the candidate state or target locality.

## First Read

The strongest post-office-plus-one candidates after this pass are the targets
with observed post-office evidence and only one current reviewed chain layer.
Examples include Buckley, Cashmere, Dayton, Eatonville, La Conner, Loon Lake,
and Friday Harbor because they have at least one complete post-office row.

Darrington and Mesa should not be classified as postal minimum candidates from
this source pass. They are sparse-chain places with no OSM post-office element
inside the current target boxes.
