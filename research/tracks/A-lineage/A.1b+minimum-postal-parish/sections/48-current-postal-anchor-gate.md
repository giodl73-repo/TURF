# Current Postal Anchor Gate

## Reusable Output

Contract table:
`tables/current-postal-anchor-review-contract-2026-08-16.csv`.

Validator:
`scripts/validate_current_postal_anchor_review.py`.

West Virginia review table:
`tables/west-virginia-current-postal-anchor-review-2026-08-16.csv`.

## Why This Gate Exists

The West Virginia depth review exposed a method problem that the earlier seed
validator did not cover. A reviewed open seed row can be structurally valid and
still be a poor current-postal-anchor claim if the OSM feature is stale,
historical, converted to a place-name postal context, or displaced to a nearby
current USPS facility outside the sampled target box.

This gate separates two questions:

- is the sampled post-office feature a current postal anchor inside the target
  box,
- what everyday-service stack exists around that current anchor.

The second question should not run as a postal-only frequency candidate until
the first question is confirmed or explicitly source-gated.

## Review Statuses

The review contract uses five controlled statuses:

- `current_anchor_confirmed_inside_box`,
- `current_anchor_confirmed_outside_box`,
- `current_anchor_status_gated`,
- `current_anchor_contradicted`,
- `source_gated`.

Confirmed inside-box and outside-box rows require an observed facility name,
address, geocoded coordinates, and target-box membership result. Gated rows
require source provenance and a next action.

## West Virginia Application

The first application is West Virginia's nine depth candidates:

- current anchor confirmed inside box: Alkol, Alum Bridge, Amherstdale, Amma,
- current anchor confirmed outside box: Anthony,
- current anchor status gated: Advent, Alvy, Ameagle, Annamoriah.

This means only Alkol and Alum Bridge remain eligible for current postal-only
candidate handling after everyday-service evidence is considered. Amherstdale
and Amma have current anchors but are rejected by inside-box everyday service.
Anthony has a current nearby/postal-context anchor outside the sampled box.
Advent, Alvy, Ameagle, and Annamoriah need source resolution before they can be
used in any current-post-office frequency denominator.

## Boundary

The current-anchor gate does not certify USPS completeness, OSM completeness,
postal-service adequacy, catchments, trade areas, or national frequency. It is
only a target-box eligibility gate before postal-only or minimum-stack
classification.

## Next Gate

Add this validator to future breadth preflight checklists. For the next state,
run the gate only on depth candidates or source-suspicious anchors, not on every
seed row, unless the sample is small enough for full current-anchor review.
