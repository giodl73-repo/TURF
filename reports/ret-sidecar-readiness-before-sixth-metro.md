# RET Sidecar Readiness Before Sixth Metro

## Scope

This note decides whether TURF can scale to a sixth urban area after completing
the Los Angeles / Inland Empire, Chicago, and Dallas/Fort Worth field-aligned
QSR and auto-parts sidecars.

Evidence sources:

```text
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-sidecar-promotion-evidence-matrix.csv
reports/ret-sidecar-promotion-evidence-matrix.md
reports/ret-sidecar-backfill-plan.md
```

## Decision

TURF is ready to choose a sixth metro for type discovery under a standard
sidecar contract.

Do not promote QSR and auto parts into the core cross-metro profile yet.

The sixth-metro contract is:

```text
Core pre-scale dimensions:
postal/civic, grocery, mass retail, pharmacy, retail complex

Standard sidecars:
QSR, auto parts

Profile status:
sidecars required for interpretation, not counted as core profile dimensions
```

## Why This Is Enough

The completed sidecar matrix covers 22 field-aligned examples across Los
Angeles / Inland Empire, Chicago, and Dallas/Fort Worth. That is enough to show
that QSR and auto parts are not redundant:

| Pattern | Meaning |
| --- | --- |
| QSR dense and auto-service dense | Combined daily-trip plus trade/car-service field. |
| QSR dense and auto-service light | Daily-trip urban or neighborhood field, not a car-service corridor. |
| Both sidecars light | Keep the core field type; do not over-upgrade from weak sidecar signal. |
| QSR corridor plus auto-service node | Service corridor with limited trade/car-service support. |

This makes sidecars useful for interpretation, but not yet strong enough to
justify changing the core profile contract or regenerating all 35 existing
profile rows.

## Washington And Atlanta Status

Washington and Atlanta do not block sixth-metro scale.

Their QSR and auto-parts evidence exists at older metro/place scopes, not the
current anchor-field sidecar contract. That means:

- they should not be used as field-aligned promotion proof,
- they can remain historical comparison evidence,
- they should be retro-aligned only if the next scale decision depends on
  Washington/Atlanta sidecar field parity.

This is an explicit waiver, not a silent data gap. The next metro should use
the standard sidecar contract from the start.

## Sixth-Metro Minimum Output

Before the next metro is added to the cross-metro type-discovery profile, TURF
should produce:

- anchor-field target boxes,
- post-office or documented postal/civic source-gate status,
- grocery summary,
- mass-retail summary,
- pharmacy summary,
- retail-complex summary,
- pre-scale field stack,
- QSR sidecar summary,
- auto-parts sidecar summary,
- QSR / auto-parts comparison readout,
- role review that decides whether sidecars refine or change field labels.

## Good Candidate Criteria

The next metro should add a new terrain shape rather than repeat the existing
set. Strong candidates should test at least two of these:

- mountain or desert edge growth,
- older industrial river or lake corridor,
- high-density Northeast rail/subway fabric,
- Gulf/coastal evacuation or port geography,
- border or binational retail geography,
- college/government capital geography,
- polycentric Sun Belt growth outside Texas and California.

## Guardrail

The sidecar contract remains non-contentious public access evidence. It should
not introduce protected-class, individual-behavior, mobility, or official
company-territory claims.
