# RET Next Scale Decision After Los Angeles

## Scope

This report uses the current 35-row cross-metro type-discovery profile to decide
what TURF should do before scaling to more urban areas.

Evidence source:

```text
reports/ret-cross-metro-type-discovery-profile.csv
```

## Current State

The profile now covers five regions:

| Region | Fields | Current Read |
| --- | ---: | --- |
| Washington | 6 | Full 11-dimension clean baseline with zero source gates. |
| Atlanta | 7 | Full 11-dimension profile, but still partial for final ranking because source gates remain high. |
| Chicago | 7 | Comparable six-layer pre-scale stack with several remaining retry-gated rows. |
| Dallas/Fort Worth | 8 | Comparable five-layer Sun Belt stack with mostly resolved source quality. |
| Los Angeles / Inland Empire | 7 | Comparable five-layer mega-region stack with five post-office retry gates. |

The profile is ready for type discovery. It is not ready for final atlas
ranking.

## What Is Still Missing

The profile can already distinguish dense urban everyday grids, affluent
complex fields, mall big-box grocery fields, inland freeway power centers,
town-center fields, office edges, airport edges, and coastal or port/coastal
mall-service fields.

The remaining uncertainty is not mainly "more metros." It is whether the same
typed fields change when TURF adds one more common trip layer and resolves the
largest visible civic source gap.

| Gap | Why It Matters | Next Action |
| --- | --- | --- |
| LA postal retry gates | The postal layer tests the original TURF addressability thesis. Five LA fields are timeout-gated, not checked absent. | Retry or replace the five LA post-office gates before final postal ranking. |
| Common quick-service restaurant layer | McDonald's, Burger King, Wendy's, Taco Bell, and related QSR brands test daily-trip saturation and corridor texture. | Add a QSR layer to LA first, then compare against Washington/Atlanta where QSR work already exists. |
| Trade and auto-service layer | Auto parts and hardware-like errands expose car-maintenance corridors, edge fields, and suburban/inland service structure. | Add auto parts after QSR if the QSR layer separates fields cleanly. |
| Full 11-dimension expansion | Washington remains the only clean full-contract baseline. | Do not require a full LA 11-dimension build before QSR, but keep final ranking blocked until source gates are resolved. |

## Decision

Do not choose a sixth metro yet.

The next scale gate should be:

```text
Resolve LA postal source gates enough for civic interpretation, then add a Los
Angeles / Inland Empire QSR layer across the same seven fields.
```

Reason:

- LA is the newest and richest stress test, but five fields still have postal
  timeout gates.
- QSR chains are common, public, non-contentious commercial infrastructure and
  should expose everyday-trip density that grocery, pharmacy, mass retail, and
  retail complexes do not fully capture.
- Adding QSR before a sixth metro tests whether "typed enclaves" persist across
  a new, high-frequency category.
- Auto parts remains the best follow-on layer because it tests car-corridor and
  trade-service texture after QSR establishes the daily-trip baseline.

## Minimum Useful Next Output

Pulse 137 should produce:

- a LA post-office source-resolution pass for the five retry-gated fields, or a
  documented alternate-source retry if Overpass remains unstable,
- a LA QSR target/extract/review path for common national chains,
- a seven-field LA QSR summary,
- an updated LA pre-scale stack or sidecar QSR readout that states whether QSR
  changes any emerging field labels,
- role review that decides whether QSR is enough to move to auto parts or
  whether postal resolution still blocks interpretation.

## Guardrail

This decision does not expand into sensitive profiling. The next layers describe
public civic and commercial access: post offices, quick-service restaurants,
and later auto-service/trade errands. TURF should keep avoiding protected-class
or individual-behavior inference while building typed field evidence.
