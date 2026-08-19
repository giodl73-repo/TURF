# Two-State Pilot Synthesis

## Reusable Output

Synthesis table:
`tables/two-state-minimum-postal-parish-synthesis-2026-08-15.csv`.

Washington classifier:
`tables/washington-minimum-stack-classification-2026-08-15.csv`.

Georgia classifier:
`tables/georgia-minimum-stack-classification-2026-08-15.csv`.

## Result

The Washington and Georgia pilots now cover 40 bounded sparse-chain target
boxes. Twenty target boxes have observed post-office evidence and twenty are
post-office checked absent in the bounded pass.

| Pilot | Target Boxes | Post Office Observed | Food-Service Minimum | Everyday-Service Minimum | Postal Only |
|---|---:|---:|---:|---:|---:|
| Washington | 20 | 18 | 3 | 15 | 0 |
| Georgia | 20 | 2 | 2 | 0 | 0 |
| Combined | 40 | 20 | 5 | 15 | 0 |

Among the 20 postal-observed target boxes, every classified target has at least
one named food-service sidecar. Five are food-service minimums, and fifteen
have two or more everyday-service sidecars.

## Read

The two-state pilot does not confirm the initial `post office only` intuition.
The stronger bounded read is that sparse postal candidates in these two states
bottom out at post office plus food-service, not post office alone.

Georgia is especially useful because both postal-observed targets entered the
queue through auto-parts-only sparse-chain evidence, yet both still had named
food-service rows when the broader OSM map API evidence path was used. That
echoes the Kingston Domino's lesson from Washington: narrow national-chain QSR
layers can miss small-place food-service anchors.

The two-state result supports a refined A.1b typology:

- `postal_food_service_minimum` is the current sparsest confirmed class.
- `postal_everyday_service_minimum` is the common Washington outcome.
- `postal_only_candidate` remains a hypothetical class, not observed in these
  two bounded pilots.

## Next Gate

The next useful move is not a national claim. It is either:

- a third-state pilot chosen from a different regional/store-data profile, or
- a national sampled post-office frame with explicit OSM/API fallback rules for
  food-service checks.

Either path should preserve the bounded target-box method, the checked-absent
versus source-gated distinction, and the broader food-service sidecar before
claiming any postal-only minimum.

## Boundary

This synthesis may compare the Washington and Georgia bounded pilots and say no
postal-only candidate survived among 20 postal-observed target boxes. It may not
claim national frequency, smallest postal parish, service adequacy, complete
restaurant inventory, ZIP/ZCTA/CDP/county coverage, trade areas, or catchments.
