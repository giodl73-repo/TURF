# Denominator Recomputation

## Reusable Output

Row-level denominator eligibility:
`tables/a1b-denominator-eligibility-rows-2026-08-16.csv`.

Recomputed bounded summary:
`tables/a1b-denominator-recomputed-summary-2026-08-16.csv`.

## Question

The denominator-readiness gate blocked frequency claims until current-anchor,
depth, trade-service, private-shipping, and settlement gates were applied. This
section applies those gates row by row across the six completed next-wave
breadth strata.

## Eligibility Rules

The recomputation separates two related questions:

- whether a row can enter the clean sampled public-post-office denominator,
- whether a row can enter the postal-only candidate numerator.

Rows are excluded or gated when:

- the settlement-size proxy is unresolved,
- the sampled seed is a private-shipping semantic gate,
- a postal-only candidate has no current-anchor review,
- a current-anchor review does not confirm an inside-box current postal anchor,
- depth review rejects or weakens clean postal-only status.

Everyday-service rows can remain denominator-eligible after seed and settlement
gates. Postal-only numerator rows require both depth survival and an inside-box
current-anchor confirmation.

## Result

Across the six next-wave breadth strata:

- sampled target rows: 72,
- clean sampled denominator rows after gates: 59,
- postal-only candidate numerator rows after gates: 3.

The three numerator-eligible postal-only candidates are:

- Alum Bridge WV,
- Carpenter WY,
- Amistad NM.

Rows still gated before numerator use:

- Clayville RI: depth survivor but no current-anchor review yet,
- Artesian SD: depth survivor but no current-anchor review yet.

Rows excluded from the clean denominator:

- five West Virginia rows with current-anchor status not confirmed inside-box,
- five Hawaii rows with private-shipping/FedEx seed semantics,
- one West Virginia row with unresolved settlement proxy.

The bounded sample share after gates is therefore `3/59`. This is not a
regional or national frequency claim. It is a gated cross-stratum sample result
that identifies the next repair queue before stronger denominator claims.

## Interpretation

The recomputation strengthens the project direction. Post-office-only survives,
but only as a small and gate-sensitive subset after local sidecars, alternate
sources, current-anchor checks, and private-shipping semantics are applied.
Most eligible rows remain postal plus named everyday service.

The next work should repair the remaining denominator gates rather than add
more examples:

- current-anchor review for Clayville RI,
- current-anchor review for Artesian SD,
- settlement-proxy repair for Addison WV,
- automated private-shipping seed exclusion or current-anchor confirmation
  before any future clean public-post-office denominator.

## Boundary

This recomputation may report a bounded sampled cross-stratum denominator and
candidate numerator after stated gates. It may not claim regional frequency,
national frequency, complete post-office inventory, complete service absence,
service adequacy, trade areas, catchments, income, spending, or customer
behavior.
