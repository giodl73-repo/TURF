# Atlanta Anchor-Field Gas / Convenience Summary

## Scope

This is the second Atlanta everyday-anchor layer after the civic summary. It
uses reviewed OSM/Overpass fuel and convenience-shop rows, excluding unnamed
trip anchors and EV charging candidates when review rules identify them.

Generated output:

```text
reports/ret-atlanta-anchor-field-gas-convenience-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-gas-convenience-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-gas-convenience-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Decatur / Emory has 8 checked gas / convenience rows after excluding 2 unnamed
trip anchors. This stacks with its 12 checked finance rows.

Cumberland / Vinings, Buckhead / Lenox / Phipps, Perimeter widened, Camp Creek,
Northlake, and North Point / Alpharetta widened remain source-gated because
target-only Overpass attempts timed out. They should not be interpreted as gas
or convenience absences.

## Learning

Decatur / Emory is now the first Atlanta field with both dense finance and dense
car-trip / quick-errand texture. In civic-only terms it looked postal-only
because library, park, and transit were source-gated. Everyday anchors show a
different profile: Decatur / Emory is routine-service rich.

This is exactly why TURF needs multiple context dimensions before naming an
enclave type.
