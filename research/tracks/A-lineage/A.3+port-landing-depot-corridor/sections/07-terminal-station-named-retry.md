# Terminal / Station Named Retry

## Scope

This pass retries the source-gated terminal and station targets from the first
A.3 movement-sidecar pass with name-constrained Overpass queries.

Outputs:

- `tables/osm-movement-terminal-station-named-retry-review-2026-08-16.csv`
- `tables/osm-movement-terminal-station-named-retry-source-gates-2026-08-16.csv`
- `tables/movement-terminal-station-named-retry-summary-2026-08-16.csv`

## Result

The retry checked five target-layer pairs:

- Kingston WA ferry terminal: fetched 8 packet-ready OSM rows.
- Bainbridge Island WA ferry terminal: source-gated by timeout.
- Center City / Market East transit-center field: fetched 9 packet-ready OSM
  rows.
- University City / 30th Street transit-center field: source-gated by rate
  limiting.
- Loop / River North transit-center field: fetched 14 packet-ready OSM rows.

The fetched rows are raw OSM features. They should not be read as distinct
terminal or station inventories. Kingston, for example, has multiple mapped
components around the same ferry-terminal cluster. Center City and Loop /
River North likewise return several related station, transit-center, and
terminal rows inside dense downtown movement fields.

## Read

Kingston now has direct terminal evidence to pair with the WSDOT ferry route
context and the A.2 provisioning read that found Domino's and other QSR
coverage. That makes Kingston a better ferry-side movement-node example than a
simple sparse-service or postal-only example.

Center City / Market East and Loop / River North now have direct station-field
evidence. They strengthen the depot/intermodal branch of A.3 because the
observed rows sit in current dense downtown movement terrain rather than in a
single-store retail or civic-service frame.

Bainbridge Island and University City / 30th Street remain unresolved in this
pass. Their source-gated status is a source condition, not an absence claim.

## Next Gate

Resolve the two remaining direct terminal/station gates before broadening:

1. Retry Bainbridge Island with an even smaller terminal box or alternate
   Overpass endpoint.
2. Retry University City / 30th Street with a station-specific box after rate
   limiting clears.
3. Review whether the resolved Kingston, Center City, and Loop / River North
   rows should be folded into the combined A.3 sidecar summary or kept as a
   separate cleanup pass.

Do not open the logistics/industrial sidecar until the terminal/station cleanup
has a reviewed role boundary.

## Claim Boundary

This pass establishes named public terminal/station feature rows inside bounded
target boxes. It does not establish ferry catchments, commuter catchments,
station areas, transfer volume, trip purpose, route choice, terminal capacity,
or service adequacy.
