# Role Review

Status: movement evidence role review added.

## Reviewed Evidence

Reviewed outputs:

- `tables/first-evidence-read.csv`
- `tables/movement-sidecar-contract.csv`
- `tables/movement-sidecar-targets.csv`
- `tables/movement-sidecar-first-pass-summary-2026-08-16.csv`
- `tables/movement-ferry-route-context-review-2026-08-16.csv`
- `tables/movement-truck-stop-existing-fixture-summary-2026-08-16.csv`
- `tables/movement-terminal-station-named-retry-summary-2026-08-16.csv`
- `tables/logistics-industrial-first-pass-summary-2026-08-16.csv`
- `tables/logistics-industrial-existing-fixture-summary-2026-08-16.csv`
- `tables/logistics-industrial-public-source-summary-2026-08-16.csv`
- `tables/camp-creek-logistics-boundary-reconciliation-2026-08-16.csv`
- `tables/logistics-industrial-consolidated-summary-2026-08-16.csv`

## Role Decision

A.3 can now be used as a movement-node evidence module, not merely as a
scaffold. The module has enough reviewed evidence to distinguish three
movement roles:

- Ferry-side landing / terminal terrain: Bremerton has direct ferry terminal,
  dock, and station rows; Kingston now has direct terminal-cluster rows plus
  ferry route context.
- Depot / intermodal terrain: Perimeter has reviewed MARTA rows; Center City /
  Market East and Loop / River North now have name-constrained station-field
  rows.
- Highway / corridor service terrain: Arlington / Grand Prairie has lodging on
  top of QSR, pizza, auto-parts, and gas/convenience evidence.

The module is not ready to claim a complete logistics, truck-stop, freight, or
port-industrial layer. The existing truck-stop fixture scan produced no
packet-ready truck-stop rows. The logistics/industrial first pass adds one
Cherry Hill / Moorestown truck-service corridor-support row from an existing
Overture candidate fixture, while live OSM logistics acquisition remains
source-gated for all five bounded targets.

The public-source pass adds four packet-ready logistics/corridor rows:

- Philaport Distribution Center for South Philadelphia.
- Long Beach Container Terminal for Long Beach / Lakewood.
- Dart Grand Prairie Distribution Center for Arlington / Grand Prairie.
- Holman commercial truck-service support for Cherry Hill / Moorestown.

Camp Creek has strong airport-cargo / Atlanta Tradeport public context from ATL
and Maersk, but boundary reconciliation keeps it out of packet-ready logistics
footprint for the selected Camp Creek box. Available Tradeport / International
Parkway geocodes fall east of the Camp Creek box, and the ATL North Cargo
Building address did not geocode cleanly in this pass.

The consolidated logistics summary is now the reusable A.3 logistics read. It
records four observed packet-ready targets and one context-only Camp Creek row,
while preserving the live OSM source gate.

## Source Gates

Source-gated rows remain part of the evidence record:

- Bainbridge Island direct ferry-terminal rows remain source-gated, though
  ferry route context is present.
- University City / 30th Street direct station rows remain source-gated.
- Several first-pass truck-stop and lodging targets remain source-gated by
  Overpass timeout or rate limits.
- Live OSM logistics/industrial acquisition remains source-gated by endpoint
  rejection. Long Beach / Lakewood, Camp Creek, and Arlington / Grand Prairie
  also lack a matching local existing fixture in the first reuse pass.
- Camp Creek airport-cargo / Tradeport rows should either move to a separate
  ATL cargo / Tradeport target box or remain context-only for the current Camp
  Creek retail / power-center field.

These are source conditions, not absence claims.

## Claim Boundary

A.3 evidence supports functional analogy only: movement facilities, station
fields, ferry-terminal clusters, lodging fields, and corridor-service layers
inside bounded target boxes.

It does not establish:

- ferry catchments,
- commuter catchments,
- drive-time catchments,
- station areas,
- port authority boundaries,
- freight flow,
- route choice,
- trip purpose,
- demand,
- service adequacy,
- direct historical continuity.

## Roadmap Decision

The next work should be depth before breadth:

1. Resolve the remaining Bainbridge and University City source gates if a direct
   terminal/station claim is needed.
2. Decide whether to create a separate ATL cargo / Atlanta Tradeport target box
   before broadening the logistics frame.
3. Otherwise close A.3 as a reviewed movement-node module and move the central
   spine to the next lineage layer.
4. Keep A.3 tied to the central spine: port, landing, depot, highway corridor,
   and current enclave. Do not let the module drift into a general business
   inventory.
