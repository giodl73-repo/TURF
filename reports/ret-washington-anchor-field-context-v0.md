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

| Field | Source-gated dimensions | Observed dimensions | Pharmacy rows |
|---|---:|---:|---:|
| Bellevue core | 10 | 1 | 2 |
| Factoria | 10 | 0 | 0 |
| Southcenter / Tukwila | 10 | 0 | 0 |
| Tacoma Mall | 10 | 0 | 0 |
| Kitsap Mall / Silverdale | 10 | 1 | 1 |
| South Hill / Puyallup | 10 | 1 | 1 |

## First Signal

The first checked everyday-anchor proxy is pharmacy presence from the reviewed
Washington drugstore layer:

- Bellevue core has Bartell Drugs and CVS Pharmacy.
- Kitsap Mall / Silverdale has CVS Pharmacy.
- South Hill / Puyallup has CVS Pharmacy.
- Factoria, Southcenter / Tukwila, and Tacoma Mall have no checked pharmacy row
  inside the current bounded fields.

## Source Gates

Post offices, libraries, parks, transit centers, banks or credit unions, gyms,
laundromats, gas or convenience stores, dollar stores, and hardware stores are
not yet counted. They are present in the context contract as source-gated
dimensions so later acquisition can fill them without changing the profile
shape.

## Learning

This is the first bridge from retail-anchor profiles toward everyday enclave
profiles. The current result is intentionally sparse: it proves the shape and
shows one reusable everyday signal, while keeping civic and postal claims out
until reviewed public-source evidence exists.
