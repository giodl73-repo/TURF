# Chicago Anchor-Field Pharmacy Summary

## Scope

This is Chicago's first non-Overpass everyday-anchor layer. It uses the reviewed
Illinois drugstore layer as a pharmacy / health-errand proxy and intersects
packet-ready rows with the seven bounded Chicago fields.

Generated output:

```text
reports/ret-chicago-anchor-field-pharmacy-summary.csv
```

Source fixture:

```text
fixtures/stores/overture-drugstore-illinois-review-2026-07-22.csv
```

## First Signal

The reviewed Illinois layer has 249 raw rows and 170 packet-ready rows after
excluding clinic, beauty, photo, specialty, hospital, and provider rows. The
packet-ready layer contains 152 CVS Pharmacy rows and 18 Walgreens rows.

Pharmacy appears in two Chicago fields:

- Loop / River North has 7 packet-ready rows across CVS Pharmacy and Walgreens.
- Lincoln Park / Lakeview has 1 packet-ready CVS Pharmacy row.

Old Orchard / Skokie, Oakbrook widened, Woodfield / Schaumburg, Midway / Ford
City, and Orland Square are checked absent inside the bounded fields for this
exact-brand layer.

## Learning

Chicago is not blocked as a type-discovery metro. It is blocked only on the
current OSM/Overpass path. Pharmacy proves that an Overture-backed everyday
layer can still separate urban core and inner-neighborhood health-errand fields
from suburban mall and edge fields without introducing source gates.

The practical next goal is a small Chicago non-Overpass stack: pharmacy first,
then grocery or mass retail if Illinois extracts are added, and retail-complex
anchors after that. OSM dimensions should be retried later with simpler target
queries or a better Overpass window.
