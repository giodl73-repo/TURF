# Pulse 240: Minimum Postal Parish Candidate Truth Dossier Index

## Summary

Added a manifest-driven candidate truth-dossier index for the five
numerator-eligible postal-only candidates in the repaired `5/61` bounded
sample.

## Files

- `scripts/build_a1b_candidate_truth_dossiers.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/63-candidate-truth-dossier-index.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv`

## Evidence

The builder reports `candidate_truth_dossier_rows=5` and
`truth_dossier_status_counts=not_yet_truth_dossier_reviewed=5`. The queue is
Clayville RI, Artesian SD, Alum Bridge WV, Carpenter WY, and Amistad NM.

## Boundary

The pulse creates the dossier queue only. It does not promote any candidate to
a confirmed postal-only exemplar or support regional, stratum, or national
frequency claims.

## Validation

```powershell
python scripts\build_a1b_candidate_truth_dossiers.py --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py
git diff --check
cargo fmt --check
cargo test --workspace
```
