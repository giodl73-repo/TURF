# Ferry-Side Full-Stack Comparison Launch

The next Track A depth lane is ferry-side full-stack comparison, centered first
on Kingston WA.

## Launch Claim

Kingston is currently a design-only packet. Phase 2 will test whether it can be
scored as a ferry-side full-stack current-enclave field without making service
absence, ferry catchment, demand, or delivery-territory claims.

## Existing Evidence

CEP-005 already gives the launch base:

- A.2 thin provisioning: Kingston has a Domino's pizza/carryout row, which
  blocks a sparse four-brand QSR read from becoming food-service absence.
- A.3 ferry movement: WSDOT Edmonds / Kingston route context is present.
- A.3 terminal footprint: the name-constrained terminal retry returned
  Kingston terminal-cluster rows, counted as mapped features rather than
  distinct terminal inventory.
- A.4 service quarter: not scored.

## Phase 2 Progress

FS-001 is complete in `current-enclave-kingston-service-quarter-scoring.md`.
Kingston now has A.4 scoring with profile caveats. The score supports
ferry-side comparison, but it does not by itself promote CEP-005 to a clean
full-stack packet.

FS-002 is complete in `current-enclave-kingston-provisioning-breadth.md`.
Kingston now has bounded provisioning breadth beyond Domino's, including
grocery/pharmacy, gas/convenience, hardware, local restaurant, pizza/QSR, and
peripheral lodging texture.

FS-003 is complete in `current-enclave-kingston-ferry-movement-boundary.md`.
Kingston movement evidence is classified as observed ferry route plus terminal
cluster, with route/catchment/demand/performance claims excluded.

FS-004 is complete in `current-enclave-ferry-side-control-selection.md`. The
closeout controls are Kitsap Mall / Silverdale as the internal light-control
packet and Bremerton WA as the stronger ferry/town comparison control.

FS-005 is complete in `current-enclave-ferry-side-full-stack-closeout.md`.
CEP-005 Kingston WA is promoted from design-only to
packet-ready-with-caveat for ferry-side comparison, but clean full-stack
promotion is rejected.

## Workplan

1. Score Kingston against the A.4 service-quarter categories already used in
   the first atlas: finance, tax prep, insurance, legal/accounting/notary,
   real estate, and loan/mortgage.
2. Broaden bounded Kingston provisioning beyond Domino's only where it affects
   the ferry-side comparison: grocery/pharmacy, gas/convenience, QSR/pizza,
   lodging, and everyday town services.
3. Keep ferry movement limited to route/terminal footprint evidence. Do not
   model ferry catchment, demand, route choice, wait time, or travel time.
4. Compare Kingston to Kitsap Mall / Silverdale and one stronger ferry/town
   control only after Kingston scoring is complete.
5. Close with a packet decision: keep CEP-005 design-only, promote it to a
   caveated scored packet, or create a separate ferry-side packet role.

## Required Outputs

- Kingston A.4 scoring table: complete.
- Kingston provisioning-breadth table: complete.
- Ferry-side movement boundary: complete.
- Comparison-control selection: complete.
- Ferry-side comparison closeout: complete.
- Updated CEP-005 packet: complete.

## Stop Rule

Stop after Kingston scoring if the field remains thin by design and no packet
status change is supported. Do not drift into a broad ferry-town census.
