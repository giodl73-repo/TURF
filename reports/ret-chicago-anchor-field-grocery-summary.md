# Chicago Anchor-Field Grocery Summary

## Scope

This is Chicago's third non-Overpass everyday-anchor layer. It uses the reviewed
Illinois grocery layer and intersects packet-ready rows with the seven bounded
Chicago fields.

Generated output:

```text
reports/ret-chicago-anchor-field-grocery-summary.csv
```

Source fixture:

```text
fixtures/stores/overture-grocery-illinois-review-2026-07-22.csv
```

## Learning

Grocery tests whether the Chicago fields have routine neighborhood-service
depth, not just pharmacy or big-box anchor signal. It is especially useful for
separating urban core, inner-neighborhood, mature mall, and edge-city fields.

The reviewed Illinois layer has 706 raw rows and 548 packet-ready rows after
excluding pharmacy, fuel, money-services, deli, bakery, pickup, distribution,
and named internal service rows.

Field signal:

- Loop / River North has 9 grocery rows across 5 brands.
- Lincoln Park / Lakeview has 10 grocery rows across 5 brands.
- Old Orchard / Skokie has 1 Jewel-Osco row.
- Oakbrook widened has 1 Jewel-Osco row.
- Woodfield / Schaumburg has 4 rows across 4 brands.
- Midway / Ford City has 4 rows across 3 brands.
- Orland Square has 3 rows across 3 brands.

Grocery changes the Chicago read materially. Old Orchard and Orland Square were
thin in mass retail, but they are not empty everyday fields. Orland Square, in
particular, looks more like a grocery-supported south suburban mall field than
the mass-retail layer suggested. Woodfield and Ford City now have both grocery
grid signal and big-box signal.
