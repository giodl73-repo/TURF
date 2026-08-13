# Chicago Anchor-Field Mass-Retail Summary

## Scope

This is Chicago's second non-Overpass everyday-anchor layer. It uses the
reviewed Illinois Target / Walmart / Costco / Sam's Club layer and intersects
packet-ready rows with the seven bounded Chicago fields.

Generated output:

```text
reports/ret-chicago-anchor-field-mass-retail-summary.csv
```

Source fixture:

```text
fixtures/stores/overture-mass-retail-illinois-review-2026-07-22.csv
```

## Learning

Mass retail tests a different part of the theory than pharmacy. Pharmacy
should over-index in urban core and neighborhood-service fields. Mass retail
should appear more often in mall, edge-city, and power-center fields if the
field geometry is catching big-box anchor structure.

The reviewed Illinois layer has 277 raw rows and 242 packet-ready rows after
excluding embedded department or service rows.

Field signal:

- Loop / River North has 2 Target rows: a single-brand urban big-box signal.
- Lincoln Park / Lakeview has 3 Target rows: a single-brand inner-neighborhood
  big-box signal.
- Oakbrook widened has Costco and Walmart: a multi-brand big-box anchor signal.
- Woodfield / Schaumburg has Costco: a single-brand edge-city big-box signal.
- Midway / Ford City has Costco and Target: a multi-brand airport-edge /
  power-center signal.
- Old Orchard / Skokie and Orland Square are checked absent for this exact
  bounded layer.

This is the clearest Chicago contrast so far. Pharmacy made the urban core and
inner-neighborhood fields visible; mass retail lights up the edge-city and
airport-edge fields while still leaving some mature mall fields absent inside
the current boxes.
