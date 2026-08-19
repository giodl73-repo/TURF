# QSR Scope Gap

## Finding

The Washington pilot's current QSR signal is narrower than everyday
food-service reality. The checked TURF QSR layer for Washington includes only
four exact-brand patterns:

- McDonald's,
- Burger King,
- Wendy's,
- Taco Bell.

That contract was useful for earlier cross-metro comparison because the brands
are common, recognizable, and easy to review. It is not enough for A.1b minimum
postal parish classification.

## Kingston Example

Kingston is the clear scope warning. TURF already sees Kingston in the current
four-brand QSR layer through a packet-ready McDonald's row. It also has grocery,
auto-parts, and gas/convenience signal in other checked TURF layers, so it is
not part of the current sparse one-layer candidate queue.

But Domino's lists a Kingston store at `8208 NE State Hwy 104 Suite 107`. That
store is outside the current four-brand QSR extraction contract.

Reusable table:
`tables/washington-qsr-scope-gap-examples.csv`.

## Pilot Impact

A.1b should not treat `qsr = 0` in the current candidate queue as checked QSR
absence. It means only that the four-brand QSR layer has no row. Before any
minimum-stack classification, the pilot needs one of these:

- broaden the QSR sidecar to include pizza/delivery chains such as Domino's,
  Pizza Hut, Papa Johns, and Little Caesars, or
- add a separate `pizza_delivery` everyday-service sidecar.

Until then, `postal_only_candidate` and `postal_gas_minimum` labels are
especially risky because omitted pizza/delivery rows could be the actual
everyday food-service signal in small places.
