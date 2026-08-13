# Overture Texas Grocery Review: 2026-07-22.0

## Scope

Reviewed Texas grocery layer for the Dallas/Fort Worth pre-scale stack.

Generated output:

```text
fixtures/stores/overture-grocery-texas-review-2026-07-22.csv
```

## Review Contract

Rows are marked:

- `packet_ready` for primary grocery-store candidates,
- `exclude` for brand-attached service or office rows.

The first exclusion pass covers pharmacy, fuel, gas, floral, pickup, delivery,
office, division, and express-format names.

## Use

The first consuming report is:

```text
reports/ret-dallas-anchor-field-grocery-summary.md
```

Dallas/Fort Worth grocery rows should be treated as an everyday-service signal,
not a complete grocery-access inventory.
