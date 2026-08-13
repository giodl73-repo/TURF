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

## Current Signal

Buckhead / Lenox / Phipps has Buckhead Library inside the target field. That
adds formal civic-service signal to the same Atlanta field that already has
three post-office rows.

Northlake now has Northlake-Barbara Loar Branch inside the legacy suburban mall
node field. That gives Northlake one resolved civic-service layer even though
its post-office layer is checked absent.

Camp Creek is checked absent for the library layer after the retry returned no
packet-ready rows. Cumberland / Vinings, Perimeter, North Point / Alpharetta,
and Decatur / Emory remain source-gated because target-only Overpass library
attempts timed out. They should not be interpreted as library absences.

## Learning

The library layer is starting to separate field texture from source risk.
Buckhead has a postal/library/open-space civic stack, Northlake has library
signal without USPS signal, and Camp Creek has checked absence on both postal
and library civic anchors. The remaining four source-gated fields still need
retry or alternate-source handling before the layer is comparable across
Atlanta.
