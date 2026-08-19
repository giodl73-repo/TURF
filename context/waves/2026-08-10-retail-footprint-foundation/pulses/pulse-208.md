# Pulse 208: Minimum Postal Parish Post-Office Seed Validator

## Summary

Added a reusable validator for reviewed A.1b post-office seed extracts. The
validator checks packet-ready post-office rows for required civic review fields,
open license status, source and rights provenance, valid coordinates, and
duplicate facility IDs.

## Files

- `scripts/validate_post_office_seed.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/32-post-office-seed-validator.md`
- `fixtures/civic/osm-post-office-washington-anchor-fields-review-2026-08-13.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The existing Washington post-office seed file validates successfully with four
packet-ready post-office rows, all in Washington and sourced from OpenStreetMap
Overpass API.

## Boundary

This pulse validates seed-table readiness only. It does not create a national
seed extract, certify OSM completeness, resolve source gates, define USPS
service areas, or support a national frequency claim.

## Validation

```powershell
python scripts\validate_post_office_seed.py --seeds fixtures\civic\osm-post-office-washington-anchor-fields-review-2026-08-13.csv
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py
git diff --check
cargo fmt --check
cargo test --workspace
```
