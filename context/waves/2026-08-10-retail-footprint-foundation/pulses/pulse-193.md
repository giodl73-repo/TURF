# Pulse 193: Minimum Postal Parish Scale-Out Decision Gate

## Summary

Recorded the A.1b scale-out decision after the completed Washington pilot. The
recommended next move is a second state pilot. National sampling remains gated
until the method is tested outside Washington or a national open-source
extraction contract is defined.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/18-scale-out-decision-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-scale-out-decision-gate-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Washington no longer supports a postal-only bucket after broad named
food-service checks. That makes another state pilot more valuable than adding
more Washington sidecars or jumping to national sampling.

## Boundary

This pulse may recommend sequencing. It may not claim national smallest-place
coverage, national frequency, complete local inventory, service adequacy,
customer behavior, income, spending, trade areas, or catchment boundaries.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
