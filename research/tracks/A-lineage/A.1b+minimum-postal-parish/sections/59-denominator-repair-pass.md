# Denominator Repair Pass

## Reusable Output

Rhode Island current-anchor review:
`tables/rhode-island-current-postal-anchor-review-2026-08-16.csv`.

South Dakota current-anchor review:
`tables/south-dakota-current-postal-anchor-review-2026-08-16.csv`.

Addison settlement repair:
`tables/addison-settlement-proxy-repair-2026-08-16.csv`.

Updated denominator eligibility:
`tables/a1b-denominator-eligibility-rows-2026-08-16.csv`.

Updated recomputed summary:
`tables/a1b-denominator-recomputed-summary-2026-08-16.csv`.

## Question

The denominator recomputation left three repair items:

- current-anchor review for Clayville RI,
- current-anchor review for Artesian SD,
- settlement-proxy repair for Addison WV.

This pass resolves those gates without broadening the claim.

## Current Anchors

Clayville and Artesian both pass the current-anchor gate:

- Clayville Post Office at 479 Field Hill Rd geocodes inside the Clayville
  target box,
- Artesian Post Office at 225 N Main St geocodes inside the Artesian target
  box.

Both rows move from `gated_current_anchor_not_reviewed` to
`eligible_clean_sample_denominator` and from
`gated_missing_current_anchor_review` to
`eligible_postal_only_candidate_numerator`.

## Addison Repair

Addison does not repair into a West Virginia settlement proxy. The sampled
post-office seed point resolves by Census coordinate geography to Ohio, Gallia
County, Addison township. Food-service sidecar rows inside the broad target box
resolve in West Virginia near Point Pleasant, but that does not repair the
post-office seed itself.

The correct denominator action is therefore:

- `repair_status=seed_state_mismatch_confirmed`,
- `denominator_eligibility=excluded_seed_state_mismatch`.

## Updated Result

Across the six next-wave breadth strata:

- sampled target rows: 72,
- clean sampled denominator rows after repair: 61,
- postal-only candidate numerator rows after repair: 5.

The five numerator-eligible postal-only candidates are:

- Clayville RI,
- Artesian SD,
- Alum Bridge WV,
- Carpenter WY,
- Amistad NM.

The bounded sample share after repair is therefore `5/61`. This is still not a
regional or national frequency claim.

## Remaining Gates

Rows still excluded from the clean denominator:

- five West Virginia rows with current-anchor status not confirmed inside-box,
- five Hawaii rows with private-shipping/FedEx seed semantics,
- Addison WV as a seed-state mismatch.

## Boundary

This repair pass may update denominator eligibility for the bounded sampled
cross-stratum table. It may not claim regional frequency, national frequency,
complete post-office inventory, complete service absence, service adequacy,
trade areas, catchments, income, spending, or customer behavior.
