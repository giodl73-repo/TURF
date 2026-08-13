# Pulse 106: Chicago Type-Discovery Synthesis

## Goal

Turn the refreshed Chicago field stack into a readable type-discovery synthesis
before adding another metro or retrying OSM.

## Work

- Added a Chicago type-discovery synthesis report.
- Interpreted each field from the combined stack.
- Kept observed, checked-absent, and source-gated evidence separate.
- Set the next decision gate: reusable synthesis contract versus Chicago OSM
  retry.

## Evidence

Source stack:

```text
reports/ret-chicago-pre-scale-field-stack.csv
```

Synthesis:

```text
reports/ret-chicago-type-discovery-synthesis.md
```

## Learning

Chicago now shows a useful spread of typed fields:

- Loop / River North: urban core everyday grid.
- Lincoln Park / Lakeview: inner-neighborhood everyday grid.
- Old Orchard / Skokie: confirmed single-grocery mall field.
- Oakbrook widened: confirmed postal/big-box edge field.
- Woodfield / Schaumburg: confirmed edge-city mall/grocery field.
- Midway / Ford City: confirmed mall/big-box/grocery power field.
- Orland Square: confirmed grocery-supported mall field.

The stack supports the working theory that public chains create typed territory
fields when category layers intersect. Chicago is ready for type discovery but
not final ranking because OSM civic/wellness gates remain unresolved.

## Next Gate

The next best scale move is a reusable type-discovery synthesis contract across
Washington, Atlanta, and Chicago. The alternate path is a simplified Chicago
OSM retry track if the priority is civic/wellness resolution before comparison.

## Validation

```powershell
git diff --check
cargo fmt --check
cargo test --workspace
```
