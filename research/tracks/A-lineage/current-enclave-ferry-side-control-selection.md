# Ferry-Side Control Selection

This file completes Phase 2 work item FS-004 for the ferry-side full-stack
comparison lane.

## Selection Result

Use two controls for the Kingston closeout:

1. Kitsap Mall / Silverdale as the existing light-control packet.
2. Bremerton WA as the stronger ferry/town comparison control.

Do not use Bainbridge Island, Silverdale-only pizza, or Port Orchard as the
main controls for the first closeout.

## Why Kitsap

Kitsap Mall / Silverdale is already CEP-006. It is useful because it has
observed mall/provisioning and light service-quarter texture, but only partial
movement context. That makes it the internal atlas control against Kingston's
ferry route and terminal-cluster movement layer.

## Why Bremerton

Bremerton is the stronger ferry/town control because existing A.3 and A.2
tables show both:

- direct ferry-terminal evidence from the first movement sidecar pass, and
- dense West Sound pizza/provisioning evidence.

Bremerton is not being promoted into the six-packet atlas in this step. It is
only a comparison control for deciding whether Kingston remains design-only,
becomes a caveated scored packet, or needs a distinct ferry-side role.

## Deferred Controls

Bainbridge Island remains useful but not first-choice because direct terminal
evidence was source-gated in the A.3 retry tables.

Silverdale remains useful through CEP-006 but does not supply direct ferry
movement evidence.

Port Orchard remains useful as a south Kitsap provisioning comparison, but it
does not sit in the first Kingston ferry-side closeout lane.

## Reusable Table

- `current-enclave-ferry-side-control-selection-2026-08-17.csv`

## Claim Boundary

The control selection does not claim official boundaries, ferry catchments,
commuter sheds, demand, route choice, service adequacy, retail hierarchy,
trade area, resident identity, or direct historical descent.
