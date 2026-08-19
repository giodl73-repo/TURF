# Kingston Service-Quarter Scoring

This file completes Phase 2 work item FS-001 for the ferry-side full-stack
comparison lane.

## Scoring Result

Kingston WA now has a scored A.4 service-quarter layer. The result is not a
clean full-stack upgrade. It is a caveated service-quarter texture:

- finance is observed through direct Kingston bank and credit-union branches,
- local tax/accounting is observed, but not through the original exact-brand
  tax-prep profile,
- insurance is observed as local/regional agency texture, with storefront
  locality caveats,
- legal/accounting/notary is observed through Kingston legal and notary
  sources,
- real estate is observed as local agent / real-estate-service texture, with
  office-footprint caveats,
- loan/mortgage is observed as chamber-listed mortgage texture, with
  office-footprint caveats.

## Reusable Tables

- `current-enclave-kingston-service-quarter-scoring-2026-08-17.csv`
- `current-enclave-kingston-service-quarter-source-review-2026-08-17.csv`

## Interpretation

This changes CEP-005 from "A.4 not scored" to "A.4 scored with caveats" for
future ferry-side comparison work. It does not by itself promote CEP-005 to a
clean full-stack packet.

The best current classification is:

`ferry_side_service_quarter_scored_with_profile_caveats`

That classification is useful because it shows Kingston is not merely a
Domino's-plus-ferry design example. It has public-facing paperwork, finance,
legal/notary, real-estate, and loan/mortgage texture. The caveat is that some
of those layers are not as cleanly bounded to direct storefront evidence as the
stronger A.4 full-stack controls.

## Claim Boundary

This scoring uses public business-footprint evidence only. It does not infer
professional quality, customer identity, demand, service adequacy, income,
wealth, credit, insurance risk, mortgage volume, transaction volume, catchment,
resident identity, route choice, ferry demand, or direct historical descent.

## Next Gate

Proceed to FS-002: Kingston bounded provisioning broadening. That should test
grocery/pharmacy, gas/convenience, lodging, QSR/pizza, and everyday town
services only where those categories affect the ferry-side comparison.
