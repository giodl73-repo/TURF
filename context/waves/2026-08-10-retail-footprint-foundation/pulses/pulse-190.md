# Pulse 190: Minimum Postal Parish Hardware Gate Resolution

## Summary

Resolved the Colfax hardware source gate with a narrow node/way Overpass retry.
The hardware sidecar is now complete for the bounded Washington pass: five
observed targets and 15 checked-absent targets.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/15-washington-hardware-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-hardware-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The Colfax narrow retry completed both named `shop=hardware` node and way
selectors with zero rows. That converts the prior source gate to checked
absence. The top-level classifier remains unchanged.

## Boundary

This pulse resolves a bounded OSM hardware source gate. It may not infer
construction activity, contractor demand, repair demand, trade area, service
adequacy, spending, customer behavior, or complete local retail inventory.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
