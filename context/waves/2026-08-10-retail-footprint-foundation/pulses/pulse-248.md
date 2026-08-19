# Pulse 248: Minimum Postal Parish Next Breadth Wave Manifest

## Summary

Selected the next planned breadth wave under the sampled-frequency design and
added deterministic selection and source-gate threshold controls.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/71-next-breadth-wave-manifest.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-next-breadth-wave-manifest-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-next-breadth-wave-frequency-controls-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`

## Evidence

The next planned wave selects Alaska, Northern California, Southern California,
Texas, Minnesota, and Mississippi. It defines 12 planned targets per manifest
row, deterministic SHA256 ordering with seed `a1b-wave2-2026-08-16`, and a
source-gate threshold of 20 percent overall or 4 of 12 within any manifest row.

## Boundary

The pulse selects a planned wave only. It does not create seed extracts, target
boxes, sidecar outputs, denominator rows, or regional/national frequency
claims.

## Validation

```powershell
python scripts\build_a1b_denominator_eligibility.py --eligibility-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python scripts\build_a1b_denominator_exclusion_ledger.py --ledger-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-ledger-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-summary-2026-08-16.csv
python scripts\build_a1b_candidate_truth_dossiers.py --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
python scripts\build_a1b_truth_dossier_synthesis.py --synthesis-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-synthesis-2026-08-16.csv --decision-gate-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-truth-dossier-decision-gate-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
