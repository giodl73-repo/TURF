# Pulse 72: Post Office Civic Anchor Gate

## Goal

Try to fill the first source-gated civic anchor before scaling the anchor-field
context model to more urban areas.

## Work

- Added `queries/overture-post-office-washington-anchor-fields-2026-07-22.sql`.
- Attempted the target-bounded Overture post-office extraction.
- Documented the timeout and source boundary in
  `docs/research/overture-post-office-washington-anchor-fields-extraction-2026-07-22.md`.
- Updated README, wave state, and role review.

## Learning

Post offices remain the best first civic-anchor test: they connect directly to
postal identity, ZCTA/ZIP thinking, and everyday administrative geography.

The attempted remote Overture query timed out after 4 minutes and produced only
a zero-byte placeholder, so no candidate rows were retained and no reviewed
post-office layer was promoted. The context contract correctly keeps
`post_office` source-gated until a complete public-source layer exists.

The next reasonable goal is not "scale to another city" yet. It is to make
civic anchors cheap to acquire: either cache a Washington Overture Places subset
locally, run long per-target queries, or approve another open facility source.

## Validation

```powershell
duckdb -c ".read queries/overture-post-office-washington-anchor-fields-2026-07-22.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
