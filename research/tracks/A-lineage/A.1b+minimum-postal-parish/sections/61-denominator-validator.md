# Denominator Validator

## Reusable Output

Validator script:
`scripts/validate_a1b_denominator_eligibility.py`.

Validated row-level output:
`tables/a1b-denominator-eligibility-rows-2026-08-16.csv`.

Validated summary output:
`tables/a1b-denominator-recomputed-summary-2026-08-16.csv`.

## Purpose

The manifest-driven builder makes the denominator rerunnable. The validator
makes the output contract explicit before any later repair or extension can
lean on the `5/61` result.

The validator checks:

- required row-level and summary fields,
- duplicate target IDs,
- allowed denominator, numerator, and final-class labels,
- postal-only numerator rows have depth-survivor class and inside-box current
  anchor confirmation,
- private-shipping exclusions carry the private-shipping semantic gate,
- seed-state exclusions carry the seed-state repair status,
- every summary row matches the row-level counts for its scope.

## Command

```powershell
python scripts\validate_a1b_denominator_eligibility.py `
  --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv `
  --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
```

Expected output:

```text
eligibility_rows=72
summary_rows=7
overall=5/61
```

## Boundary

The validator proves internal consistency of the denominator artifacts. It does
not prove OSM completeness, USPS completeness, complete service absence,
regional frequency, national frequency, service adequacy, trade areas,
catchments, income, spending, or customer behavior.
