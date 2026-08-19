# Pulse 212: Minimum Postal Parish Breadth-First Roadmap

## Summary

Launched the next A.1b phase as a breadth-first regional sample roadmap. The
roadmap prioritizes regional settlement-system coverage before depth review and
defines the gates required before any sampled sidecar classification.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/36-breadth-first-roadmap.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-breadth-first-regional-roadmap-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/a1b-regional-strata-launch-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The roadmap defines seven phases: closeout, regional seed acquisition,
settlement join, preflight sample, sidecar breadth pass, depth review, and
national summary. It also defines ten regional strata, including the three
completed baselines and seven next-wave/oversample strata.

## Boundary

This pulse launches the roadmap only. It does not create a real regional seed
extract, settlement join, sidecar classification, national frequency claim, or
smallest postal parish claim.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py scripts\build_post_office_sample_targets.py scripts\enrich_post_office_sample_settlement.py scripts\validate_settlement_proxy_join.py scripts\validate_post_office_seed.py scripts\run_post_office_sample_preflight.py
git diff --check
cargo fmt --check
cargo test --workspace
```
