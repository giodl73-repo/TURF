# Pulse 211: Minimum Postal Parish Research Closeout

## Summary

Closed the current A.1b phase as a bounded three-state pilot and method
scaffold. The closeout records the current finding, allowed claims, blocked
claims, and handoff requirements for real regional or national inputs.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/35-research-closeout.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-current-phase-closeout-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The closeout summarizes the three-state pilot: 60 target boxes, 28
post-office-observed classified target boxes, zero postal-only candidates, and
food-service evidence in every classified postal stack.

## Boundary

This closeout supports only the bounded pilot finding. It does not support
national frequency, complete inventory, smallest postal parish, service
adequacy, trade areas, catchments, income, spending, or customer behavior.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py
git diff --check
cargo fmt --check
cargo test --workspace
```
