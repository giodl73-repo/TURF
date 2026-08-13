# Overture Texas Mass-Retail Review: 2026-07-22.0

## Scope

Reviewed Texas mass-retail layer for the Dallas/Fort Worth pre-scale stack.

Generated output:

```text
fixtures/stores/overture-mass-retail-texas-review-2026-07-22.csv
```

## Review Counts

| Status | Rows |
|---|---:|
| `packet_ready` | 670 |
| `exclude` | 52 |

## Use

The first consuming report is:

```text
reports/ret-dallas-anchor-field-mass-retail-summary.md
```

This layer should be read as a big-box and household-trip anchor signal, not a
complete general merchandise inventory.
