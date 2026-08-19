# Pizza Delivery Sidecar

## Why This Sidecar Exists

The Domino's / Kingston example should not be folded silently into the existing
QSR column. The current QSR layer is a four-brand comparison layer. Pizza
delivery and carryout chains behave differently: they can appear in small ferry
towns, county seats, highway stops, and sparse postal places that do not have a
deep burger/taco QSR grid.

For A.1b, that makes pizza delivery an everyday-service sidecar.

## Contract

Reusable sidecar contract:
`tables/pizza-delivery-sidecar-contract.csv`.

Initial brands:

- Domino's,
- Pizza Hut,
- Papa Johns,
- Little Caesars,
- Papa Murphy's as a lower-priority take-and-bake distinction.

The sidecar should report store presence only. It must not infer delivery
coverage, customer access, food access, affordability, demand, local quality, or
service adequacy.

## Seed Evidence

Reusable seed table:
`tables/washington-pizza-delivery-seed-review-2026-08-15.csv`.

The first seed row is Domino's in Kingston, Washington. It is included because
the official Domino's store page lists a Kingston store while TURF's current
four-brand QSR layer does not include Domino's.

This seed row is not a statewide pizza layer. It is a contract-proving example
that blocks `qsr_absent` and `postal_only_candidate` claims from relying on the
four-brand QSR layer alone.

## Pilot Rule

For A.1b classification:

- `qsr = 0` means only `four_brand_qsr_absent`,
- `pizza_delivery = unknown` blocks `postal_only_candidate`,
- observed pizza delivery counts as an everyday food-service sidecar,
- pizza delivery plus post office may support a `postal_qsr_minimum`-style
  food-service minimum, but the output should preserve the sidecar name rather
  than hide it inside generic QSR.

## Next Acquisition Step

Build a target-box query or reviewed source pass for the 20 Washington A.1b
targets using the sidecar contract. If the source is Overture, the brand
patterns must be reviewed for false positives such as street names, restaurant
names containing "pizza" but not target brands, and stale/closed listings. If
the source is public brand locator pages, source policy should approve whether
the pass is a seed check or a scalable acquisition path.
