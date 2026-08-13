# Atlanta Anchor-Field Transit Summary

## Scope

This is the fourth Atlanta civic-context layer for the seven field targets. It
uses reviewed OSM/Overpass named transit-center and station rows and keeps
unresolved target fetches source-gated rather than treating them as observed
absences.

Generated output:

```text
reports/ret-atlanta-anchor-field-transit-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-transit-center-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-transit-center-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Perimeter widened has four checked MARTA station rows inside the target field:
Dunwoody, Medical Center, North Springs, and Sandy Springs. This makes Perimeter
the first Atlanta field with a strong observed transit-center layer.

Cumberland / Vinings, Buckhead / Lenox / Phipps, Camp Creek, Northlake, North
Point / Alpharetta widened, and Decatur / Emory remain source-gated in this
pulse because target-only Overpass attempts timed out. They should not be
interpreted as transit absences.

## Learning

Perimeter now has a distinct mobility signature: postal civic signal plus four
MARTA stations in the widened edge-city mall field. That is different from
Buckhead's post-office/library/park stack and North Point's post-office/park
stack.

The civic group is now started across all four dimensions for Atlanta, but the
high source-gate rate means the next useful report should summarize observed
versus source-gated civic dimensions before TURF moves into everyday anchors.
