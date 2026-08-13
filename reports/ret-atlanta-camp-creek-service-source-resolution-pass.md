# Atlanta Camp Creek Service Source Resolution Pass

## Scope

This pass targets the last Atlanta source-limited comparison row, Camp Creek,
across everyday and civic/service layers:

- transit center
- park / open space
- bank / credit union
- gas / convenience
- dollar store
- hardware
- laundromat

Generated and refreshed outputs:

```text
reports/ret-atlanta-anchor-field-bank-credit-union-summary.csv
reports/ret-atlanta-anchor-field-gas-convenience-summary.csv
reports/ret-atlanta-anchor-field-hardware-summary.csv
reports/ret-atlanta-anchor-field-transit-summary.csv
reports/ret-atlanta-anchor-field-context-summary.csv
reports/ret-atlanta-pre-scale-readiness.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Result

Camp Creek now has five packet-ready bank rows: Bank of America, Regions Bank,
SunTrust, Truist, and Wells Fargo.

Camp Creek also has two packet-ready gas / convenience rows: Exxon and
RaceTrac. One unnamed trip-anchor row remains excluded.

Transit center and hardware returned no packet-ready rows, so both layers are
checked absent for Camp Creek. Park/open-space, dollar store, and laundromat
timed out and remain source-gated.

## Profile Impact

Camp Creek moves from one observed dimension and seven source-gated dimensions
to three observed dimensions and three source-gated dimensions. It is now a
`usable_comparison_field` locally and a `type_discovery_partial` row in the
cross-metro profile.

The field is no longer wellness-only. Its current label is
`finance_car_trip_wellness_airport_edge_field`, which better captures the
observed combination: airport-edge finance, car-trip service, and gym signal
with checked postal, library, transit, hardware, and pharmacy absences.

## Next Step

The before-more-metros source-resolution gate has materially improved. Atlanta
has no source-limited comparison rows, Chicago has one partial field, and Dallas
has one partial field. The next decision can either resolve Old Orchard / Skokie
or Las Colinas / Irving, or accept those explicit partial rows and choose the
fifth metro by settlement pattern.
