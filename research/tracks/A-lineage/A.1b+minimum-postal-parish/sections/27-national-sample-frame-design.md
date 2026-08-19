# National Sample Frame Design

## Reusable Output

Sample frame contract:
`tables/national-post-office-sample-frame-contract-2026-08-15.csv`.

Fallback rules:
`tables/osm-api-fallback-rules-2026-08-15.csv`.

Three-state synthesis:
`tables/three-state-minimum-postal-parish-synthesis-2026-08-15.csv`.

## Decision

The next A.1b move should be a reproducible national sampled post-office frame,
not a fourth ad hoc sparse-chain pilot and not a national smallest-parish claim.

The three-state pilots are enough to refine the hypothesis:

- no postal-only candidate survived among 28 post-office-observed classified
  target boxes,
- food-service was observed in every classified postal stack,
- source behavior materially affected the Illinois post-office gate.

That means the national method should start from post-office points directly,
then test nearby everyday-service sidecars. Sparse chain labels can remain a
comparison layer, but they should not be the national sampling frame.

## Frame Contract

The national sample should use bounded post-office-centered target boxes as the
unit of analysis. Each sampled point needs:

- an open, license-compatible post-office or postal civic seed,
- a documented target-box geometry,
- a stratum label such as Census region or equivalent geography,
- a settlement-size proxy,
- completed sidecar statuses for food-service, gas/convenience, dollar store,
  hardware, and laundromat,
- explicit checked-absent versus source-gated status.

The first national output should report observed counts and source gates by
stratum. It should not report national frequency until the source-gated share is
low enough or explicitly handled in a versioned method note.

## Fallback Rules

Illinois changed the source rules. A single OSM/Overpass zero result is not
enough when another source path later returns rows or when a fallback hits an
API limit.

For national sampling:

- completed independent zero-row passes can support bounded checked absence,
- positive rows from any approved open OSM path resolve the target as observed,
- contradictory zeroes, API limits, or repeated timeouts remain `source_gated`,
- dense boxes may be subdivided only in a new versioned sample contract.

Food-service has an especially strict rule. A `postal_only_candidate` requires
observed post-office evidence and completed checked-absent food-service evidence.
If food-service is source-gated, the target cannot be postal-only.

## Minimum Claim Gate

The national sample may eventually test whether post-office-only target boxes
exist, but the current pilots do not justify claiming that they do. The live
working claim should be:

> Across the Washington, Georgia, and Illinois bounded pilots, the sparsest
> observed postal stacks retain named food-service.

The national sample should be designed to falsify or refine that claim.

## Boundary

This design may specify a national sampling method and source fallback rules.
It may not claim national frequency, the smallest postal parish, complete
service inventories, ZIP/ZCTA/CDP/county coverage, trade areas, catchments,
service adequacy, income, spending, or customer behavior.
