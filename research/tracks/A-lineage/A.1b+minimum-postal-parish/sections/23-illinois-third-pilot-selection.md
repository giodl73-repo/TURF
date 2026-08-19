# Illinois Third Pilot Selection

## Reusable Output

Sparse candidate table:
`tables/illinois-chain-sparse-city-candidates.csv`.

Third-pilot queue:
`tables/illinois-third-pilot-candidate-queue-2026-08-15.csv`.

Target boxes:
`tables/illinois-third-pilot-targets-2026-08-15.csv`.

## Why Illinois

Illinois is the recommended third-state pilot because it adds a single-state
Great Lakes/Midwest geography after Washington and Georgia, and the repo already
has reviewed packet-ready Overture-derived rows for the same candidate layers:

- auto parts,
- grocery,
- pharmacy,
- four-brand QSR.

That makes Illinois a lower-friction third pilot than a multi-state
Pennsylvania/New Jersey frame, while avoiding another Southeast or West Coast
test.

## Candidate Scan

The reviewed Illinois layers produce 113 one-layer sparse city labels:

| Sparse Chain Stack | City Labels |
|---|---:|
| qsr | 86 |
| auto_parts | 10 |
| grocery | 9 |
| pharmacy | 8 |

These are not postal classifications. They are candidate-generation labels from
existing reviewed chain evidence.

## Selected Queue

The selected 20-target queue mirrors the Georgia balance where possible:

| Sparse Chain Stack | Targets |
|---|---:|
| auto_parts | 10 |
| grocery | 4 |
| qsr | 4 |
| pharmacy | 2 |

Selected targets:

- Brookfield,
- Fairbury,
- Greenup,
- Hodgkins,
- Mount Carmel,
- Petersburg,
- Riverside,
- Sleepy Hollow,
- Virden,
- Winthrop Harbor,
- Clarendon Hills,
- Dixmoor,
- Glen Carbon,
- La Grange Park,
- Albion,
- Altamont,
- Arcola,
- Bannockburn,
- Henry,
- Lincolnwood.

## Target Boxes

Each target is bounded around one packet-ready reviewed chain coordinate. The
boxes are target probes, not city, ZIP, ZCTA, CDP, county, postal-locality,
trade-area, or catchment boundaries.

## Next Gate

Run bounded post-office verification before assigning any Illinois
minimum-stack class. Only targets with observed post-office evidence should move
to everyday-service sidecars.

## Boundary

This selection may say Illinois has enough one-layer sparse chain city labels
to run a third A.1b pilot and that 20 bounded target boxes have been selected.
It may not claim Illinois postal minimum stacks, national frequency, complete
chain coverage, citywide absence, service adequacy, trade areas, or catchments.
