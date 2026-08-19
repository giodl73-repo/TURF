# Washington Target Gate

## Target Contract

The first A.1b Washington pilot now has a bounded target file:
`tables/washington-minimum-postal-parish-targets.csv`.

The target file converts the sparse city-label queue into 20 local probe boxes.
Each box is centered on existing packet-ready Washington chain coordinates from
the reviewed TURF layers used in the pilot design. The boxes are target gates,
not place boundaries, municipal boundaries, ZIP/ZCTA boundaries, or catchments.

## Post-Office Fetch Attempt

The first post-office fetch was attempted with the existing TURF OSM civic
script:

```powershell
python scripts\fetch_osm_civic.py --facility-type post_office --targets research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\washington-minimum-postal-parish-targets.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\osm-post-office-washington-minimum-postal-parish-review-2026-08-15.csv --source-date 2026-08-15 --retries 2 --request-timeout-seconds 30
```

That run timed out before the script wrote an output CSV. A second attempt used
`https://overpass.kumi.systems/api/interpreter` with one retry and a shorter
request timeout. It also timed out before returning usable rows.

The reusable source-gate table is:
`tables/washington-post-office-source-gates-2026-08-15.csv`.

## Current Evidence State

This section records the first target-gate attempt. It is superseded by
`sections/07-washington-post-office-resolution.md`, which resolves the
post-office pass after single-target retries.

At the time of this gate, all 20 Washington minimum postal parish targets
remained `source_gated` for post-office evidence. That was not checked absence;
it was an unresolved fetch gate.

The pilot may now say:

- Washington A.1b has bounded target boxes for the sparse city-label queue.
- The first OSM/Overpass post-office fetch did not return a usable checked
  layer.
- No target can be classified as `postal_only_candidate`,
  `postal_qsr_minimum`, `postal_gas_minimum`,
  `postal_dollar_store_minimum`, `postal_grocery_pharmacy_minimum`, or
  `postal_everyday_service_minimum` until the post-office gate is resolved.

## Next Step

Retry post-office evidence one target at a time, or add another open
post-office source with explicit licensing and review rules. After post-office
evidence returns, fetch gas/convenience and dollar-store evidence against the
same target contract.
