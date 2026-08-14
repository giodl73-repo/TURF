# Research Track Plan Role Review

This report reviews the proposed TURF research-track plan through the repo's
`.roles` lenses before scaffolding the first research modules.

## Proposed Track Structure

```text
research/
  tracks/
    A-lineage/
      A.1+postal-parish/
      A.2+market-town-to-mall/
      A.3+trade-road-to-car-corridor/
      A.4+port-district-to-logistics-retail/
      A.5+guild-quarter-to-professional-services/
    B-modern-typology/
      B.1+enclave-family-taxonomy/
      B.2+car-trip-stack/
      B.3+retail-complex-power-centers/
    C-validation/
      C.1+cross-metro-recurrence/
      C.2+source-stability/
      C.3+new-metro-generalization/
```

## Review Decision

Status: approve with sequencing constraints.

The plan is directionally right. It gives TURF a research program that can
explain lineage from historical settlement functions to modern retail territory
signals without overclaiming that commercial footprints determine culture,
identity, or behavior.

The first module should be:

```text
research/tracks/A-lineage/A.1+postal-parish/
```

Reason: the postal layer is TURF's strongest bridge between historical
addressability, local institutional geography, and modern retail territory
analysis. It also anchors the user's original thesis: the U.S. Post Office is a
foundational terrain-defining institution.

## Role Review

### Market Geographer

Status: pass.

The lineage structure is geographically coherent if it treats historical
institutions as analogues for settlement functions, not as one-to-one
equivalents. The track should separate:

- official jurisdictions,
- lived commercial fields,
- historical analogues,
- inferred modern retail terrain.

Required constraint: every module must state whether it is discussing a formal
boundary, a public infrastructure layer, a commercial footprint, or an analogy.

### Source Policy Auditor

Status: pass with constraint.

The plan is acceptable only if research modules cite public or repo-generated
evidence and avoid unsupported historical claims. TURF can use historical
lineage as interpretation, but the evidence basis must remain explicit:

- USPS / Census / public geography for addressability,
- Overture / OSM / reviewed public footprint summaries for modern retail,
- cited public historical sources for older institutions,
- no proprietary locator scraping,
- no claims about individual people, customers, or protected traits.

Required constraint: each module needs a `Source Policy` section and a
`Claim Boundary` section.

### Catchment Modeler

Status: pass.

The research tracks preserve a useful separation between descriptive lineage and
model output. Historical analogies should not become catchment assignments.

Required constraint: modules must distinguish:

- observed footprint,
- bounded target field,
- sidecar modifier,
- analogy,
- future model hypothesis.

### Atlas Designer

Status: pass.

The track structure can become an atlas if each module keeps outputs
inspectable. The A-lineage modules should produce concise tables that map:

```text
historical function -> modern institution -> TURF evidence -> example fields
```

Required constraint: every module should include at least one reusable table
that could become a map legend or dashboard filter.

### Market Analyst

Status: pass.

The plan is useful if it keeps research modules connected to existing TURF
reports rather than becoming detached essays. Analysts need the lineage framing
to explain why fields matter, but they also need links to CSVs and reports.

Required constraint: each module should list the exact TURF reports, CSVs, and
queries it depends on.

### Future Agent

Status: pass.

The plan is resumable if the module folder contract is explicit before files
are created.

Recommended module skeleton:

```text
README.md
sections/
  01-thesis.md
  02-lineage.md
  03-modern-evidence.md
  04-claim-boundary.md
tables/
figures/
reviews/
  ROLE_REVIEW.md
references.bib
```

Required constraint: do not scaffold every module at once. Create the track
index and first module skeleton, then let evidence quality determine the next
module.

## Approved Module Sequence

1. `A.1+postal-parish`
   - Thesis: postal/address infrastructure functions like a modern parish
     layer for addressability and everyday service geography.
   - Current TURF evidence: post-office layers, ZCTA thesis, type-discovery
     profile.

2. `A.2+market-town-to-mall`
   - Thesis: malls, grocery/pharmacy clusters, retail complexes, and big-box
     fields inherit market-town and fairground functions.
   - Current TURF evidence: retail-complex layer, mass retail, grocery,
     pharmacy, enclave families.

3. `A.3+trade-road-to-car-corridor`
   - Thesis: QSR, gas / convenience, and auto parts reveal modern trade-road,
     turnpike, and service-corridor functions.
   - Current TURF evidence: car-trip stack comparison and typing note.

4. `A.4+port-district-to-logistics-retail`
   - Thesis: port, event, industrial, and logistics-adjacent fields preserve
     movement-infrastructure terrain in modern retail patterns.
   - Current TURF evidence: Long Beach / Lakewood, South Philadelphia Sports /
     Port, Camden, Arlington / Grand Prairie, Ford City.

5. `A.5+guild-quarter-to-professional-services`
   - Thesis: banks, insurance agencies, tax prep, and local professional
     services form a modern public-facing service quarter.
   - Current TURF evidence: bank / credit union, tax prep, insurance, and
     professional-services sidecar comparison.

## Non-Goals

The research tracks should not claim:

- retail chains intentionally design historical lineage,
- stores define culture or individual behavior,
- commercial footprints are official corporate territories,
- historical analogies prove demographic or socioeconomic facts,
- TURF can infer protected traits from store presence.

## Recommendation

Proceed with a minimal research scaffold:

```text
research/README.md
research/tracks/A-lineage/README.md
research/tracks/A-lineage/A.1+postal-parish/
```

Do not scaffold B or C tracks yet. The A.1 module should prove the module
contract first.
