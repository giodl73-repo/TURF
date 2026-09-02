# RET Next Scale Decision After Philadelphia

## Scope

This report uses the current 43-row cross-metro type-discovery profile to
decide what TURF should do before adding more urban areas.

Evidence sources:

```text
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-philadelphia-pre-scale-field-stack.csv
reports/ret-sidecar-promotion-evidence-matrix.csv
```

## Current State

The profile now covers six regions:

| Region | Fields | Current Read |
| --- | ---: | --- |
| Washington | 6 | Full 11-dimension clean baseline with zero source gates. |
| Atlanta | 7 | Full 11-dimension profile, still partial for final ranking because source gates remain high. |
| Chicago | 7 | Comparable six-layer pre-scale stack with several retry-gated rows. |
| Dallas/Fort Worth | 8 | Comparable five-layer Sun Belt stack with mostly resolved source quality. |
| Los Angeles / Inland Empire | 7 | Comparable five-layer mega-region stack with five post-office retry gates. |
| Philadelphia / South Jersey | 8 | Comparable five-core-layer stack with QSR and auto-parts sidecars from the start. |

The generated comparison tiers are:

| Comparison tier | Fields |
| --- | ---: |
| `baseline_comparable` | 6 |
| `type_discovery_comparable` | 28 |
| `type_discovery_partial` | 9 |

## Decision

Do not choose a seventh metro yet.

The next useful gate is a shared everyday finance layer:

```text
Add bank / credit union anchor-field summaries for the six-metro type-discovery
set, starting with Philadelphia / South Jersey and then backfilling the
five-metro profile where the source contract already exists.
```

Reason:

- TURF now has enough metro breadth to see repeated field types.
- QSR and auto parts are useful sidecars, but they mainly split daily-trip and
  car-service corridor texture.
- Banks and credit unions test an everyday civic/commercial service layer that
  can appear in downtown cores, malls, suburban corridors, office edges, and
  older civic fields.
- The layer stays non-contentious: it describes public branch/credit-union
  access, not income, protected classes, or individual finance behavior.
- Washington and Atlanta already proved an OSM/Overpass civic-context pattern
  for bank / credit union rows, so this is an extension of an existing source
  family rather than a new speculative category.

## Why Not Gas / Convenience First

Gas / convenience is still valuable, but it is more car-biased. It should
follow the finance layer as a contrast:

| Layer | Best Question |
| --- | --- |
| Bank / credit union | Which fields have everyday civic/commercial service depth beyond retail chains? |
| Gas / convenience | Which fields are car-trip corridors, highway/service edges, or auto-oriented daily-service terrain? |

Putting finance first helps avoid over-reading every difference through the
car-corridor lens.

## Minimum Useful Next Output

Pulse 156 should produce:

- a Philadelphia / South Jersey bank / credit union acquisition or source-gate
  pass across the eight fields,
- a reviewed fixture preserving observed, checked-absent, and source-gated
  statuses,
- an anchor-field summary CSV and report,
- a comparison note against the Philadelphia pre-scale stack,
- role review deciding whether finance signal changes any field labels.

If the Philadelphia pass is clean, backfill the same layer across Los Angeles,
Chicago, Dallas/Fort Worth, Washington, and Atlanta using the established
anchor-field contracts and source-gate accounting.

## Scale Gate Fields

Before the next scale move, the decision record must state:

- next useful layer;
- claim surface;
- blocked claims;
- source-quality tiers;
- layer comparability;
- why scale changes the claim.

## Guardrail

This decision does not introduce demographic, protected-class, customer,
income, credit, or individual-behavior inference. TURF should continue to treat
the layer as public civic/commercial footprint evidence only.
