# Acquisition Plan

This module should begin with a bounded pilot before any national run.

## Pilot Shape

Recommended first pilot:

- one rural-heavy state,
- one mixed rural/metro state,
- one ferry/island or mountain-state contrast if source access is practical.

Candidate evidence stack:

- public post-office points,
- ZIP/ZCTA or postal-locality context,
- QSR brands from existing exact-brand patterns, plus a widened
  pizza/delivery sidecar or broader small-place QSR review,
- gas/convenience brands from the existing sidecar pattern,
- dollar-store brands,
- grocery/pharmacy exact-brand layers,
- Census place and county context.

## Minimum Stack Classes

The first classifier should assign conservative labels:

- `postal_only_candidate`
- `postal_qsr_minimum`
- `postal_gas_minimum`
- `postal_dollar_store_minimum`
- `postal_grocery_pharmacy_minimum`
- `postal_everyday_service_minimum`
- `postal_signal_absent_or_source_gated`

## Pilot Outputs

The first evidence pass should produce:

- a checked CSV of candidate minimum postal parishes,
- counts by state, county, place type, and minimum stack class,
- top examples with source links and checked-absence/source-gate notes,
- a source-policy note for any post-office source used,
- a role review before national scaling.

## Stop Conditions

Do not scale nationally if:

- post-office source licensing is unclear,
- rural source coverage is too uneven to distinguish absence from source gap,
- national-chain layers miss too much local-service reality,
- place context cannot distinguish city, CDP, unincorporated locality, ZIP,
  ZCTA, county, and postal name.
