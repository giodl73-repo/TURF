# Atlanta Anchor-Field Park Summary

## Scope

This is the third Atlanta civic-context layer for the seven field targets. It
uses reviewed OSM/Overpass named park and recreation-ground rows and keeps
unresolved target fetches source-gated rather than treating them as observed
absences.

Generated output:

```text
reports/ret-atlanta-anchor-field-park-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-park-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-park-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Parks produced dense open-space signal in the two fetched fields:

- Buckhead / Lenox / Phipps has 14 checked named open-space rows.
- North Point / Alpharetta widened has 16 checked named open-space rows.

Cumberland / Vinings, Perimeter widened, Camp Creek, Northlake, and Decatur /
Emory remain source-gated in this pulse because target-only Overpass attempts
timed out. They should not be interpreted as park absences.

## Learning

The first park signal separates two different civic textures. Buckhead stacks
post office, library, and open-space evidence inside an urban luxury mall
cluster. North Point stacks postal and open-space evidence in a widened
edge-city field, even though its library layer remains source-gated.

The dense park rows also show why TURF needs count and source-state side by
side: when OSM returns, parks are abundant; when the endpoint times out, an
empty result would be misleading.
