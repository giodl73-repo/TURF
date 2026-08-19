# Pulse 185: Minimum Postal Parish Washington Dollar Store Partial Pass

## Summary

Added a brand-targeted OSM dollar-store sidecar for the Washington A.1b target
boxes. Five targets have observed target-brand dollar-store rows, 12 are
checked absent, and three remain source-gated after Overpass timeouts.

## Files

- `scripts/fetch_osm_civic.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/12-washington-dollar-store-partial-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-dollar-store-washington-minimum-postal-parish-partial-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-dollar-store-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The observed rows are Dollar General in Bingen, Cathlamet, Connell, and Loon
Lake, plus Family Dollar in Darrington. Buckley, Mattawa, and Mesa remain
source-gated.

## Boundary

This pulse may say target-brand dollar-store rows are observed or checked
absent in completed target boxes. It may not infer income, spending, retail
quality, service adequacy, customer behavior, or absence for the three
source-gated targets.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
