# Pulse 49: Atlanta District Anchor Slices

## Goal

Test whether the anchor-modifier vocabulary still works when Atlanta is split
into named retail districts instead of city-level labels.

## Work

- Added a district-slice query for Cumberland/Vinings, Buckhead/Lenox/Phipps,
  Perimeter, Camp Creek, Northlake, North Point/Alpharetta, and Decatur/Emory.
- Generated a district anchor profile CSV.
- Added a Markdown readout explaining where the prediction works and where the
  current evidence is underfilled.

## Evidence

Query:

```text
queries/ret-atlanta-district-anchor-profile.sql
```

CSV output:

```text
reports/ret-atlanta-district-anchor-profile.csv
```

Markdown report:

```text
reports/ret-atlanta-district-anchor-profile.md
```

## Learning

District slices make the prediction problem more honest. The city-level Atlanta
row looks like an urban multi-mall service grid, but the first district boxes
often show mall evidence without enough checked category depth.

That does not disprove the anchor theory. It shows the model needs better
geography and fuller category coverage before it can confidently classify
Atlanta districts. Georgia still lacks the Washington grocery, mass-retail, and
drugstore layers, and Cumberland/Vinings is split across locality and district
edges.

## Validation

```powershell
duckdb -c ".read queries/ret-atlanta-district-anchor-profile.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
