# Pulse 179: Minimum Postal Parish Pizza Delivery Sidecar

## Summary

Converted the Domino's / Kingston observation into a reusable A.1b pizza
delivery sidecar. The sidecar keeps pizza delivery and carryout evidence
separate from the existing four-brand QSR layer and prevents false
`qsr_absent` or `postal_only_candidate` labels.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/09-pizza-delivery-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/pizza-delivery-sidecar-contract.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-pizza-delivery-seed-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The sidecar starts with five chain patterns: Domino's, Pizza Hut, Papa Johns,
Little Caesars, and Papa Murphy's. The seed evidence row is the official
Domino's Kingston store page.

## Boundary

This pulse may say pizza delivery is now a required A.1b sidecar before
minimum-stack classification. It may not claim statewide pizza coverage or
delivery-service coverage from the Kingston seed row.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
