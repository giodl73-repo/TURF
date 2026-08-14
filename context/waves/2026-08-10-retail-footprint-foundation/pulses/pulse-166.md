# Pulse 166: Postal-Parish Research Scaffold

## Summary

Created the first TURF research module scaffold:

```text
research/tracks/A-lineage/A.1+postal-parish/
```

The module converts the approved research-track plan into a narrow, resumable
research contract. It frames postal/address infrastructure as a modern
parish-style addressability analogy while keeping postal, ZCTA, civic, retail,
and historical claims separate.

## Files

- `research/README.md`
- `research/tracks/A-lineage/README.md`
- `research/tracks/A-lineage/A.1+postal-parish/README.md`
- `research/tracks/A-lineage/A.1+postal-parish/sections/01-thesis.md`
- `research/tracks/A-lineage/A.1+postal-parish/sections/02-lineage.md`
- `research/tracks/A-lineage/A.1+postal-parish/sections/03-modern-evidence.md`
- `research/tracks/A-lineage/A.1+postal-parish/sections/04-claim-boundary.md`
- `research/tracks/A-lineage/A.1+postal-parish/tables/lineage-map.csv`
- `research/tracks/A-lineage/A.1+postal-parish/reviews/ROLE_REVIEW.md`
- `research/tracks/A-lineage/A.1+postal-parish/references.bib`

## Role Constraints Preserved

- Market Geographer: postal addressability stays separate from official civic,
  Census, ZCTA, and retail-field boundaries.
- Source Policy Auditor: the module uses repo-generated and public-source
  evidence only, with restricted USPS/proprietary/customer-behavior claims
  blocked.
- Catchment Modeler: postal evidence is context, not catchment assignment.
- Atlas Designer: the lineage table is reusable as a map legend or dashboard
  filter.
- Market Analyst: exact TURF evidence files are linked in the module.
- Future Agent: only the first module was scaffolded; B/C tracks and later
  A-lineage modules remain uncreated.

## Validation

```powershell
git diff --check
cargo fmt --check
```
