# Washington Anchor Field Context v0

## Scope

This report starts the Civic + Everyday Anchors layer for the same six Puget
Sound anchor fields used by Anchor Profile v1.

Generated outputs:

```text
reports/ret-washington-anchor-field-context-v0.csv
reports/ret-washington-anchor-field-context-summary.csv
```

## Summary

| Field | Source-gated dimensions | Observed dimensions | Bank / credit union rows | Dollar-store rows | Gas / convenience rows | Hardware rows | Library rows | Park rows | Post-office rows | Transit rows | Pharmacy rows |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Bellevue core | 2 | 7 | 32 | 0 | 3 | 0 | 1 | 7 | 1 | 3 | 2 |
| Factoria | 2 | 4 | 7 | 0 | 6 | 0 | 0 | 4 | 1 | 0 | 0 |
| Southcenter / Tukwila | 2 | 8 | 11 | 1 | 10 | 3 | 1 | 9 | 1 | 1 | 0 |
| Tacoma Mall | 2 | 5 | 4 | 1 | 9 | 3 | 0 | 6 | 0 | 0 | 0 |
| Kitsap Mall / Silverdale | 2 | 9 | 13 | 1 | 10 | 1 | 1 | 2 | 1 | 1 | 1 |
| South Hill / Puyallup | 2 | 7 | 14 | 1 | 14 | 1 | 0 | 4 | 0 | 2 | 1 |

## First Signal

The checked civic-anchor proxies are post offices, libraries, parks/open space,
and transit centers from reviewed OSM/Overpass layers.

Libraries:

- Bellevue core has Bellevue Library.
- Southcenter / Tukwila has Southcenter Library Connection.
- Kitsap Mall / Silverdale has Kitsap Regional Library - Silverdale.
- Factoria, Tacoma Mall, and South Hill / Puyallup have no checked library row
  inside the current bounded fields.

Post offices:

- Bellevue core has Bellevue Post Office.
- Factoria has one OSM post-office civic point with incomplete address tags.
- Southcenter / Tukwila has Tukwila Post Office.
- Kitsap Mall / Silverdale has Silverdale Post Office.
- Tacoma Mall and South Hill / Puyallup only showed private shipping counters
  inside the current boxes, so no civic post-office row is counted there.

Parks / open space:

- Every field has at least one named OSM park/open-space row.
- Southcenter / Tukwila and Bellevue core have the densest named open-space
  counts.
- Tacoma Mall has parks but no checked postal, library, transit, or pharmacy
  anchor.

Transit centers:

- Bellevue core has Bellevue Downtown, Bellevue Transit Center, and East Main.
- Southcenter / Tukwila has Tukwila.
- Kitsap Mall / Silverdale has Silverdale Transit Center.
- South Hill / Puyallup has South Hill Mall Transit Center and South Hill Park
  and Ride.
- Factoria and Tacoma Mall have no checked transit-center row inside the
  current bounded fields.

The checked everyday-anchor proxies are bank/credit-union and gas/convenience
presence from reviewed OSM/Overpass layers, plus pharmacy presence from the
reviewed Washington drugstore layer.

Banks / credit unions:

- Bellevue core is the finance-dense outlier with 32 checked rows and 22
  operator/name groups.
- South Hill / Puyallup has 14 rows, Kitsap Mall / Silverdale has 13, and
  Southcenter / Tukwila has 11, giving those fields routine errand depth even
  when another civic or pharmacy signal is missing.
- Factoria has 7 rows, enough to change it from park/postal to
  park/postal/finance.
- Tacoma Mall has 4 rows, so it is no longer park-only, but it remains thin
  across the selective checked anchors.

Dollar stores:

- Southcenter / Tukwila, Tacoma Mall, Kitsap Mall / Silverdale, and South Hill
  / Puyallup each have one checked Dollar Tree row.
- Bellevue core has an excluded non-target variety-store row but no checked
  dollar-store row.
- Factoria has no checked dollar-store row.
- The value-errand signal lines up with the more auto-oriented mall and
  suburban fields rather than the tight downtown field.

Pharmacies:

- Bellevue core has Bartell Drugs and CVS Pharmacy.
- Kitsap Mall / Silverdale has CVS Pharmacy.
- South Hill / Puyallup has CVS Pharmacy.
- Factoria, Southcenter / Tukwila, and Tacoma Mall have no checked pharmacy row
  inside the current bounded fields.

## Source Gates

Gas / convenience:

- South Hill / Puyallup is the car-trip leader with 14 packet-ready rows.
- Southcenter / Tukwila and Kitsap Mall / Silverdale each have 10 rows.
- Tacoma Mall has 9 rows, which gives it a stronger auto-oriented service
  signal than its civic rows alone suggested.
- Bellevue core has only 3 rows inside the tight downtown field, despite being
  the finance-dense outlier.

Hardware:

- Southcenter / Tukwila and Tacoma Mall each have 3 checked hardware rows.
- Kitsap Mall / Silverdale and South Hill / Puyallup each have 1 row.
- Bellevue core and Factoria have no checked hardware rows inside the current
  bounded fields.
- Hardware is sparse, but it adds a small-trade signal that distinguishes
  auto-oriented mall/service fields from the tighter downtown Bellevue field.

## Source Gates

Gyms and laundromats are not yet counted. They are present in the context
contract as source-gated dimensions so later acquisition can fill them without
changing the profile shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. Bellevue core and Kitsap Mall / Silverdale now look like full
civic-plus-multi-errand fields. Southcenter / Tukwila looks full civic with
finance and car-trip errands but without the checked pharmacy signal. South
Hill / Puyallup looks mobility-plus-everyday with the strongest car-trip
texture. Southcenter / Tukwila and Tacoma Mall now carry the clearest hardware
small-trade signal and a checked value-store row. Factoria has parks, postal
evidence, finance errands, and moderate gas/convenience support but lacks
library, transit, pharmacy, hardware, and dollar-store evidence. Bellevue core
is finance-dense but gas/convenience-light, hardware-absent, and dollar-store
absent, which makes the downtown versus auto-oriented field split clearer.
