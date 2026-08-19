# Sampled Frequency Design

## Reusable Output

Sampled-frequency design contract:
`tables/a1b-sampled-frequency-design-contract-2026-08-16.csv`.

Readiness gates:
`tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`.

Supporting artifacts:

- `tables/a1b-denominator-eligibility-rows-2026-08-16.csv`,
- `tables/a1b-denominator-recomputed-summary-2026-08-16.csv`,
- `tables/a1b-denominator-exclusion-ledger-2026-08-16.csv`,
- `tables/a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv`,
- `tables/a1b-truth-dossier-synthesis-2026-08-16.csv`,
- `tables/a1b-frequency-treatment-options-2026-08-16.csv`,
- `tables/a1b-frequency-language-decision-gate-2026-08-16.csv`.

## Purpose

The completed truth-dossier synthesis gives target-box candidate classes. This
section defines the minimum design contract for bounded selected-wave share
language and the gates that still block regional, stratum, or national
frequency language.

## Estimand

The only currently allowed estimand is descriptive:

bounded sampled target-box share of eligible public-post-office rows by
candidate class.

That is the expanded `9/128` denominator with truth-dossier class constraints
attached. It is not a probability estimate, and it is not a claim about
complete service absence or catchment isolation.

## Required Gates

Passing:

- manifest-driven denominator builder,
- denominator validator,
- exclusion ledger,
- complete truth dossiers,
- truth-dossier synthesis,
- selected breadth-wave execution,
- bounded selected-wave frequency treatment.

Still blocked for regional or national frequency claims:

- probability-sample treatment,
- weighting or finite-population inference,
- full-frame national enumeration,
- full-frame stratum enumeration.

## Allowed Output

Current output may say:

- the bounded 12-manifest-row integrated sample has 128 clean eligible denominator rows after
  gates,
- 9 rows are numerator-eligible target-box candidates,
- the 9 candidates classify into seven strict survivors with nearby
  consumer-service constraints, one strict survivor with nearby trade-service
  constraints, and one strict survivor with outside-box consumer-service
  constraints.
- the selected-wave descriptive share is `9/128`, with the exclusion ledger
  and truth-dossier constraints attached.

## Blocked Output

Current output may not say:

- regional frequency,
- national frequency,
- smallest postal parish,
- complete service absence,
- catchment isolation,
- service adequacy,
- trade areas.

## Frequency Treatment

The current frequency treatment is bounded selected-wave descriptive reporting.
Probability treatment is rejected for current closeout because manifest rows
were selected purposively and have no inclusion probabilities, weights, or
finite-population stratum sizes. Full-frame treatment is deferred because the
national public-post-office frame has not been fully enumerated and reviewed.

## Next Move

The next move is either a probability/full-frame design if frequency is the
goal, or a new breadth manifest if discovery remains the goal.

## Boundary

This design authorizes bounded selected-wave descriptive share language only.
It does not authorize regional frequency, national frequency, complete service
absence, catchment isolation, service adequacy, trade areas, income, spending,
or customer behavior.
