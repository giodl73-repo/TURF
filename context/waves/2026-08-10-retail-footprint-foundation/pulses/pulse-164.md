# Pulse 164: Enclave Family Consolidation

Date: 2026-08-13

## Intent

Consolidate TURF's detailed enclave labels into higher-level families and
review the result through `.roles`.

## Changes

- Added a query that maps 43 profile fields into reusable enclave families.
- Generated `reports/ret-enclave-family-consolidation.csv`.
- Added a consolidation report with family definitions and role review.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/ret-enclave-family-consolidation.sql`
- `reports/ret-enclave-family-consolidation.csv`
- `reports/ret-enclave-family-consolidation.md`
- `reports/ret-cross-metro-type-discovery-profile.csv`
- `reports/ret-cross-metro-car-trip-stack-comparison.csv`

## Result

The current profile now has a three-level organization:

```text
family -> detailed field type -> sidecar modifiers
```

The consolidation identifies 10 enclave families across 43 fields and 42
detailed type-discovery labels. The car-trip stack remains a modifier layer,
not a competing core family.

## Next

Decide whether to backfill Washington / Atlanta to current field-aligned
sidecars or add a seventh metro under the family + detailed type + modifier
contract.
