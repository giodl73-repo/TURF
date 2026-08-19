# Pulse 206: Minimum Postal Parish Settlement Proxy Enrichment

## Summary

Added a reusable settlement-size proxy enrichment step for A.1b national
post-office sample targets. The script joins versioned settlement proxy rows by
`target_id`, then postal-city-state, then city-state, and preserves source
provenance for the joined proxy.

## Files

- `scripts/enrich_post_office_sample_settlement.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/30-settlement-proxy-enrichment.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/settlement-size-proxy-smoke-join-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-sample-targets-smoke-enriched-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The enriched smoke output has three rows: two Bellevue targets assigned
`50000_plus` and one Silverdale target assigned `10000_to_49999`. All three
join by `target_id` from the manual smoke fixture.

## Boundary

The smoke fixture validates the enrichment contract only. It is not a national
settlement join, national sample, Census place join, ZIP/ZCTA population join,
complete post-office inventory, or national frequency claim.

## Validation

```powershell
python scripts\enrich_post_office_sample_settlement.py --help
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py
git diff --check
cargo fmt --check
cargo test --workspace
```
