# Logistics / Industrial Sidecar Contract

## Scope

This contract defines how broad logistics and industrial evidence may enter
A.3. It exists because generic industrial search is too noisy for the central
spine unless each row has an explicit movement role.

Outputs:

- `tables/logistics-industrial-sidecar-contract.csv`
- `tables/logistics-industrial-sidecar-targets.csv`

## Contract

The logistics/industrial sidecar can accept rows only when the row has an
explicit role in one of five signal families:

- warehouse / distribution,
- port-industrial support,
- airport cargo support,
- rail intermodal support,
- highway freight service.

Generic industrial buildings, self-storage, office parks, contractor yards,
ordinary car services, passenger-only terminals, waterfront restaurants, and
event venues do not qualify as logistics/industrial rows. They may still be
useful context in other layers, but they cannot carry this sidecar.

## Target Set

The first target set is deliberately narrow:

- South Philadelphia Sports / Port field.
- Long Beach / Lakewood field.
- Camp Creek field.
- Arlington / Grand Prairie field.
- Cherry Hill / Moorestown field.

These targets cover port/event, airport-edge, highway/corridor, and mall-edge
controls without turning A.3 into a general business inventory.

## Read

This is the correct depth-before-breadth gate. A.3 already has reviewed ferry,
station, transit, lodging, QSR, pizza, gas/convenience, and auto-parts context.
The missing layer is not more raw breadth; it is a defensible rule for when
industrial footprint is actually movement infrastructure.

The contract keeps the central spine intact:

- port/event fields require port-industrial or warehouse/distribution proof,
- airport-edge fields require cargo or logistics proof, not airport proximity,
- highway nodes require truck/freight-service proof, not ordinary car-trip
  retail,
- depot/intermodal fields require rail freight or transload proof, not
  passenger-station proof.

## Next Gate

Run the first logistics/industrial acquisition only against the five bounded
targets in `tables/logistics-industrial-sidecar-targets.csv`. Preserve source
gates beside the review table, and classify every ambiguous row as either
`source_gated` or `exclude` rather than promoting it into packet evidence.

## Claim Boundary

This contract supports only facility-footprint evidence. It does not establish
freight flow, truck counts, container volume, cargo tonnage, employment,
supply-chain importance, catchment, route choice, trip purpose, demand, or
service adequacy.
