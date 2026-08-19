# Pulse 210: Minimum Postal Parish Preflight Manifest Contract

## Summary

Added a manifest contract for future A.1b national or regional post-office
sample runs. The manifest records required inputs, validation commands, output
expectations, source-gate reporting, optional sidecar classification, and the
blocked national-frequency claim.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/34-preflight-manifest-contract.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/national-post-office-preflight-manifest-contract-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The manifest has eight rows covering seed input, seed validation, settlement
join input, settlement validation, sample preflight, source-gate reporting,
later sidecar classification, and the blocked national-frequency claim.

## Boundary

The manifest is a readiness contract only. It does not create a national seed
file, approve a settlement source, classify target boxes, certify source
coverage, or support a national frequency claim.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py
git diff --check
cargo fmt --check
cargo test --workspace
```
