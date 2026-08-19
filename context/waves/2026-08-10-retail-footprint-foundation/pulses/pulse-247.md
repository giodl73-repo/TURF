# Pulse 247: Minimum Postal Parish Sampled Frequency Design

## Summary

Added the sampled-frequency design contract and readiness gates that must pass
before the completed truth dossiers can support regional, stratum, or national
frequency language.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/70-sampled-frequency-design.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-sampled-frequency-design-contract-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`

## Evidence

The readiness gate table records current passes for denominator builder,
denominator validator, exclusion ledger, completed truth dossiers, and
truth-dossier synthesis. It keeps formal sampling randomization, source-gate
thresholds, and the next breadth manifest as failing gates before any frequency
claim.

## Boundary

The pulse defines future frequency conditions only. It does not authorize
regional frequency, national frequency, smallest-postal-parish, complete
service absence, or catchment-isolation claims.

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
