# Pulse 167: Postal-Parish Evidence Read

## Summary

Added the first repo-evidence read to the `A.1+postal-parish` research module.
The read aggregates six post-office summary reports into a compact cross-metro
table and states a bounded working claim: direct postal civic signal recurs
across multiple regions and enclave families, but it reinforces rather than
defines TURF field types.

## Files

- `research/tracks/A-lineage/A.1+postal-parish/sections/05-first-evidence-read.md`
- `research/tracks/A-lineage/A.1+postal-parish/tables/post-office-signal-by-region.csv`
- `research/tracks/A-lineage/A.1+postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The table summarizes 41 bounded fields from the existing post-office summary
reports:

- Washington: 4 observed of 4 reported fields.
- Atlanta: 5 observed, 2 checked absent.
- Chicago: 4 observed, 3 source gated.
- Dallas/Fort Worth: 5 observed, 1 checked absent, 2 source gated.
- Los Angeles / Inland Empire: 2 observed, 5 source gated.
- Philadelphia / South Jersey: 8 observed of 8 reported fields.

## Boundary

The pulse uses repo-generated evidence only. External USPS, Census, and
historical citations remain a future source gate before the module makes
stronger national or historical claims.

## Validation

```powershell
git diff --check
cargo fmt --check
```
