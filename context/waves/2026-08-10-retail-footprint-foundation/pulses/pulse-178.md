# Pulse 178: Minimum Postal Parish QSR Scope Gap

## Summary

Recorded the Domino's / Kingston issue as a QSR scope gap for A.1b. The current
Washington QSR layer covers only McDonald's, Burger King, Wendy's, and Taco
Bell, so it cannot prove QSR absence in sparse places.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/08-qsr-scope-gap.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-qsr-scope-gap-examples.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/references.bib`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The checked Washington QSR extract currently recognizes four brands:
McDonald's, Burger King, Wendy's, and Taco Bell. Domino's lists a Kingston,
Washington store at `8208 NE State Hwy 104 Suite 107`, outside that contract.

## Boundary

This pulse may say that current `qsr = 0` means no row in the four-brand QSR
layer. It may not say that a place has checked QSR absence until pizza/delivery
and other relevant small-place QSR chains are included or explicitly reviewed.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
