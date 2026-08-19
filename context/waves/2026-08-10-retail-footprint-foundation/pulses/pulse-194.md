# Pulse 194: Minimum Postal Parish Georgia Second Pilot Selection

## Summary

Selected Georgia as the second A.1b pilot and generated a 20-target bounded
candidate queue from existing reviewed statewide chain layers. This prepares
post-office verification without assigning Georgia minimum-stack classes yet.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/19-georgia-second-pilot-selection.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-chain-sparse-city-candidates.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-second-pilot-candidate-queue-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-second-pilot-targets-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The reviewed Georgia chain layers produce 46 one-layer sparse city labels: 27
QSR-only, 10 auto-parts-only, seven grocery-only, and two pharmacy-only. The
selected queue contains 20 bounded target probes for post-office verification.

## Boundary

This pulse may select Georgia and create target probes. It may not classify
Georgia targets, claim national frequency, infer complete local inventory,
service adequacy, customer behavior, income, spending, trade areas, or
catchment boundaries.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
