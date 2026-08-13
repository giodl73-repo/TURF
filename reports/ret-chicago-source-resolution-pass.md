# Chicago Source-Resolution Pass

## Scope

This report records the first targeted source-resolution pass after the
four-metro next-scale decision.

Evidence touched:

```text
fixtures/civic/osm-post-office-chicago-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-chicago-anchor-fields-source-gates-2026-08-13.csv
reports/ret-chicago-anchor-field-post-office-summary.csv
reports/ret-chicago-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Work

The pass retried Chicago post-office extraction through the alternate Overpass
endpoint `https://overpass.kumi.systems/api/interpreter`.

Successful retry:

- Loop / River North returned 16 reviewed rows.
- Three rows are packet-ready USPS post offices.
- Thirteen rows are excluded private shipping counters.

Failed retry:

- Lincoln Park / Lakeview timed out again and remains source-gated.

## Source Policy Fix

The retry exposed a review-rule gap: DHL was being treated as packet-ready for
the post-office layer. `scripts/fetch_osm_civic.py` now excludes DHL for
`post_office`, matching the existing UPS, FedEx, Mail Boxes Etc., PostalAnnex,
and private-counter exclusions.

## Result

Loop / River North moved from:

```text
observed_layers=3, source_gated_layers=2,
readiness_tier=usable_for_type_discovery_retry_osm_before_ranking
```

to:

```text
observed_layers=4, source_gated_layers=1,
readiness_tier=usable_for_type_discovery
```

This is a real source-resolution improvement, not a new category layer. It
reduces Chicago's OSM gate load while preserving remaining source gates for
Lincoln Park / Lakeview, Old Orchard / Skokie, Woodfield / Schaumburg, Midway /
Ford City, and Orland Square.

## Learning

The Chicago issue is not absence of postal terrain. The Loop retry found dense
postal civic signal once the source endpoint responded. The remaining Chicago
post-office gates should be treated as acquisition/source-quality problems
until retried or replaced.

The private-counter ratio is also a useful urban-core signal: dense downtown
fields can contain many shipping-service counters around a smaller set of true
USPS civic anchors. TURF should keep those rows for audit, but not count them
as post-office anchors.
