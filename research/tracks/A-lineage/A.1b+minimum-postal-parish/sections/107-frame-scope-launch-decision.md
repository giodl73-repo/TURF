# Frame Scope Launch Decision

## Reusable Output

Frame-scope launch matrix:
`tables/a1b-frame-scope-launch-decision-2026-08-16.csv`.

First scoped-frame selection matrix:
`tables/a1b-first-scoped-frame-selection-2026-08-16.csv`.

Supporting outputs:

- `sections/106-probability-full-frame-design-contract.md`,
- `tables/a1b-probability-full-frame-design-contract-2026-08-16.csv`,
- `sections/27-national-sample-frame-design.md`,
- `sections/28-post-office-sample-builder.md`,
- `scripts/extract_geofabrik_post_office_seed.py`,
- `scripts/filter_post_office_seed_semantics.py`,
- `scripts/build_post_office_sample_targets.py`,
- `scripts/run_post_office_sample_preflight.py`.

## Decision

The recommended first implementation is a **single-stratum full-frame build**.

That is narrower than a national full frame, but it is the right first
frequency-design step because it exercises the complete frame workflow:

- seed extraction,
- public-post-office semantics,
- settlement join,
- target-box construction,
- sidecar review,
- current-anchor gates,
- depth review,
- denominator/exclusion treatment,
- estimator dry run.

It also avoids pretending the selected wave can be retrofitted into a
probability sample.

Section 108 selects Wyoming / Mountain West as the first scoped full-frame
implementation because the seed count is tractable and the selected-wave
workflow already exercised sidecars, current-anchor review, depth review, and a
constrained survivor.

## Why Not National First

A national full frame is the cleanest eventual national-frequency path, but it
is operationally expensive. Every eligible public-post-office target would need
the same sidecar, current-anchor, source-gate, and truth-dossier treatment now
used for the selected wave.

The first design implementation should prove the machinery on one complete
scope before scaling nationally.

## Why Not More Breadth First

More descriptive breadth remains useful for discovery and narrative recurrence.
It does not by itself solve the frequency problem because another purposive
manifest still lacks inclusion probabilities, frame sizes, and weights.

## Launch Gate

Before execution, choose the first scoped frame:

- a state or Geofabrik subregion,
- manageable public-post-office seed count,
- current Geofabrik availability,
- clear stratum label,
- expected source availability for sidecars and current-anchor checks.

Current selected first frame: Wyoming / Mountain West.

The output may report only an exact target-box share for the chosen scoped
frame after full-frame review. It may not report national frequency, regional
frequency beyond the chosen scope, complete service absence, catchment
isolation, or service adequacy.

## Boundary

This launch decision selects the first implementation shape for future
frequency design. It does not create the frame, draw a sample, review targets,
estimate frequency, or authorize broader claims.
