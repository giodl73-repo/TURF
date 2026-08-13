# Pulse 76: Anchor Field Context Archetypes

## Goal

Summarize the checked civic and everyday context dimensions into compact field
archetypes before adding more everyday-service layers.

## Work

- Added `queries/ret-washington-anchor-field-context-archetypes.sql`.
- Generated `reports/ret-washington-anchor-field-context-archetypes.csv`.
- Added `reports/ret-washington-anchor-field-context-archetypes.md`.
- Updated README, wave state, and role review.

## Learning

The first checked context archetypes are:

- Bellevue core: `full_civic_everyday_field`
- Factoria: `park_postal_field`
- Southcenter / Tukwila: `full_civic_no_checked_pharmacy`
- Tacoma Mall: `park_only_checked_context_field`
- Kitsap Mall / Silverdale: `full_civic_everyday_field`
- South Hill / Puyallup: `mobility_pharmacy_public_space_field`

This is the synthesis we needed before scaling. TURF can now compare retail
anchor fields not just by store category depth, but by whether they have
postal, civic-service, mobility, public-space, and everyday-health anchors.

## Validation

```powershell
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
