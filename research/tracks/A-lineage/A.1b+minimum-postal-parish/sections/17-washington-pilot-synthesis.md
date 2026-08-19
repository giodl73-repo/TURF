# Washington Pilot Synthesis

## Reusable Output

Synthesis table:
`tables/washington-pilot-synthesis-2026-08-15.csv`.

Classifier table:
`tables/washington-minimum-stack-classification-2026-08-15.csv`.

## Pilot Read

The Washington pilot does not support a `postal_only_candidate` result after
the broader food-service pass. The Domino's / Kingston concern was directionally
right: four-brand QSR absence is too narrow for small-place classification.
Once named OSM food-service rows are included, every postal-observed target has
at least one everyday-service signal.

The bounded target-box result is:

| Class | Targets |
|---|---:|
| postal_everyday_service_minimum | 15 |
| postal_food_service_minimum | 3 |
| postal_signal_absent_or_source_gated | 2 |
| postal_only_candidate | 0 |

The three `postal_food_service_minimum` targets are:

- Clallam Bay,
- La Conner,
- Lopez Island.

These are the sparsest postal-stack survivors in the current checked pilot:
post office plus named food-service signal, with gas/convenience, dollar-store,
hardware, laundromat, grocery, and pharmacy not observed in the checked
sidecars.

## Sidecar Summary

| Sidecar | Observed | Checked Absent | Source Gated |
|---|---:|---:|---:|
| post office | 18 | 2 | 0 |
| food service | 19 | 1 | 0 |
| gas/convenience | 15 | 5 | 0 |
| dollar store | 6 | 14 | 0 |
| hardware | 5 | 15 | 0 |
| laundromat | 0 | 20 | 0 |

Darrington and Mesa remain outside postal minimum-stack classification because
the bounded post-office sidecar is checked absent for both. Their observed
everyday-service rows are still useful texture, but not postal-stack proof.

## Implication

For A.1b, the useful next claim is not "post-office-only parishes exist in this
pilot." The stronger pilot claim is:

> In sparse Washington target boxes selected from one-layer chain evidence,
> postal-observed candidates usually carry at least named food-service signal,
> and most carry two or more everyday-service signals.

This supports a minimum-stack typology, but it does not identify the smallest
postal parish nationally.

## Boundary

This synthesis is bounded to 20 Washington target boxes. It does not define
city, ZIP, ZCTA, CDP, county, postal-locality, trade-area, catchment, service
adequacy, customer behavior, income, spending, or national smallest-place
coverage.
