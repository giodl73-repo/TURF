# Pulse 207: Minimum Postal Parish Settlement Proxy Join Validator

## Summary

Added a reusable validator for A.1b settlement-size proxy join tables. The
validator checks required fields, accepted settlement bucket labels, source
provenance, source dates, and duplicate nonblank `target_id` values.

## Files

- `scripts/validate_settlement_proxy_join.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/31-settlement-proxy-join-validator.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/settlement-size-proxy-smoke-join-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The existing three-row smoke join fixture validates successfully and reports
two `50000_plus` rows, one `10000_to_49999` row, and one
`manual_smoke_fixture` source.

## Boundary

This validator only gates table shape and declared provenance. It does not
certify a population source, build a Census place or ZIP/ZCTA join, create a
national post-office sample, or support a national frequency claim.

## Validation

```powershell
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\settlement-size-proxy-smoke-join-2026-08-15.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py
git diff --check
cargo fmt --check
cargo test --workspace
```
