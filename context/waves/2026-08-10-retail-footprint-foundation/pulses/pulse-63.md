# Pulse 63: Washington Anchor-Field Extraction Attempt

## Goal

Run the bounded Washington retail-complex extraction and decide whether it can
produce candidate rows safely in the current environment.

## Work

- Attempted the target-bounded Overture query.
- Optimized the query to prefilter by the combined target envelope before
  assigning individual target boxes.
- Recorded the timeout result in
  `reports/ret-washington-anchor-field-extraction-attempt.md`.
- Updated README, wave state, and role review.

## Learning

The extraction did not complete. The first attempt timed out after 5 minutes,
and the optimized target-envelope attempt timed out after 10 minutes. Both left
zero-byte placeholders, which were removed. No candidate rows were kept.

The next extraction path needs a local Overture cache, per-target long-running
queries, or a prefiltered raw candidate step.

## Validation

```powershell
cargo fmt --check
cargo test --workspace
git diff --check
```
