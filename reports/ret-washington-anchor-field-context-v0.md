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

| Field | Source-gated dimensions | Observed dimensions | Bank / credit union rows | Library rows | Park rows | Post-office rows | Transit rows | Pharmacy rows |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Bellevue core | 5 | 6 | 32 | 1 | 7 | 1 | 3 | 2 |
| Factoria | 5 | 3 | 7 | 0 | 4 | 1 | 0 | 0 |
| Southcenter / Tukwila | 5 | 5 | 11 | 1 | 9 | 1 | 1 | 0 |
| Tacoma Mall | 5 | 2 | 4 | 0 | 6 | 0 | 0 | 0 |
| Kitsap Mall / Silverdale | 5 | 6 | 13 | 1 | 2 | 1 | 1 | 1 |
| South Hill / Puyallup | 5 | 4 | 14 | 0 | 4 | 0 | 2 | 1 |

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

The checked everyday-anchor proxies are bank/credit-union presence from a
reviewed OSM/Overpass layer and pharmacy presence from the reviewed Washington
drugstore layer.

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

Gyms, laundromats, gas or convenience stores, dollar stores, and hardware
stores are not yet counted. They are present in the context contract as
source-gated dimensions so later acquisition can fill them without changing the
profile shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. Bellevue core and Kitsap Mall / Silverdale now look like full
civic-plus-multi-errand fields. Southcenter / Tukwila looks full civic with a
finance errand layer but without the checked pharmacy signal. South Hill /
Puyallup looks mobility-plus-everyday with parks. Factoria has parks, postal
evidence, and finance errands but lacks library, transit, and pharmacy. Tacoma
Mall has park and finance evidence but remains thin across selective checked
context anchors.
