# Overture Texas Drugstore Review: 2026-07-22.0

## Scope

Reviewed Texas exact-brand drugstore layer for the Dallas/Fort Worth
pre-scale stack.

Generated output:

```text
fixtures/stores/overture-drugstore-texas-review-2026-07-22.csv
```

## Review Counts

| Status | Rows |
|---|---:|
| `packet_ready` | 498 |
| `exclude` | 139 |

## Review Rule

The reviewed layer excludes clinic, MinuteClinic, photo, optical, beauty,
specialty, CarePlus, infusion, hospital, provider, and HealthHUB rows before
field scoring.

## Use

The first consuming report is:

```text
reports/ret-dallas-anchor-field-pharmacy-summary.md
```

This layer is a health-errand proxy over exact-brand drugstore rows. It should
not be interpreted as a complete pharmacy-access inventory.
