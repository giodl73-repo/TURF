# RET Sidecar Standardization Decision

## Scope

This report decides whether QSR and auto parts should become standard pre-scale
sidecar layers after the Los Angeles / Inland Empire sidecar test.

Evidence sources:

```text
reports/ret-cross-metro-type-discovery-profile.csv
reports/ret-los-angeles-anchor-field-qsr-summary.csv
reports/ret-los-angeles-anchor-field-auto-parts-summary.csv
reports/ret-los-angeles-qsr-auto-parts-comparison.md
```

## Decision

QSR and auto parts should become standard pre-scale sidecar layers.

They should not be folded into the core cross-metro type-discovery profile yet.

The correct near-term contract is:

```text
Core profile: postal, grocery, mass retail, pharmacy, retail complex.
Sidecars: QSR, auto parts.
```

## Why Standardize Them

The LA test shows the two sidecars measure different terrain:

| Layer | What It Adds | LA Result |
| --- | --- | --- |
| QSR | Daily-trip fabric and corridor saturation. | Dense in all seven fields; five four-brand fields and two three-brand corridors. |
| Auto parts | Trade, car-service, and maintenance-corridor signal. | Present in all seven fields but concentrated in Riverside / Corona and Long Beach / Lakewood. |

QSR answers whether a field is broadly saturated by everyday food trips. Auto
parts answers whether the same field is also a car-service or trade corridor.
That difference is exactly the kind of non-contentious "typed enclave" signal
TURF is trying to learn.

## Why Not Change The Core Profile Yet

The current 35-row cross-metro profile is intentionally strict:

- Washington and Atlanta use the full 11-dimension civic/service contract.
- Chicago uses a six-layer pre-scale stack.
- Dallas/Fort Worth and Los Angeles use five-layer pre-scale stacks.

QSR and auto parts currently exist as sidecars for Washington, Atlanta, and Los
Angeles, but not yet for Chicago and Dallas field targets. Folding them into the
core profile now would create uneven dimensions and make the profile look more
complete than the evidence supports.

## Standard Sidecar Contract

Each sidecar summary should expose:

- field id,
- label,
- anchor field,
- row count,
- brand count,
- brand list,
- reviewed store names,
- sidecar signal.

The source fixture must pass:

```powershell
cargo run -p turf-cli -- validate-store-review <reviewed-store-fixture.csv>
```

The sidecar remains public commercial footprint evidence, not an official chain
territory, customer demographic, or individual behavior layer.

## Next Gate

Backfill QSR and auto parts for Chicago and Dallas/Fort Worth field targets
before changing the core profile or adding a sixth metro.

The backfill plan is:

```text
reports/ret-sidecar-backfill-plan.md
```

After Chicago and Dallas sidecars exist, TURF can decide whether to:

1. keep QSR/auto as sidecars only,
2. promote them into a seven-layer pre-scale profile,
3. add a sixth metro with the five-layer core plus two standardized sidecars.
