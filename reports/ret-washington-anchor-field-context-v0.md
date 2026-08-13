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

| Field | Source-gated dimensions | Observed dimensions | Post-office rows | Pharmacy rows |
|---|---:|---:|---:|---:|
| Bellevue core | 9 | 2 | 1 | 2 |
| Factoria | 9 | 1 | 1 | 0 |
| Southcenter / Tukwila | 9 | 1 | 1 | 0 |
| Tacoma Mall | 9 | 0 | 0 | 0 |
| Kitsap Mall / Silverdale | 9 | 2 | 1 | 1 |
| South Hill / Puyallup | 9 | 1 | 0 | 1 |

## First Signal

The first checked civic-anchor proxy is post-office presence from a reviewed
OSM/Overpass layer:

- Bellevue core has Bellevue Post Office.
- Factoria has one OSM post-office civic point with incomplete address tags.
- Southcenter / Tukwila has Tukwila Post Office.
- Kitsap Mall / Silverdale has Silverdale Post Office.
- Tacoma Mall and South Hill / Puyallup only showed private shipping counters
  inside the current boxes, so no civic post-office row is counted there.

The first checked everyday-anchor proxy is pharmacy presence from the reviewed
Washington drugstore layer:

- Bellevue core has Bartell Drugs and CVS Pharmacy.
- Kitsap Mall / Silverdale has CVS Pharmacy.
- South Hill / Puyallup has CVS Pharmacy.
- Factoria, Southcenter / Tukwila, and Tacoma Mall have no checked pharmacy row
  inside the current bounded fields.

## Source Gates

Libraries, parks, transit centers, banks or credit unions, gyms, laundromats,
gas or convenience stores, dollar stores, and hardware stores are not yet
counted. They are present in the context contract as source-gated dimensions so
later acquisition can fill them without changing the profile shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. The post-office split is immediately useful: several retail fields
also have postal civic anchors, while Tacoma Mall and South Hill/Puyallup look
more like commercial service fields under the current box geometry.
