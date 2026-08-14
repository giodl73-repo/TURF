# Washington Pilot Design

## Why Washington First

Washington is the best first A.1b pilot because TURF already has multiple
checked statewide chain layers:

| Layer | Packet-Ready Rows |
|---|---:|
| QSR | 606 |
| Grocery | 394 |
| Pharmacy / drugstore | 38 |
| Mass retail | 115 |
| Auto parts | 507 |
| Home improvement | 92 |

Washington also gives useful geography variety: ferry communities, islands,
mountain towns, county seats, highway stops, agricultural towns, and small
unincorporated or postal-locality-style places.

## Current Candidate Signal

The first rollup uses city labels from existing reviewed Washington chain
layers. It does not include statewide post-office evidence yet.

Reusable table:
`tables/washington-chain-sparse-city-candidates.csv`.

The current sparse-city candidates are not final minimum postal parishes. They
are a target queue for post-office verification and place-context review.

Examples from the queue:

- Bingen: auto-parts-only in the current stack.
- Cathlamet: auto-parts-only in the current stack.
- Clallam Bay: auto-parts-only in the current stack.
- Clinton: grocery-only in the current stack.
- Darrington: auto-parts-only in the current stack.
- Forks: auto-parts-only in the current stack.
- Friday Harbor: auto-parts-only in the current stack.
- La Conner: auto-parts-only in the current stack.
- Loon Lake: home-improvement-only in the current stack.
- Mattawa: auto-parts-only in the current stack.

## Pilot Hypothesis

Some sparse Washington city/postal labels may become:

- `postal_only_candidate` after post-office fetch if no national-chain sidecar
  is observed in the pilot stack,
- `postal_qsr_minimum` where QSR is the only observed chain sidecar,
- `postal_gas_minimum` where gas/convenience is the only observed everyday
  service sidecar,
- `postal_grocery_pharmacy_minimum` where grocery or pharmacy is the only
  observed everyday-service layer,
- `postal_everyday_service_minimum` where two or more everyday-service sidecars
  appear but no larger market-center stack exists.

## Required Next Data Step

Create a bounded target file for the sparse candidate places and fetch/review:

- post office,
- gas/convenience,
- dollar store,
- QSR if not already covered by reviewed Overture rows,
- grocery/pharmacy if not already covered by reviewed Overture rows.

The pilot should preserve three states for every candidate:

- observed,
- checked absent,
- source gated.

## Boundary

This pilot design may say that current Washington reviewed chain data surfaces
sparse city labels worth testing. It may not say that any listed place is a
minimum postal parish until post-office and place-context evidence are checked.
