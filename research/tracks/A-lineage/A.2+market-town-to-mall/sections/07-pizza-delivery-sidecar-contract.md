# Pizza Delivery Sidecar Contract

## Purpose

The Kingston Domino's example turns a category boundary into a reusable A.2
test. A four-brand QSR layer can say that a place is single-brand or sparse
without saying that food-service provisioning is absent. Pizza delivery and
carryout chains should therefore sit beside QSR as a town-service and
highway-node sidecar.

Reusable contract:
`tables/pizza-delivery-sidecar-contract.csv`.

## Spine Placement

Pizza delivery belongs in the central spine as current provisioning terrain:

- town provisioning node,
- ferry-side selective node,
- highway-service node,
- dense same-category food-service grid when multiple pizza chains co-locate.

This is broader than A.1b's postal-parish minimum stack. In A.2, the same
sidecar can help distinguish a historic town center, ferry landing, depot
corridor, or highway strip from a mall-only retail field.

## Initial Brands

The initial contract keeps the existing A.1b brand set so acquisition code can
be reused:

- Domino's,
- Pizza Hut,
- Papa Johns,
- Little Caesars,
- Papa Murphy's.

Domino's is priority 1 because it is the user-raised Kingston example and has
an official current Kingston WA location page:
https://pizza.dominos.com/washington/kingston/8208-ne-state-hwy-104-suite-107

Papa Murphy's remains priority 2 because take-and-bake is a useful provisioning
signal but should not be merged into prepared QSR without a visible distinction.

## Acquisition Path

The existing OSM civic fetcher already supports `pizza_delivery` with matching
tags for fast food, restaurant, and pizza shops plus brand/operator/name regex
filters. For A.2, the first pass should run against selected town, ferry-side,
and highway-node boxes rather than against a full postal denominator.

Recommended first comparison set:

- Kingston and Bainbridge Island as ferry-side selective nodes,
- Bremerton, Poulsbo, Silverdale, and Port Orchard as West Sound dense-grid
  controls,
- Arlington / Grand Prairie as a highway-service and daily-trip stack control,
- one Atlanta exurban ring node as a continuity contrast.

## Claim Boundary

The sidecar reports public chain-location presence. It must not infer delivery
territories, actual delivery availability, customer access, customer behavior,
food access, affordability, local quality, demand, route choice, or service
adequacy.

The useful claim is narrower: Domino's-style evidence can prevent TURF from
mistaking a sparse four-brand QSR reading for food-service absence.
