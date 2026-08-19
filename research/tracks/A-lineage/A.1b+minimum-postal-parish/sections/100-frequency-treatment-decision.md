# Frequency Treatment Decision

## Reusable Output

Treatment options:
`tables/a1b-frequency-treatment-options-2026-08-16.csv`.

Language decision gate:
`tables/a1b-frequency-language-decision-gate-2026-08-16.csv`.

Supporting outputs:

- `tables/a1b-denominator-recomputed-summary-2026-08-16.csv`,
- `tables/a1b-denominator-exclusion-ledger-2026-08-16.csv`,
- `tables/a1b-truth-dossier-synthesis-2026-08-16.csv`,
- `tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`.

## Decision

Adopt a bounded selected-wave descriptive treatment for current closeout.

Allowed:

- selected-wave bounded target-box share: `9/128`,
- candidate-class counts from the truth-dossier synthesis,
- exclusion counts alongside the share.

Rejected for current closeout:

- probability-sample treatment,
- confidence intervals,
- stratum prevalence,
- regional prevalence,
- national prevalence.

Deferred:

- full-frame national treatment,
- full-frame stratum treatment.

## Why

The selected breadth wave is complete and internally validated, but it is not a
probability sample. The manifest rows were selected to add geographic breadth
and contrast. Within each selected row, targets were selected by deterministic
hash ordering after public-post-office seed filtering, but the manifest rows do
not have defined inclusion probabilities, weights, or finite-population stratum
sizes.

The current evidence therefore supports a descriptive selected-wave statement:

> In the completed selected breadth wave, 9 of 128 clean eligible target boxes
> are numerator-eligible postal-only candidates, with truth-dossier constraints
> attached.

It does not support:

- regional frequency,
- national frequency,
- smallest-postal-parish prevalence,
- complete service absence,
- catchment isolation,
- service adequacy,
- trade-area claims.

## Boundary

This frequency treatment closes the current claim-language decision for the
selected wave. It does not make the selected wave a probability sample or a
full-frame census.
