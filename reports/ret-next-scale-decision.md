# RET Next Scale Decision

## Scope

This report uses the current cross-metro type-discovery profile to decide what
TURF should do before adding more urban areas or more store categories.

Evidence source:

```text
reports/ret-cross-metro-type-discovery-profile.csv
```

## Current Profile

The current profile has 28 field rows across four metros:

| Region | Profile Basis | Fields | Current Read |
|---|---|---:|---|
| Washington | `full_11_dimension_context` | 6 | Clean baseline, zero source gates. |
| Atlanta | `full_11_dimension_context` | 7 | Useful but source-gated; five partial and two source-limited fields. |
| Chicago | `pre_scale_6_layer_stack` | 7 | Strong type-discovery stack, but OSM post-office/gym gates remain material. |
| Dallas/Fort Worth | `pre_scale_5_layer_stack` | 8 | Strong Sun Belt stack, with seven comparable rows and one partial row. |

## Decision

The next best goal is source-resolution before fifth-metro scale.

TURF should not add a fifth metro yet. The four-metro profile already has
enough variety to compare typed retail fields. What it lacks is balanced source
quality across metros:

- Washington has the full 11-dimension clean baseline.
- Dallas/Fort Worth has enough common-store signal to compare immediately.
- Chicago has strong non-OSM store signal but unresolved OSM civic/wellness
  source gates.
- Atlanta has the biggest source-gate load, despite useful partial fields.

The best next move is therefore a civic/postal source-resolution pass for
Atlanta and Chicago, starting with post offices and one everyday civic/service
layer that can be checked consistently.

## Why Not Add Another Metro Yet

Adding a fifth metro would add breadth, but not fix the main uncertainty. The
current profile already proves that common stores can create typed fields:

- urban postal/grocery/health fields,
- affluent mall and complex fields,
- edge-city grocery/big-box fields,
- town-center fields,
- mid-cities fields,
- secondary-core fields,
- airport-edge and office-edge partial fields.

The weaker evidence is not the number of metros. It is that Atlanta and Chicago
still carry enough Overpass gates to make final ranking or refined archetype
comparison premature.

## Near-Term Goal

Set the next self-executing goal as:

```text
Run a civic/postal source-resolution pass for Atlanta and Chicago, then refresh
the cross-metro profile before choosing the fifth metro.
```

Minimum useful output:

- a source-resolution strategy note,
- refreshed Atlanta post-office and one everyday civic/service layer, or an
  explicit source-gate fixture if the retry fails,
- refreshed Chicago post-office or gym/civic layer, or an explicit source-gate
  fixture if the retry fails,
- refreshed pre-scale/profile reports,
- passing `validate-type-discovery-profile`.

## Candidate Source Layers

The best candidates are common, non-contentious, and territory-revealing:

| Layer | Why It Helps |
|---|---|
| Post office / USPS | Tests the original postal-address terrain thesis directly. |
| Library | Civic-service signal with stable public locations. |
| Transit center | Separates mobility-rich cores and edge nodes from car-only fields. |
| Parks/open space | Distinguishes lived neighborhood fields from retail-only power fields. |
| Bank / credit union | Everyday errand density without moving into contentious demographics. |
| Gas / convenience | Car-trip texture for edge, airport, and suburban fields. |

## Scale Trigger

TURF should add a fifth metro after either:

- Atlanta and Chicago each reduce at least two source-gated dimensions, or
- alternate source strategy is documented and the remaining gates are accepted
  as source limits rather than hidden absences.

At that point the next metro should be chosen to add a new settlement pattern,
not just another large city. Good candidates would be:

- Los Angeles / Inland Empire for polycentric freeway retail fields,
- Phoenix for Sun Belt grid/growth fields,
- Minneapolis / St. Paul for twin-core and first-ring mall fields,
- Miami / Fort Lauderdale for coastal linear and tourist/service fields.
