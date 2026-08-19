# Three-State Pilot Synthesis

## Reusable Output

Synthesis table:
`tables/three-state-minimum-postal-parish-synthesis-2026-08-15.csv`.

Classifier tables:

- `tables/washington-minimum-stack-classification-2026-08-15.csv`
- `tables/georgia-minimum-stack-classification-2026-08-15.csv`
- `tables/illinois-minimum-stack-classification-2026-08-15.csv`

## Result

The Washington, Georgia, and Illinois pilots cover 60 bounded sparse-chain
target boxes.

| Pilot | Target Boxes | Post Office Observed | Post Office Checked Absent | Post Office Source Gated | Food-Service Minimum | Everyday-Service Minimum | Postal Only |
|---|---:|---:|---:|---:|---:|---:|---:|
| Washington | 20 | 18 | 2 | 0 | 3 | 15 | 0 |
| Georgia | 20 | 2 | 18 | 0 | 2 | 0 | 0 |
| Illinois | 20 | 8 | 2 | 10 | 3 | 5 | 0 |
| Combined | 60 | 28 | 22 | 10 | 8 | 20 | 0 |

Among the 28 post-office-observed classified target boxes, every target has an
observed food-service sidecar. Eight are food-service minimums, and twenty have
two or more everyday-service sidecars.

## Read

The three-state pilot strengthens the two-state read: the current minimum
confirmed postal stack is not post office alone. It is post office plus named
food-service.

Illinois adds useful pressure because it is a Great Lakes/Midwest pilot and
uses the same sparse candidate method, but it also exposes a source-process
lesson. Dense target boxes can produce unreliable zero rows from one OSM access
path and API limits from another. Those boxes must remain source-gated rather
than treated as absence.

The working A.1b hypothesis should therefore be refined:

- `postal_food_service_minimum` is the sparsest class observed across three
  bounded pilots.
- `postal_everyday_service_minimum` is the most common classified outcome.
- `postal_only_candidate` remains a possible class in the typology, but it has
  not been observed in Washington, Georgia, or Illinois.

## Scale-Out Gate

A national smallest-parish claim is still gated. The next scalable method needs
an explicit national sampled post-office frame, not only sparse chain labels.
It also needs source fallback rules that treat API limits and contradictory
zero-row results as source gates.

The third-pilot result supports moving from ad hoc state pilots to a reproducible
sample design, but not to a national frequency claim yet.

## Boundary

This synthesis may compare the three bounded state pilots and say no
postal-only candidate survived among 28 post-office-observed classified target
boxes. It may not claim national frequency, smallest postal parish, complete
food-service inventory, ZIP/ZCTA/CDP/county coverage, trade areas, catchments,
or service adequacy.
