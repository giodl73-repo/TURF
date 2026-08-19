# Pulse 239: Minimum Postal Parish Denominator Exclusion Ledger

## Summary

Added a reusable denominator exclusion ledger builder and generated row-level
and summary tables for the 11 rows excluded from the repaired `5/61` bounded
sample denominator.

## Files

- `scripts/build_a1b_denominator_exclusion_ledger.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/62-denominator-exclusion-ledger.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-exclusion-ledger-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-denominator-exclusion-summary-2026-08-16.csv`

## Evidence

The ledger builder reports `exclusion_rows=11`,
`current_anchor_failure=5`, `private_shipping_semantics=5`, and
`seed_state_mismatch=1`.

## Boundary

The pulse documents denominator exclusions only. It does not add new repair
evidence, widen the sample, or support regional, stratum, or national frequency
claims.

## Validation

```powershell
python scripts\build_a1b_denominator_exclusion_ledger.py --ledger-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-ledger-2026-08-16.csv --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-exclusion-summary-2026-08-16.csv
python scripts\validate_a1b_denominator_eligibility.py --eligibility research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-eligibility-rows-2026-08-16.csv --summary research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-denominator-recomputed-summary-2026-08-16.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py scripts\extract_geofabrik_post_office_seed.py scripts\build_census_geocoder_settlement_join.py scripts\extract_geofabrik_civic_for_targets.py scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py
git diff --check
cargo fmt --check
cargo test --workspace
```
