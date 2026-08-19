# Pulse 176: Minimum Postal Parish Washington Target Gate

## Summary

Converted the A.1b Washington sparse-city candidate queue into bounded target
boxes and recorded the first post-office source gate. The Overpass fetch did
not return a usable post-office layer, so all 20 targets remain unresolved
rather than checked absent.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-postal-parish-targets.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-post-office-source-gates-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/06-washington-target-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The target boxes are derived from existing packet-ready Washington chain
coordinates in the reviewed QSR, grocery, pharmacy/drugstore, mass-retail,
auto-parts, and home-improvement layers.

Post-office fetch attempts used:

- `https://overpass-api.de/api/interpreter`
- `https://overpass.kumi.systems/api/interpreter`

Both attempts timed out before a checked post-office CSV could be produced.

## Boundary

This pulse may say the sparse-city queue now has bounded target gates. It may
not say any candidate has observed or absent post-office evidence. Every target
remains source-gated until a post-office source returns usable rows or checked
absence is established by a reviewed source.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
