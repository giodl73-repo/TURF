# Scale-Out Decision Gate

## Reusable Output

Decision table:
`tables/a1b-scale-out-decision-gate-2026-08-15.csv`.

## Decision

The next A.1b move should be a second state pilot, not a national sampling pass
yet.

Washington is now useful as a complete bounded pilot, but it is only one state
and only one candidate-generation method. It also changed materially after the
Domino's / QSR scope gap: broad named food-service evidence removed the
`postal_only_candidate` bucket entirely.

That means the next useful question is not "what is the smallest postal parish
nationally?" The next useful question is:

> Does a non-Washington sparse-chain pilot also collapse postal-only candidates
> into post-office-plus-food-service or post-office-plus-everyday-service
> stacks once broad local food-service evidence is checked?

## Gate Status

| Option | Status | Reason |
|---|---|---|
| second state pilot | recommended next | Tests whether the Washington pattern holds outside one state and one regional geography. |
| national sampling | gated | Needs reproducible candidate generation and checked sidecars across more than one geography. |
| more Washington sidecars | not recommended now | The Washington classifier is already stable after food-service, gas/convenience, dollar-store, hardware, and laundromat checks. |

## Second Pilot Contract

The second pilot should reuse the Washington method:

- start from sparse chain evidence or an equivalent open candidate queue,
- create bounded target boxes,
- check post-office evidence first,
- keep post-office checked absence separate from everyday-service evidence,
- check broad named food-service before claiming postal-only,
- add gas/convenience, dollar-store, hardware, and laundromat sidecars where
  open evidence permits,
- preserve checked absence and source gates separately,
- produce the same classifier schema.

## Boundary

This gate may recommend sequencing. It may not claim national smallest-place
coverage, national frequency, complete local inventory, service adequacy,
customer behavior, income, spending, trade areas, or catchment boundaries.
