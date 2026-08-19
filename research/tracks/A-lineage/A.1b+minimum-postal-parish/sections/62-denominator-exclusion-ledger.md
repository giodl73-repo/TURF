# Denominator Exclusion Ledger

## Reusable Output

Ledger builder:
`scripts/build_a1b_denominator_exclusion_ledger.py`.

Row-level exclusion ledger:
`tables/a1b-denominator-exclusion-ledger-2026-08-16.csv`.

Exclusion summary:
`tables/a1b-denominator-exclusion-summary-2026-08-16.csv`.

## Purpose

The repaired denominator result is `5/61`, but the excluded rows also need an
audit trail. This ledger turns every non-clean denominator row into an explicit
exclusion decision with a category, source status, evidence summary, and next
action.

## Result

The current exclusion ledger contains 11 active exclusions:

- five West Virginia rows excluded for current-anchor failure,
- five Hawaii rows excluded for private-shipping semantics,
- one Addison WV row excluded for seed-state mismatch.

These rows stay out of the clean sampled denominator unless a later source
repair changes the source status and the denominator eligibility builder is
rerun.

## Command

```powershell
python scripts\build_a1b_denominator_exclusion_ledger.py `
  --ledger-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-ledger-2026-08-16.csv `
  --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-summary-2026-08-16.csv
```

Expected output:

```text
exclusion_rows=11
current_anchor_failure=5
private_shipping_semantics=5
seed_state_mismatch=1
```

## Boundary

The ledger documents bounded sampled denominator exclusions only. It does not
prove OSM completeness, USPS completeness, complete service absence, regional
frequency, national frequency, service adequacy, trade areas, catchments,
income, spending, or customer behavior.
