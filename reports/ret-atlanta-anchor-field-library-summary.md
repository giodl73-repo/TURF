# Atlanta Anchor-Field Library Summary

## Scope

This is the second Atlanta civic-context layer for the seven field targets. It
uses reviewed OSM/Overpass `amenity=library` rows and keeps unresolved target
fetches source-gated rather than treating them as observed absences.

Generated output:

```text
reports/ret-atlanta-anchor-field-library-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-library-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-library-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Buckhead / Lenox / Phipps has Buckhead Library inside the target field. That
adds formal civic-service signal to the same Atlanta field that already has
three post-office rows.

The other six target fields remain source-gated because target-only Overpass
library attempts timed out. They should not be interpreted as library absences.

## Learning

The library layer currently tells us more about acquisition risk than about
Atlanta field structure. The one observed result is analytically useful because
it stacks with Buckhead's postal signal, but the layer is not comparable until
the source-gated fields are resolved or checked through another public source.
