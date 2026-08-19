# Pulse 192: Minimum Postal Parish Washington Pilot Synthesis

## Summary

Synthesized the completed Washington A.1b pilot after post-office,
food-service, gas/convenience, dollar-store, hardware, and laundromat sidecars.
The pilot has no remaining source gates in the checked sidecars and no
`postal_only_candidate` targets after broad food-service evidence.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/17-washington-pilot-synthesis.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-pilot-synthesis-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The final classifier has 15 `postal_everyday_service_minimum` targets, three
`postal_food_service_minimum` targets, and two
`postal_signal_absent_or_source_gated` targets. Clallam Bay, La Conner, and
Lopez Island are the sparsest postal-stack survivors: post office plus named
food-service signal only in the checked sidecar stack.

## Boundary

This synthesis is bounded to 20 Washington target boxes. It may not claim
national smallest-place coverage, complete local inventory, service adequacy,
customer behavior, income, spending, trade area, or catchment boundaries.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
