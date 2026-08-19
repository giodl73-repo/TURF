# Pulse 224: Minimum Postal Parish Current Anchor Gate

## Summary

Formalized the current-postal-anchor gate discovered during the West Virginia
depth review. The new contract and validator separate current post-office
anchor eligibility from everyday-service minimum-stack classification.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/48-current-postal-anchor-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/current-postal-anchor-review-contract-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/west-virginia-current-postal-anchor-review-2026-08-16.csv`
- `scripts/validate_current_postal_anchor_review.py`

## Evidence

The West Virginia current-anchor review has nine rows: four current anchors
confirmed inside the sampled target box, one current anchor confirmed outside
the sampled target box, and four current-anchor status gates.

## Boundary

This gate controls target eligibility only. It does not support West Virginia,
Appalachia, or national frequency claims.

## Validation

```powershell
python scripts\validate_current_postal_anchor_review.py --review research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\west-virginia-current-postal-anchor-review-2026-08-16.csv
python -m py_compile scripts\validate_current_postal_anchor_review.py
git diff --check
cargo fmt --check
cargo test --workspace
```
