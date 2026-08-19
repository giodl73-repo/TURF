# Current Enclave Claim-Packet Design

This design turns the central spine into a small selected-field atlas. The
packet is intentionally narrow: it tests whether A.1/A.1b, A.2, A.3, and A.4
can be read together without restarting broad post-office, national, or generic
business-service expansion.

## Packet Rule

Each selected field must state:

- the selected field and packet id,
- why the field was selected,
- whether postal legibility is observed, not scored, or out of scope,
- whether provisioning / market evidence is observed, partial, or source-gated,
- whether movement / corridor evidence is observed, partial, context-only, or
  source-gated,
- whether service-quarter evidence is full, caveated, profile-gap, light
  control, not scored, or out of scope,
- the exact claim boundary.

No packet may convert a profile gap into an absence claim. No packet may infer
resident identity, demographics, service adequacy, catchment, demand, spending,
trip purpose, freight volume, professional quality, or individual behavior.

## Selected Fields

The first manifest uses six high-information cases:

- Long Beach / Lakewood: full stack case with provisioning, movement/logistics,
  and full service-quarter texture.
- Arlington / Grand Prairie: highway-service case with provisioning,
  corridor-service, bounded logistics support, and full service-quarter texture.
- Cherry Hill / Moorestown: highway-service case with partial movement /
  truck-service support and full service-quarter texture.
- Loop / River North: depot/intermodal and service-quarter profile-gap case.
- Kingston WA ferry-side provisioning: movement/provisioning design case, with
  A.4 not scored.
- Kitsap Mall / Silverdale: mall/provisioning and light service-quarter control.

## Reusable Tables

- `current-enclave-claim-packet-schema-2026-08-16.csv`
- `current-enclave-selected-field-manifest-2026-08-16.csv`

## Next Gate

CEP-001 Long Beach / Lakewood, CEP-002 Arlington / Grand Prairie, CEP-003
Cherry Hill / Moorestown, CEP-004 Loop / River North, CEP-005 Kingston WA, and
CEP-006 Kitsap Mall / Silverdale are drafted and closed as the first
selected-field atlas packet set.

Reusable drafted packets:

- `current-enclave-packet-CEP-001-long-beach-lakewood.md`
- `current-enclave-packet-CEP-001-long-beach-lakewood-ledger-2026-08-16.csv`
- `current-enclave-packet-CEP-002-arlington-grand-prairie.md`
- `current-enclave-packet-CEP-002-arlington-grand-prairie-ledger-2026-08-16.csv`
- `current-enclave-packet-CEP-003-cherry-hill-moorestown.md`
- `current-enclave-packet-CEP-003-cherry-hill-moorestown-ledger-2026-08-16.csv`
- `current-enclave-packet-CEP-004-loop-river-north.md`
- `current-enclave-packet-CEP-004-loop-river-north-ledger-2026-08-16.csv`
- `current-enclave-packet-CEP-005-kingston-wa.md`
- `current-enclave-packet-CEP-005-kingston-wa-ledger-2026-08-16.csv`
- `current-enclave-packet-CEP-006-kitsap-mall-silverdale.md`
- `current-enclave-packet-CEP-006-kitsap-mall-silverdale-ledger-2026-08-16.csv`
- `current-enclave-first-atlas-closeout.md`
- `current-enclave-first-atlas-closeout-2026-08-16.csv`

## Claim Boundary

The claim packet is an observable current-enclave stack. It is not an official
boundary, lived identity, demographic profile, service adequacy measure,
catchment, demand model, traffic model, spending estimate, freight-flow
estimate, professional-quality judgment, or individual-behavior inference.
