# Probability Full-Frame Design Contract

## Reusable Output

Design contract:
`tables/a1b-probability-full-frame-design-contract-2026-08-16.csv`.

Supporting outputs:

- `tables/a1b-frequency-treatment-options-2026-08-16.csv`,
- `tables/a1b-frequency-language-decision-gate-2026-08-16.csv`,
- `tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`,
- `tables/a1b-depth-hardening-closeout-and-next-fork-2026-08-16.csv`,
- `tables/a1b-frame-scope-launch-decision-2026-08-16.csv`.

## Purpose

The current selected-wave result is strong enough for bounded descriptive
target-box language:

> 9 of 128 clean eligible selected-wave target boxes are numerator-eligible
> postal-only candidates with dossier constraints attached.

It is not strong enough for regional, stratum, or national frequency language.
This contract defines what must exist before any frequency-language upgrade.

## Required Choice

The next design must choose one path before execution:

- full-frame census review of an explicitly scoped public-post-office target
  frame,
- probability sample from an explicitly scoped public-post-office target frame.

The current selected breadth wave cannot be retrofitted into either path. It
can be used as pilot data for scripts, estimator dry-runs, source-gate testing,
and exemplar language only.

The recommended first implementation is a single-stratum full-frame build. That
path proves frame construction, source gates, denominator treatment, and
estimator plumbing before any national or multi-stratum design is attempted.

## Required Gates

Before any regional, stratum, or national frequency estimate:

- define the frame scope,
- define public-post-office semantics,
- define target-box construction,
- choose census or probability sampling,
- define strata if sampling or reporting by stratum,
- assign inclusion probabilities if using probability sampling,
- define estimator and variance treatment,
- predeclare source-gate and exclusion handling,
- define geocoder precedence,
- predeclare reporting language.

## Current Go/No-Go

Current status: `blocked_until_design_selected`.

Allowed now:

- selected-wave descriptive share,
- candidate-class counts,
- constrained target-box exemplar language,
- method-design planning.

Blocked now:

- confidence intervals,
- margins of error,
- regional rates,
- stratum prevalence,
- national prevalence,
- smallest-postal-parish frequency,
- complete service absence,
- catchment isolation.

## Boundary

This contract defines the evidence needed for future frequency work. It does
not itself create a probability sample, full-frame census, regional estimate,
national estimate, service-access measure, or trade-area claim.
