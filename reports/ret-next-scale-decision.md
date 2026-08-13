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
| Atlanta | `full_11_dimension_context` | 7 | Useful but source-gated; Camp Creek and Northlake are now usable comparison fields, while all seven rows remain type-discovery partial for final atlas ranking. |
| Chicago | `pre_scale_6_layer_stack` | 7 | Strong type-discovery stack; all seven fields are now comparable, though some OSM post-office/gym gates remain for ranking. |
| Dallas/Fort Worth | `pre_scale_5_layer_stack` | 8 | Strong Sun Belt stack; all eight fields are now comparable for type discovery. |

## Decision

TURF is now ready to add a fifth metro for type discovery.

The earlier decision was source-resolution before fifth-metro scale. That work
has been done enough to open the gate:

- Washington has the full 11-dimension clean baseline.
- Chicago has seven comparable pre-scale fields.
- Dallas/Fort Worth has eight comparable pre-scale fields.
- Atlanta has no source-limited rows, and Camp Creek plus Northlake are now
  usable comparison fields even though Atlanta is not ready for final ranking.

The detailed fifth-metro decision is:

```text
reports/ret-fifth-metro-scale-decision.md
```

## Why Add Another Metro Now

Adding a fifth metro now adds needed breadth while preserving the source-quality
distinction. The current profile already proves that common stores can create
typed fields:

- urban postal/grocery/health fields,
- affluent mall and complex fields,
- edge-city grocery/big-box fields,
- town-center fields,
- mid-cities fields,
- secondary-core fields,
- airport-edge and office-edge fields,
- legacy mall everyday-service fields.

The weaker evidence is now concentrated in Atlanta, whose full 11-dimension
rows still carry enough Overpass gates to make final ranking premature. That is
acceptable for fifth-metro type discovery because the gates are explicit.

## Near-Term Goal

Set the next self-executing goal as:

```text
Create Los Angeles / Inland Empire anchor-field targets and start the fifth
metro pre-scale stack.
```

Minimum useful output:

- a Los Angeles / Inland Empire target fixture,
- a target-gate report explaining each bounded field,
- first-layer acquisition path for post office, grocery, mass retail, pharmacy,
  and retail complex,
- refreshed cross-metro profile after first comparable layers,
- passing `validate-type-discovery-profile`.

## Candidate First Layers

The best first layers are common, non-contentious, and already proven in the
Dallas/Fort Worth pre-scale stack:

| Layer | Why It Helps |
|---|---|
| Post office / USPS | Tests the original postal-address terrain thesis directly. |
| Grocery | Gives the strongest everyday-service baseline. |
| Mass retail | Separates big-box fields from neighborhood/town-center fields. |
| Pharmacy | Adds health-errand texture without using contentious demographics. |
| Retail complex | Confirms mall, lifestyle-center, and power-center structure. |

## Scale Trigger

The fifth-metro trigger is satisfied for type discovery. The selected next
metro should add a new settlement pattern, not just another large city.

Recommendation: Los Angeles / Inland Empire for polycentric freeway retail
fields.
