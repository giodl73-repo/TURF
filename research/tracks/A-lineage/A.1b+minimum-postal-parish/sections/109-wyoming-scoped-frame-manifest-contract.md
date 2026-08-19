# Wyoming Scoped Frame Manifest Contract

## Reusable Output

Wyoming scoped-frame manifest contract:
`tables/wyoming-scoped-frame-manifest-contract-2026-08-16.csv`.

Supporting outputs:

- `sections/108-first-scoped-frame-selection.md`,
- `tables/a1b-first-scoped-frame-selection-2026-08-16.csv`,
- `tables/wyoming-mountain-west-post-office-seed-2026-08-16.csv`,
- `tables/wyoming-mountain-west-settlement-join-2026-08-16.csv`,
- `scripts/validate_post_office_seed.py`,
- `scripts/build_post_office_sample_targets.py`,
- `scripts/run_post_office_sample_preflight.py`.

## Scope

The first scoped full-frame implementation is Wyoming / Mountain West.

The initial eligible frame is the 84 packet-ready Wyoming post-office seed rows
from the existing Geofabrik seed extract. The 26 unnamed or excluded seed rows
remain outside the eligible frame and need a seed-exclusion ledger before any
scoped-frame result is reported.

## Planned Full-Frame Inputs

Use:

- `wyoming-mountain-west-post-office-seed-2026-08-16.csv`,
- `wyoming-mountain-west-settlement-join-2026-08-16.csv`,
- standard target-box deltas from the existing preflight pipeline,
- `sample_per_stratum=0`,
- `max_total=0`.

That should build target boxes for every packet-ready Wyoming seed row rather
than another 12-row selected sample.

## Required Outputs

The first execution should create:

- scoped-frame seed exclusion ledger,
- scoped-frame target CSV,
- scoped-frame enriched target CSV,
- scoped-frame preflight report,
- scoped-frame sidecar status files,
- scoped-frame minimum-stack classification,
- scoped-frame current-anchor review for first-pass postal-only candidates,
- scoped-frame depth review decisions,
- scoped-frame denominator eligibility rows and exclusion ledger,
- scoped-frame estimator dry run.

## Boundary

This contract does not execute the Wyoming frame and does not authorize a
Wyoming, Mountain West, regional, or national frequency claim. A later share may
apply only to the completed Wyoming scoped public-post-office target-box frame,
with exclusions and candidate classes attached.
