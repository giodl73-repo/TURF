# Truth Dossier Synthesis

## Reusable Output

Synthesis builder:
`scripts/build_a1b_truth_dossier_synthesis.py`.

Candidate-class synthesis:
`tables/a1b-truth-dossier-synthesis-2026-08-16.csv`.

Decision gate:
`tables/a1b-truth-dossier-decision-gate-2026-08-16.csv`.

Source index:
`tables/a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv`.

## Question

After the 9 numerator-eligible postal-only candidates have truth dossiers,
what claim language is allowed, and what is still blocked?

## Result

The 9-dossier queue is complete:

- Alum Bridge WV, Artesian SD, Carpenter WY, Union Church MS, Clam Gulch AK,
  Aquilla TX, and Mountain Home TX are strict target-box survivors with nearby
  consumer-service constraints,
- Amistad NM is a strict target-box survivor with a nearby trade-service
  constraint,
- Valley Park MS is a strict target-box survivor with an outside-box
  consumer-service constraint.

That yields three candidate classes:

- `strict_target_box_survivor_with_nearby_service_constraint`: 7,
- `strict_target_box_survivor_with_nearby_trade_service_constraint`: 1,
- `strict_target_box_survivor_with_outside_service_constraint`: 1.

## Allowed Language

The completed dossiers allow target-box language only:

- nine candidates may be described as strict sampled target-box survivors,
- Clayville is excluded from the current clean denominator and numerator until
  the postal operations-status gate is resolved,
- Alum Bridge may be used only as a lead constrained example because Somerville
  Exxon & Grocery in nearby Linn must travel with any narrative use.

## Blocked Language

The completed dossiers still block:

- complete service absence,
- catchment isolation,
- service adequacy,
- trade areas,
- regional frequency,
- national frequency,
- smallest postal parish.

## Decision Gate

The next research move is synthesis-to-scale:

- use the 9 completed dossiers as exemplar classes,
- keep the repaired denominator at bounded `9/128`,
- add another breadth wave or a formal sampled-frequency design before any
  regional, stratum, or national frequency claim.

## Boundary

This synthesis may classify the 9 completed truth dossiers and define
allowed target-box language. It may not claim complete service absence,
catchment isolation, service adequacy, trade areas, regional frequency,
national frequency, income, spending, or customer behavior.
