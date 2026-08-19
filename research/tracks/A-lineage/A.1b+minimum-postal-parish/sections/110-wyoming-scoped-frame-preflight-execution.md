# Wyoming Scoped Frame Preflight Execution

## Reusable Output

Preflight status:
`tables/wyoming-scoped-frame-preflight-status-2026-08-16.csv`.

Generated outputs:

- `tables/wyoming-scoped-frame-seed-exclusion-ledger-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-targets-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-enriched-targets-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-preflight-report-2026-08-16.csv`.

## Execution

The Wyoming scoped-frame preflight was run with:

- `sample_per_stratum=0`,
- `max_total=0`,
- the existing Wyoming Geofabrik post-office seed file,
- the existing Wyoming settlement-join file.

That produced:

- 84 scoped-frame target rows,
- 84 enriched target rows,
- 26 excluded unnamed seed rows in the seed-exclusion ledger.

## Initial Gate Found

This initial preflight was structurally complete but not ready for sidecar
scale-out or estimation.

Settlement enrichment joined only 12 of 84 frame rows:

- `target_id=12`,
- `unjoined=72`.

The 72 unknown settlement-proxy rows are a method gate. The scoped-frame path
should repair settlement join coverage, or explicitly revise the design to make
settlement proxy optional, before sidecars and estimator work proceed.

## Supersession

Section 111 repairs this gate by building an 84-row scoped settlement join and
rerunning preflight. The current status after repair is:

- `target_id=84`,
- unknown settlement buckets: 0,
- next gate: scoped-frame sidecar execution.

## Boundary

This execution creates a scoped-frame preflight artifact only. It does not
classify the 84 targets, build a scoped denominator, estimate a Wyoming share,
or authorize Wyoming, Mountain West, regional, or national frequency language.
