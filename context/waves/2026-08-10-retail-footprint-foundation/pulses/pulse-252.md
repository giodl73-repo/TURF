# Pulse 252: Minimum Postal Parish Mississippi Delta Current Anchor Gate

## Summary

Applied the reusable current-postal-anchor gate to the seven Mississippi /
Deep South Delta local postal-only candidates.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/75-mississippi-delta-current-anchor-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-current-postal-anchor-review-2026-08-16.csv`
- `scripts/validate_current_postal_anchor_review.py`

## Evidence

The review table has seven rows: five `current_anchor_confirmed_inside_box`,
one `current_anchor_status_gated`, and one `current_anchor_contradicted`.
Tutwiler, Union Church, Phillip/Philipp, Crowder, and Valley Park remain in the
Mississippi depth queue. Bigbee Valley is status-gated and Nitta Yuma is
contradicted by a USPS Postal Bulletin discontinuance entry.

## Boundary

This pulse confirms current postal-anchor status only. The five remaining
Mississippi candidates still require alternate-source everyday-service depth
review before denominator expansion, numerator use, or truth-dossier promotion.

## Validation

```powershell
python scripts\validate_current_postal_anchor_review.py --review research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-current-postal-anchor-review-2026-08-16.csv
```

The validator reports `review_rows=7`;
`anchor_review_statuses={'current_anchor_confirmed_inside_box': 5, 'current_anchor_contradicted': 1, 'current_anchor_status_gated': 1}`;
`inside_target_box=unknown:2,yes:5`.
