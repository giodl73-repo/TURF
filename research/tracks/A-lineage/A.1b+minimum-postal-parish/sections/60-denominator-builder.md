# Denominator Builder

## Reusable Output

Builder script:
`scripts/build_a1b_denominator_eligibility.py`.

Run manifest:
`tables/a1b-denominator-run-manifest-2026-08-16.csv`.

Generated row-level output:
`tables/a1b-denominator-eligibility-rows-2026-08-16.csv`.

Generated summary output:
`tables/a1b-denominator-recomputed-summary-2026-08-16.csv`.

## Purpose

The denominator recomputation and repair pass should be rerunnable. The builder
script converts the six completed next-wave breadth runs plus their depth,
current-anchor, private-shipping, and settlement-repair artifacts into the
current denominator eligibility table. The run list is stored in a versioned
manifest table so future strata can be added without editing Python constants.

## Command

```powershell
python scripts\build_a1b_denominator_eligibility.py `
  --eligibility-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv `
  --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
```

Expected output:

```text
manifest_rows=6
eligibility_rows=72
overall=5/61
```

## Inputs

The script uses the current six-run manifest:

- Rhode Island / New England,
- South Dakota / Great Plains,
- West Virginia / Appalachia,
- Wyoming / Mountain West,
- New Mexico / Southwest Borderlands,
- Hawaii / Island and Remote.

For each run it reads the enriched target table, local minimum-stack
classification, depth review decisions, optional current-anchor review, optional
postal-semantics review, and the Addison settlement repair table.

The manifest fields are:

- `stratum`,
- `state`,
- `run_slug`,
- `targets`,
- `classification`,
- `depth`,
- `anchor`,
- `semantics`.

## Boundary

This builder makes the denominator computation reproducible. It does not add a
new state, resolve remaining gates, or authorize regional or national frequency
claims.
