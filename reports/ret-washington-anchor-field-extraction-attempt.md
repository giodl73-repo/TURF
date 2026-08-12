# Washington Anchor-Field Extraction Attempt

## Scope

This records the first attempt to run the target-bounded Washington
retail-complex extraction query.

Query:

```text
queries/overture-retail-complex-washington-anchor-fields-2026-07-22.sql
```

Intended output:

```text
fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv
```

## Result

The query was attempted twice:

- initial target-join query timed out after 5 minutes;
- optimized query with a combined target envelope timed out after 10 minutes.

Both attempts left only a zero-byte output placeholder. No candidate rows were
kept.

## Learning

The bottleneck appears to be the remote Overture parquet scan rather than the
number of candidate rows. Bounding after opening the remote release is not
enough to make this extraction reliable in the current shell timeout window.

The optimized query is still worth keeping because it documents the intended
target-envelope approach, but the next successful run likely needs one of:

- a local cached Overture Places parquet subset for Washington;
- separate per-target queries with a much longer execution window;
- a prefiltered Overture extraction step that writes raw candidates before
  target-box assignment.

## Source Boundary

No new candidate or reviewed store fixture was added from this attempt. Anchor
Profile v0 remains based only on checked-in reviewed layers.
