# Pulse 209: Minimum Postal Parish Sample Preflight

## Summary

Added an end-to-end A.1b post-office sample preflight script. It validates
reviewed post-office seeds, validates the settlement-size join, builds bounded
target boxes, enriches the target boxes with settlement-size proxy fields, and
writes a compact report.

## Files

- `scripts/run_post_office_sample_preflight.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/33-post-office-sample-preflight.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-targets-preflight-smoke-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-targets-preflight-smoke-enriched-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-preflight-smoke-report-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The smoke preflight validates the Washington seed file and manual settlement
fixture, then writes three sampled target boxes and three enriched target rows.
All enriched rows join by `target_id`.

## Boundary

The smoke preflight proves workflow wiring only. It is not a national sample,
national settlement join, complete post-office inventory, or national frequency
claim.

## Validation

```powershell
python scripts\run_post_office_sample_preflight.py --seeds fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv --settlement-join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\settlement-size-proxy-smoke-join-2026-08-15.csv --targets-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-targets-preflight-smoke-2026-08-15.csv --enriched-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-targets-preflight-smoke-enriched-2026-08-15.csv --report-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\national-post-office-sample-preflight-smoke-report-2026-08-15.csv --sample-per-stratum 3 --max-total 3
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py
git diff --check
cargo fmt --check
cargo test --workspace
```
