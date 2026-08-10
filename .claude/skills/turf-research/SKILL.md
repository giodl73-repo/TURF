---
name: turf-research
description: Run a cited research pass for TURF source, design, benchmark, or adoption decisions.
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# TURF Research

Use this skill before standardizing a source contract, changing a market model,
or making a cross-repo adoption decision.

## Workflow

1. State the research question and the decision it informs.
2. Inspect local evidence first: README, product plan, fixtures, tests, and
   dependency trackers.
3. Check external sources when needed for POI coverage, licenses, geography
   definitions, routing providers, or market-analysis claims.
4. Record findings with IDs, citations, implications, confidence, and non-goals.
5. Split recommendations into adopt now, prototype, and defer/reject.
6. Run or cite validation commands for measurable claims.

## Output

Write a repo-local research note under `docs/research/`, then update affected
tracker or dependency-system files.
