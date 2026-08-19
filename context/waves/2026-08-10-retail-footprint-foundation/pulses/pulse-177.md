# Pulse 177: Minimum Postal Parish Washington Post-Office Resolution

## Summary

Resolved the A.1b Washington post-office source gate with the OSM/Overpass
checked layer. Eighteen of 20 sparse-city targets have observed post-office
geometry inside the bounded target boxes; Darrington and Mesa are checked
absent in this OSM pass after single-target retries.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-post-office-washington-minimum-postal-parish-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-post-office-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/07-washington-post-office-resolution.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The checked post-office layer has:

- 20 returned post-office rows,
- 18 target boxes with observed post-office signal,
- two target boxes checked absent after single-target retries,
- seven target boxes with at least one complete street-address and postal-code
  post-office row,
- eleven observed target boxes with incomplete OSM address tags.

## Boundary

This pulse may say that OSM/Overpass post-office evidence is observed in 18
bounded target boxes and checked absent in two. It may not claim that any target
is a minimum postal parish yet. Everyday-service sidecars and place-context
evidence still need to be checked.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
