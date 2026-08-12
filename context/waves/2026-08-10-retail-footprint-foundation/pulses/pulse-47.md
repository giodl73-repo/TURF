# Pulse 47: North Seattle Anchor Modifiers

## Goal

Turn retail-complex evidence into an explicit RET anchor modifier instead of
treating mall presence as a standalone enclave type.

## Work

- Added an anchor-modifier query over the generated North Seattle enclave
  profile.
- Generated a new anchor-modifier CSV report.
- Added a short Markdown readout for active regional mall anchors, legacy mall
  service grids, and smaller complex service edges.

## Evidence

Query:

```text
queries/ret-north-seattle-anchor-modifiers.sql
```

CSV output:

```text
reports/ret-north-seattle-anchor-modifiers.csv
```

Markdown report:

```text
reports/ret-north-seattle-anchor-modifiers.md
```

## Learning

The modifier read separates three patterns:

- Lynnwood / Alderwood and Everett are `active_regional_mall_anchor` zones
  because mall evidence appears with broad active store-category depth.
- Northgate / Lake City is a `legacy_mall_service_grid` because Northgate Mall
  appears without the same regional-anchor category stack.
- Edmonds and Mountlake Terrace are `small_complex_service_edge` zones because
  smaller retail complexes appear without big-box anchor depth.

This gives RET a cleaner vocabulary for outdated, retired, or redeveloping
malls: they can still shape the place without implying that the place remains
an active regional shopping anchor.

## Validation

```powershell
duckdb -c ".read queries/ret-north-seattle-anchor-modifiers.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
