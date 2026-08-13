# RET Sidecar Promotion Evidence Matrix

Generated output:
`reports/ret-sidecar-promotion-evidence-matrix.csv`

Source query:
`queries/ret-sidecar-promotion-evidence-matrix.sql`

## Scope

This matrix compares completed field-aligned QSR and auto-parts sidecars against
the current pre-scale field stacks for Los Angeles / Inland Empire, Chicago,
and Dallas/Fort Worth.

Washington and Atlanta have useful QSR and auto-parts evidence, but they are not
yet aligned to the current anchor-field sidecar contract. They should not be
used as promotion evidence until that alignment is done or explicitly waived.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-sidecar-promotion-evidence-matrix.sql"
```

## Evidence Read

The matrix covers 22 comparable fields:

| Region | Fields | Sidecar read |
| --- | ---: | --- |
| Los Angeles / Inland Empire | 7 | All seven confirm service-corridor signal. |
| Chicago | 7 | Splits daily-trip fields from auto-service fields. |
| Dallas/Fort Worth | 8 | Separates Arlington / Grand Prairie as the strongest combined field. |

Across those 22 fields:

| Sidecar read | Fields |
| --- | ---: |
| `sidecars_confirm_service_corridor` | 10 |
| `qsr_forward_auto_light_field` | 6 |
| `sidecars_light_keep_core_type` | 3 |
| `qsr_dense_auto_light_refines_daily_trip_field` | 1 |
| `sidecars_add_context_without_type_change` | 1 |
| `sidecars_confirm_combined_daily_trip_trade_grid` | 1 |

## Decision

Keep QSR and auto parts as standard sidecars for now. Do not promote them into
the core cross-metro type-discovery profile yet.

The completed sidecars add real signal, but the signal is interpretive rather
than structural enough to justify profile-contract churn:

- QSR is the daily-trip saturation layer.
- Auto parts is the trade/car-service corridor layer.
- The sidecars refine field labels, but they do not replace postal, grocery,
  mass retail, pharmacy, and retail-complex evidence as the core pre-scale
  stack.

## What The Sidecars Teach

Los Angeles / Inland Empire behaves like a broadly auto-service-capable service
region. Every selected field has QSR depth and multi-brand auto-parts signal,
so the sidecars mostly confirm already strong service-corridor interpretations.

Chicago is the sharpest split. Lincoln Park / Lakeview and Loop / River North
have QSR density without auto-parts signal, while Ford City combines QSR and
auto-service corridor signal. That makes the sidecars useful for separating
daily-trip urban fabric from trade/car-service geography.

Dallas/Fort Worth provides the clearest convergence case. Arlington / Grand
Prairie is the only field that is both a four-brand dense QSR grid and a dense
multi-brand auto-service grid. Southlake Town Square remains light on both
sidecars, and Downtown / Uptown Dallas is QSR-forward but auto-parts absent.

## Next Gate Before More Urban Areas

Before sixth-metro scale, TURF should create a standard sidecar readiness note
that says:

```text
Core profile dimensions:
postal/civic, grocery, mass retail, pharmacy, retail complex

Standard sidecars:
QSR, auto parts

Promotion status:
sidecars required for interpretation, not yet included in core profile rows
```

The open question is whether Washington and Atlanta should be retro-aligned to
anchor-field QSR/auto sidecars or accepted as older metro/place-level evidence
for the next scale move.

## Guardrail

This is public commercial footprint evidence, not a claim about official chain
territories, customer demographics, or individual behavior.
