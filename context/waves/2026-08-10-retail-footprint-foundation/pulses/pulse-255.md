# Pulse 255: Minimum Postal Parish Mississippi Denominator and Dossier Refresh

## Summary

Added Mississippi / Deep South Delta to the bounded denominator manifest after
Valley Park resolution, rebuilt the denominator to `7/71`, and completed truth
dossiers for Union Church and Valley Park.

## Files

- `scripts/build_a1b_denominator_eligibility.py`
- `scripts/build_a1b_truth_dossier_synthesis.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/78-mississippi-denominator-expansion.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/79-union-church-truth-dossier.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/80-valley-park-truth-dossier.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-run-manifest-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-recomputed-summary-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-truth-dossier-synthesis-2026-08-16.csv`

## Evidence

The denominator builder reports `manifest_rows=7`, `eligibility_rows=84`, and
`overall=7/71`. The dossier builder reports seven candidate rows and zero
unreviewed statuses. The truth synthesis reports five candidate classes.

## Boundary

The updated `7/71` remains a bounded sampled target-box result only. It does
not authorize regional frequency, national frequency, complete service absence,
catchment isolation, service adequacy, trade areas, income, spending, or
customer behavior.

## Validation

```powershell
python scripts\build_a1b_denominator_eligibility.py --eligibility-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python scripts\build_a1b_truth_dossier_synthesis.py --synthesis-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-synthesis-2026-08-16.csv --decision-gate-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-decision-gate-2026-08-16.csv
git diff --check
cargo fmt --check
cargo test --workspace
```
