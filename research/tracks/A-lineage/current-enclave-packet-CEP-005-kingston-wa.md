# CEP-005 Kingston WA Current-Enclave Packet

## Packet Role

Kingston WA is the ferry-side provisioning packet. It tests how a ferry-side
town/provisioning signal should be read alongside ferry-side movement and
service-quarter evidence without turning sparse category evidence into a
service-absence claim.

Phase 2 promotes this packet from design-only to packet-ready-with-caveat. It
is still not a clean full current-enclave stack.

## Field

- Packet id: `CEP-005`
- Field id: `kingston-wa`
- Label: Kingston WA ferry-side provisioning
- Selection role: ferry provisioning case
- Claim-ready status: packet ready with caveat

## Layer Read

Postal legibility is not scored in this packet. A.1/A.1b remains the baseline
method for addressability and civic-presence claims, but CEP-005 is a
ferry-side movement / provisioning design case.

A.2 supplies ferry-side town/provisioning evidence. Kingston has 1
packet-ready pizza/carryout row: Domino's. Phase 2 bounded provisioning
broadening also records grocery/pharmacy, gas/convenience, hardware, local
restaurant, and peripheral lodging texture. Kingston is a selective ferry-side
provisioning node, not a food-service white space.

A.3 supplies ferry-side movement evidence. The ferry route context records
Edmonds / Kingston as a WSDOT ferry-route context. The first ferry-terminal
acquisition pass source-gated, but the name-constrained retry returned 8
packet-ready rows for Kingston / Kingston Ferry Terminal / WSDOT Ferry Terminal
Kingston. Those rows should be counted as mapped terminal-cluster features, not
as distinct terminal inventory.

A.4 is scored with profile caveats in Phase 2. Finance and legal/notary texture
are observed; local tax/accounting is observed with profile caveat; insurance,
real-estate, and loan/mortgage texture are observed with locality or
office-footprint caveats. This is not a clean full-stack service-quarter score.

## Evidence Ledger

- `current-enclave-packet-CEP-005-kingston-wa-ledger-2026-08-16.csv`
- Phase 2 addenda:
  `current-enclave-kingston-service-quarter-scoring.md`,
  `current-enclave-kingston-provisioning-breadth.md`,
  `current-enclave-kingston-ferry-movement-boundary.md`,
  `current-enclave-ferry-side-control-selection.md`, and
  `current-enclave-ferry-side-full-stack-closeout.md`.

## Packet Claim

Kingston WA can be used as a caveated scored ferry-side current-enclave packet
where bounded provisioning, WSDOT route context, direct ferry-terminal retry
evidence, and caveated service-quarter texture are present inside the selected
field frame.

The packet should not be used as a clean full-stack packet, service-absence
claim, ferry catchment, route-choice claim, wait-time claim, travel-time claim,
demand model, resident identity claim, food-access claim, delivery-territory
claim, professional-service quality claim, income/wealth/credit claim, or
service-adequacy measure.

## Next Gate

Use Kingston in ferry-side comparison as a packet-ready-with-caveat case. Do
not promote to clean full-stack unless a later closeout resolves the
service-quarter profile caveats and demonstrates stronger parity with the
Bremerton ferry/town control.
