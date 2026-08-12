# Pulse 62: Washington Anchor-Field Extraction Query

## Goal

Prepare the target-bounded Overture retail-complex extraction for the Washington
anchor-field targets.

## Work

- Added `queries/overture-retail-complex-washington-anchor-fields-2026-07-22.sql`.
- Added `docs/research/overture-retail-complex-washington-anchor-fields-extraction-2026-07-22.md`.
- Updated README, wave state, and role review.

## Learning

The next extraction should preserve `target_id`, `target_label`, and
`anchor_field` through review. That lets Anchor Profile v0 keep the difference
between acquisition scope and final profile geography visible.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
git diff --check
```

The Overture extraction query is prepared but not run in this pulse.
