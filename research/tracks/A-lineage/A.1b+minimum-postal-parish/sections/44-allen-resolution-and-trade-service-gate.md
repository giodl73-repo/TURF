# Allen Resolution And Trade-Service Gate

## Reusable Output

Updated evidence table:
`tables/south-dakota-depth-review-open-sources-2026-08-16.csv`.

Updated decision table:
`tables/south-dakota-depth-review-decision-2026-08-16.csv`.

Updated typology:
`tables/minimum-stack-typology.csv`.

## Allen Resolution

Allen no longer remains geocode-gated. Alternate open sources identify Pass
Creek Market, formerly Allen Store, at 104 E Dance Rd. The directory map link
resolves to `43.281374, -101.925532`, inside the sampled Allen target box.

The U.S. EPA Region 8 Tribal UST workbook independently supports the same
store identity and address, listing Pass Creek Market (FKA Allen Store) with a
currently-in-use diesel/gasoline tank at 104 E. Dance Road.

Decision: Allen is rejected as a postal-only candidate under depth review and
becomes a postal everyday-service minimum candidate if the classifier is later
backfilled from local-directory evidence.

## Trade-Service Gate

Badger remains different from Allen. Badger Oil is inside the sampled target
box, but the alternate source supports automotive repair, bulk petroleum, mower
sales, and storefront retail rather than food-service or consumer
gas/convenience.

The taxonomy now adds `postal_trade_service_minimum` for this narrow case:
post office plus a non-food local trade-service storefront.

This class should stay separate from:

- `postal_food_service_minimum`,
- `postal_gas_minimum`,
- `postal_grocery_pharmacy_minimum`,
- `postal_everyday_service_minimum`.

That separation matters because Badger-like evidence weakens a pure
postal-only claim, but it does not prove the consumer everyday-service stack
that food, grocery, pharmacy, or gas/convenience layers imply.

## Decision

After Allen resolution and the trade-service taxonomy gate, South Dakota has:

- one strict postal-only target-box survivor: Artesian,
- five rejected everyday-service cases: Alcester, Alexandria, Allen, Astoria,
  Avon,
- one trade-service taxonomy case: Badger.

## Boundary

This gate may refine South Dakota candidate status and A.1b typology. It may
not claim South Dakota frequency, Great Plains frequency, national frequency,
service adequacy, trade areas, catchments, income, spending, customer behavior,
or complete local-commerce coverage.
