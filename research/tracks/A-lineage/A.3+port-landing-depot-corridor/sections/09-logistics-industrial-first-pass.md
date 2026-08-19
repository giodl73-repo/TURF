# Logistics / Industrial First Pass

## Scope

This pass applies the logistics/industrial sidecar contract to the five bounded
A.3 targets.

Outputs:

- `tables/osm-logistics-industrial-first-pass-review-2026-08-16.csv`
- `tables/osm-logistics-industrial-first-pass-source-gates-2026-08-16.csv`
- `tables/logistics-industrial-first-pass-summary-2026-08-16.csv`
- `tables/overture-logistics-industrial-existing-fixture-review-2026-08-16.csv`
- `tables/logistics-industrial-existing-fixture-summary-2026-08-16.csv`

## Live OSM Gate

The live Overpass acquisition was attempted against all five bounded targets
with explicit logistics/industrial tag and name filters. The main Overpass
endpoint rejected even minimal test queries with `406 Not Acceptable`; the
alternate endpoint timed out on a minimal test query.

The OSM pass therefore records five source-gated rows and no absence claims.

## Existing Fixture Reuse

The local fixture reuse pass used
`reports/ret-philadelphia-anchor-field-retail-complex-candidates.csv`, which
covers the South Philadelphia Sports / Port and Cherry Hill / Moorestown target
boxes.

Six candidate rows matched the logistics/industrial name screen:

- South Philadelphia Sports / Port: 4 reviewed rows, all excluded.
- Cherry Hill / Moorestown: 2 reviewed rows, 1 packet-ready and 1 excluded.

The packet-ready row is Holman Truck Center in Maple Shade NJ. It is accepted
only as explicit truck-service / corridor-support footprint evidence. It is not
a truck-count, freight-flow, route-choice, or demand claim.

Excluded South Philadelphia rows show why the contract is necessary:

- sports-health false positives,
- passport-service false positive,
- driver-license public-service false positive,
- sports-district administration false positive.

## Read

The logistics/industrial layer remains shallow. The first useful packet-ready
signal is a Cherry Hill / Moorestown highway-corridor truck-service row, not a
port-industrial or freight-flow layer.

South Philadelphia does not gain logistics/industrial packet evidence from the
existing retail-complex fixture. That is a fixture-level checked absence after
exclusions, not a complete South Philadelphia logistics absence.

Long Beach / Lakewood, Camp Creek, and Arlington / Grand Prairie remain
source-gated for this sidecar because no matching existing fixture was available
in this pass and live Overpass was unavailable.

## Next Gate

Use non-Overpass public sources for the next logistics pass:

1. Public port or industrial district pages for South Philadelphia and Long
   Beach / Lakewood.
2. Airport cargo or industrial district pages for Camp Creek.
3. Truck terminal, distribution, or logistics park sources for Arlington /
   Grand Prairie and Cherry Hill / Moorestown.

Keep every row inside the existing five-target frame until the false-positive
rate is lower.

## Claim Boundary

This pass supports facility-footprint evidence only. It does not establish
freight flow, truck counts, container volume, cargo tonnage, employment,
supply-chain importance, catchment, route choice, trip purpose, demand, or
service adequacy.
