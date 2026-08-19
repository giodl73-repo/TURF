# Pulse 250: Minimum Postal Parish Mississippi Delta Settlement Preflight

## Summary

Completed the Mississippi / Deep South Delta settlement-size join and preflight
for the wave-2 target sample, and updated the preflight wrapper to honor the
deterministic `--sample-seed` selection rule.

## Files

- `scripts/run_post_office_sample_preflight.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/73-mississippi-delta-settlement-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-settlement-join-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-preflight-targets-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-preflight-enriched-targets-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-preflight-report-2026-08-16.csv`

## Evidence

The settlement join validates with 12 rows and no unknown bucket. The preflight
reports 184 packet-ready seed rows, 12 targets, 12 enriched rows, and
`target_id=12` settlement joins. The preflight target IDs match the standalone
deterministic target sample.

## Boundary

The pulse completes Mississippi preflight only. It does not complete sidecars,
classification, denominator eligibility, or frequency evidence.

## Validation

```powershell
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-settlement-join-2026-08-16.csv
python scripts\run_post_office_sample_preflight.py --seeds research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-public-post-office-seed-2026-08-16.csv --settlement-join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-settlement-join-2026-08-16.csv --targets-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-preflight-targets-2026-08-16.csv --enriched-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-preflight-enriched-targets-2026-08-16.csv --report-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\mississippi-delta-preflight-report-2026-08-16.csv --stratum-field state --sample-per-stratum 12 --sample-seed a1b-wave2-2026-08-16 --lat-delta 0.035 --lon-delta 0.045
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\filter_post_office_seed_semantics.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
