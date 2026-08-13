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

| Field | Source-gated dimensions | Observed dimensions | Bank / credit union rows | Gas / convenience rows | Library rows | Park rows | Post-office rows | Transit rows | Pharmacy rows |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Bellevue core | 4 | 7 | 32 | 3 | 1 | 7 | 1 | 3 | 2 |
| Factoria | 4 | 4 | 7 | 6 | 0 | 4 | 1 | 0 | 0 |
| Southcenter / Tukwila | 4 | 6 | 11 | 10 | 1 | 9 | 1 | 1 | 0 |
| Tacoma Mall | 4 | 3 | 4 | 9 | 0 | 6 | 0 | 0 | 0 |
| Kitsap Mall / Silverdale | 4 | 7 | 13 | 10 | 1 | 2 | 1 | 1 | 1 |
| South Hill / Puyallup | 4 | 5 | 14 | 14 | 0 | 4 | 0 | 2 | 1 |

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

## Source Gates

Gyms, laundromats, dollar stores, and hardware stores are not yet counted. They
are present in the context contract as source-gated dimensions so later
acquisition can fill them without changing the profile shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. Bellevue core and Kitsap Mall / Silverdale now look like full
civic-plus-multi-errand fields. Southcenter / Tukwila looks full civic with
finance and car-trip errands but without the checked pharmacy signal. South
Hill / Puyallup looks mobility-plus-everyday with the strongest car-trip
texture. Factoria has parks, postal evidence, finance errands, and moderate
gas/convenience support but lacks library, transit, and pharmacy. Tacoma Mall
has park, finance, and gas/convenience evidence but remains thin across
selective civic anchors. Bellevue core is finance-dense but gas/convenience
light, which makes the downtown versus auto-oriented field split clearer.
