# Pizza Delivery Selected-Node Pass

## Scope

This pass applies the A.2 pizza-delivery sidecar to selected nodes from the
central spine rather than to a postal denominator:

- Kingston and Bainbridge Island as ferry-side selective nodes,
- Bremerton, Poulsbo, Silverdale, and Port Orchard as West Sound dense-grid
  controls,
- Arlington / Grand Prairie as a highway-service and daily-trip stack control,
- North Point / Alpharetta as an Atlanta continuity control.

Target boxes:
`tables/pizza-delivery-sidecar-targets.csv`.

OSM review output:
`tables/osm-pizza-delivery-selected-node-review-2026-08-16.csv`.

Source gates:
`tables/osm-pizza-delivery-selected-node-source-gates-2026-08-16.csv`.

Summary:
`tables/pizza-delivery-selected-node-summary-2026-08-16.csv`.

## Result

The pass returned 21 OSM pizza-delivery/carryout rows. After excluding one
Bremerton-box row that overlaps into Port Orchard, 20 rows remain
packet-ready:

- Kingston WA: 1 packet-ready row, Domino's.
- Bainbridge Island WA: 0 rows in the first fetched box.
- Bremerton WA: 9 packet-ready rows across 4 brands.
- Poulsbo WA: source-gated by Overpass timeout after retry.
- Silverdale WA: source-gated by Overpass timeout after retry.
- Port Orchard WA: 3 packet-ready rows across 2 brands.
- Arlington / Grand Prairie TX: 5 packet-ready rows across 3 brands.
- North Point / Alpharetta GA: 2 packet-ready rows across 2 brands.

The Kingston row is useful because OSM returns the same basic current-store
fact as the official Domino's page used in the casework: Domino's at 8208
Northeast State Highway 104, Kingston WA. The official page remains the better
public brand-locator citation for the named Kingston example.

## Read

Kingston is not a food-service absence case. It is a selective ferry-side
provisioning node: the four-brand QSR layer records a single McDonald's row,
and the pizza sidecar adds a Domino's row. That combination supports a thin but
real current provisioning layer.

Bremerton behaves differently. It was already a dense four-brand QSR place in
the Puget Sound read, and the pizza sidecar also returns dense multi-brand
presence after excluding one Port Orchard overlap row from the Bremerton count.
This is a same-side service grid, not just ferry-side selectivity.

Port Orchard lands between those poles: four-brand QSR already showed a
contested place, and pizza delivery adds multi-brand depth.

Arlington / Grand Prairie confirms the highway-node branch. Pizza delivery is
present inside a field that already combines dense QSR, auto-parts, and
gas/convenience evidence. One row is a Taco Bell/Pizza Hut co-brand, so the
sidecar should count it as pizza-chain presence while preserving the co-brand
boundary.

North Point / Alpharetta supports the Atlanta continuity contrast. The sidecar
returns multi-brand pizza presence in an edge-city/exurban control, matching
the earlier Atlanta QSR read where contested QSR continues across rings rather
than collapsing into isolated ferry-side nodes.

Poulsbo and Silverdale should not be read as zeroes. Their Overpass requests
timed out after retry, so they remain source-gated until a later acquisition
pass or alternate source can review them.

## Claim Boundary

This is public chain-location evidence. It does not establish delivery
territories, actual delivery availability, customer access, route choice,
demand, affordability, food access, local quality, or service adequacy.

The narrower A.2 claim is enough: pizza delivery and carryout chains are a
modern provisioning layer that can map onto town, ferry-side, highway, and
edge-city enclave terrain without reducing the analysis to post offices.
