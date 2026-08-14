# Pulse 168: Postal-Parish Source Gate

## Summary

Added primary public USPS and Census source notes to the A.1 postal-parish
module. This closes the first source gate for the narrow addressability claim:
USPS delivery/address infrastructure and Census ZCTA approximations can be used
as a public addressability/statistical-context stack only when kept separate.

## Files

- `research/tracks/A-lineage/A.1+postal-parish/sections/06-source-notes.md`
- `research/tracks/A-lineage/A.1+postal-parish/references.bib`
- `research/tracks/A-lineage/A.1+postal-parish/sections/04-claim-boundary.md`
- `research/tracks/A-lineage/A.1+postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Sources

- U.S. Census Bureau ZCTA guidance and glossary.
- U.S. Census Bureau ZIP/ZCTA distinction and relationship-file layouts.
- USPS ZIP Code lookup, new-construction address guidance, and carrier-route
  mailing guidance.

## Boundary

The module can now support the postal/addressability stack claim. It still
cannot make stronger historical lineage claims about parishes, wards, market
towns, or record offices until historical sources are added.

## Validation

```powershell
git diff --check
cargo fmt --check
```
