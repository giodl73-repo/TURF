# Washington Anchor-Field Review Summary

## Scope

This report reviews the 63-row Washington anchor-field retail-complex candidate
layer into TURF's standard reviewed store shape.

Generated outputs:

```text
fixtures/stores/overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv
reports/ret-washington-anchor-field-review-summary.csv
```

## Review Counts

| Target | Candidates | Packet-ready | Duplicates | False positives |
|---|---:|---:|---:|---:|
| Bellevue core | 13 | 3 | 0 | 10 |
| Factoria | 6 | 1 | 1 | 4 |
| Southcenter / Tukwila | 18 | 4 | 3 | 11 |
| Tacoma Mall | 14 | 3 | 2 | 9 |
| Kitsap Mall / Silverdale | 6 | 3 | 2 | 1 |
| South Hill / Puyallup | 6 | 2 | 2 | 2 |

Overall, 16 of 63 candidates are packet-ready, 10 are duplicate mall/complex
mentions, and 37 are false positives from name-token matching.

## Packet-Ready Complexes

| Target | Packet-ready complexes |
|---|---|
| Bellevue core | Ashwood Plaza; Bellevue Plaza Shopping Center; Plaza East |
| Factoria | The Marketplace at Factoria |
| Southcenter / Tukwila | Parkway Plaza; Parkway Square Shopping Center; Southcenter Mall; Southcenter Plaza |
| Tacoma Mall | Lincoln Plaza Shopping Center; Tacoma Mall Plaza; Tacoma Mall Shopping Ctr |
| Kitsap Mall / Silverdale | KITSAP MALL; Silverdale Plaza; Silverdale Shopping Center |
| South Hill / Puyallup | Cafaro SOUTH HILL MALL (PUYALLUP WA); SOUTH HILL MALL |

## Learning

The review confirms the candidate layer can seed broader Puget Sound anchor
testing, but the source is uneven. Southcenter, Tacoma, Kitsap, and South Hill
surface clear mall or shopping-center anchors. Factoria keeps one marketplace
complex. Bellevue core only contributes smaller plaza and shopping-center rows,
so Bellevue Square and Lincoln Square still need a better acquisition path
before the profile can treat Bellevue core as a reviewed regional mall anchor.

The review also confirms why candidate rows must stay separate from reviewed
rows: tenant-level mall mentions, transit centers, people named Mallory, parks,
paint stores, salons, cafes, and service offices dominate the false-positive
set.
