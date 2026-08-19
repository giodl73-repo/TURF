# Kingston Ferry Movement Boundary

This file completes Phase 2 work item FS-003 for the ferry-side full-stack
comparison lane.

## Boundary Result

Kingston WA has enough movement evidence for the ferry-side comparison, but the
movement layer must stay narrow:

- WSDOT Edmonds / Kingston route context is packet-ready route-context
  evidence.
- The name-constrained terminal retry resolved the earlier source gate with 8
  packet-ready Kingston terminal-cluster rows.
- Those rows are mapped terminal-cluster features, not distinct terminal
  inventory.

The movement classification is:

`observed_ferry_route_and_terminal_cluster`

## Reusable Table

- `current-enclave-kingston-ferry-movement-boundary-2026-08-17.csv`

## Interpretation

This movement layer supports Kingston as a ferry-side current-enclave field
for comparison against provisioning and service-quarter texture. It does not
authorize ferry-system performance or travel-behavior claims.

For the Phase 2 ferry-side comparison, movement evidence should be used only
as a public route / terminal footprint layer. The ferry route makes Kingston a
movement node; it does not define Kingston's catchment, demand, commuter role,
travel-time experience, wait-time burden, or route-choice behavior.

## Claim Boundary

This movement boundary does not claim official ferry-terminal extent, terminal
capacity, vessel count, sailing frequency, wait time, travel time, route
choice, commuter catchment, ferry demand, visitor demand, service adequacy,
traffic impact, economic dependency, resident identity, or direct historical
descent.

## Next Gate

Proceed to FS-004: comparison-control selection. Use Kitsap Mall / Silverdale
as the existing light-control comparison and select one stronger ferry/town
control only if it is needed to decide CEP-005 status.
