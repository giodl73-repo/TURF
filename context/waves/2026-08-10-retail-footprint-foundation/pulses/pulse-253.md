# Pulse 253: Minimum Postal Parish Mississippi Delta Depth Review

## Summary

Depth-reviewed the five Mississippi / Deep South Delta candidates that passed
the current-anchor gate.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/76-mississippi-delta-depth-review.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-depth-review-decision-2026-08-16.csv`

## Evidence

Alternate sources reject Tutwiler, Phillip/Philipp, and Crowder as postal-only
target-box candidates. Union Church survives with a nearby-service constraint.
Valley Park remains source-gated because the listed Fast Lane gas-station
address did not geocode.

## Boundary

This pulse is candidate repair only. Mississippi still should not enter the
denominator manifest until the Valley Park source gate is resolved or an
explicit source-gate denominator rule is applied.

## Validation

```powershell
python -m py_compile scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
