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

| Field | Source-gated dimensions | Observed dimensions | Library rows | Post-office rows | Transit rows | Pharmacy rows |
|---|---:|---:|---:|---:|---:|---:|
| Bellevue core | 7 | 4 | 1 | 1 | 3 | 2 |
| Factoria | 7 | 1 | 0 | 1 | 0 | 0 |
| Southcenter / Tukwila | 7 | 3 | 1 | 1 | 1 | 0 |
| Tacoma Mall | 7 | 0 | 0 | 0 | 0 | 0 |
| Kitsap Mall / Silverdale | 7 | 4 | 1 | 1 | 1 | 1 |
| South Hill / Puyallup | 7 | 2 | 0 | 0 | 2 | 1 |

## First Signal

The checked civic-anchor proxies are post offices, libraries, and transit
centers from reviewed OSM/Overpass layers.

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

Transit centers:

- Bellevue core has Bellevue Downtown, Bellevue Transit Center, and East Main.
- Southcenter / Tukwila has Tukwila.
- Kitsap Mall / Silverdale has Silverdale Transit Center.
- South Hill / Puyallup has South Hill Mall Transit Center and South Hill Park
  and Ride.
- Factoria and Tacoma Mall have no checked transit-center row inside the
  current bounded fields.

The first checked everyday-anchor proxy is pharmacy presence from the reviewed
Washington drugstore layer:

- Bellevue core has Bartell Drugs and CVS Pharmacy.
- Kitsap Mall / Silverdale has CVS Pharmacy.
- South Hill / Puyallup has CVS Pharmacy.
- Factoria, Southcenter / Tukwila, and Tacoma Mall have no checked pharmacy row
  inside the current bounded fields.

## Source Gates

Parks, banks or credit unions, gyms, laundromats, gas or convenience stores,
dollar stores, and hardware stores are not yet counted. They are present in the
context contract as source-gated dimensions so later acquisition can fill them
without changing the profile shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. Bellevue core and Kitsap Mall / Silverdale now look like full
civic-plus-everyday fields. Southcenter / Tukwila looks civic-mobility heavy
without the checked pharmacy signal. South Hill / Puyallup looks
mobility-plus-pharmacy. Factoria is postal-only, and Tacoma Mall is empty across
the checked context anchors.
