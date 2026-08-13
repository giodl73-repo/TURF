# Bellevue Core Anchor Acquisition Gap

## Scope

Pulse 66 flagged Bellevue core as under-captured: the reviewed anchor-field
profile had Ashwood Plaza, Bellevue Plaza Shopping Center, and Plaza East, but
not Bellevue Square, Lincoln Square, or Bellevue Place as packet-ready reviewed
complex rows.

## Attempt

Pulse 67 added a narrow Overture query:

```text
queries/overture-bellevue-core-anchor-complexes-2026-07-22.sql
```

The query targets only the bounded Bellevue core field and the names
`Bellevue Square`, `Lincoln Square`, and `Bellevue Place`.

## Result

The remote Overture scan still timed out before producing a valid fixture. The
zero-byte partial output was removed. No Bellevue core anchor rows were promoted
or manually fabricated.

## Learning

Bellevue remains an acquisition gap, not a model conclusion. The current
profile should continue to treat Bellevue core's `small_complex_service_edge`
modifier as source-limited until a verified public source path can add the
missing named complexes.

Practical next paths:

- Cache or prefilter the Overture Places parquet locally before name matching.
- Run per-name/per-bbox extracts outside the current timeout-sensitive path.
- Add a separate public-source review path for named retail complexes, keeping
  manual public-source evidence separate from Overture-derived rows.
