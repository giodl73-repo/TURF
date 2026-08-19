# Georgia Second Pilot Selection

## Reusable Output

Sparse-city scan:
`tables/georgia-chain-sparse-city-candidates.csv`.

Second-pilot queue:
`tables/georgia-second-pilot-candidate-queue-2026-08-15.csv`.

Bounded target boxes:
`tables/georgia-second-pilot-targets-2026-08-15.csv`.

## Why Georgia

Georgia is the recommended second-state pilot because the repo already has
reviewed statewide Overture layers for:

- QSR,
- auto parts,
- grocery,
- drugstore/pharmacy,
- mass retail,
- home improvement.

That makes Georgia the lowest-friction non-Washington test of the A.1b scale-out
question. It is also regionally distinct from Washington, so it is a better
method check than adding more Washington sidecars.

## Candidate Scan

The reviewed Georgia layers produce 46 one-layer sparse city labels:

| Current Chain Stack | Sparse Cities |
|---|---:|
| qsr | 27 |
| auto_parts | 10 |
| grocery | 7 |
| pharmacy | 2 |

No one-layer `mass_retail` or `home_improvement` city labels appear in this
scan.

## Selected Queue

The second-pilot queue contains 20 target probes:

- Ball Ground,
- Cohutta,
- Greenville,
- Ludowici,
- Cuthbert,
- Franklin,
- Kathleen,
- Richland,
- Bogart,
- Carnesville,
- College Park,
- Colquitt,
- Hull,
- Monticello,
- Mccaysville,
- Ocilla,
- Pearson,
- Pelham,
- Reynolds,
- Turin.

Each target box is bounded around one reviewed sparse-chain coordinate. This
matches the Washington pilot pattern: target boxes are probes, not municipal,
postal, ZIP, ZCTA, CDP, county, trade-area, or catchment boundaries.

## Next Gate

The next evidence step is post-office verification against
`tables/georgia-second-pilot-targets-2026-08-15.csv`.

No Georgia target should receive a minimum-stack class until post-office status
is checked. If post-office evidence is observed, the sidecar order should be:

1. broad named food-service,
2. gas/convenience,
3. dollar store,
4. hardware,
5. laundromat.

## Boundary

This selection may say Georgia is the recommended second pilot and that 20
bounded target probes are ready for post-office verification. It may not claim
Georgia minimum postal parish classifications, national frequency, complete
local inventory, service adequacy, customer behavior, income, spending, trade
areas, or catchment boundaries.
