# Washington Anchor-Field Candidate Summary

## Scope

This report summarizes target-assigned retail-complex candidates for the next
Washington anchor-profile expansion. It uses the existing statewide Washington
retail-complex candidate extract as a local source, avoiding a second remote
Overture scan.

Generated outputs:

```text
fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv
reports/ret-washington-anchor-field-candidate-summary.csv
```

## Candidate Counts

| Target | Candidates |
|---|---:|
| Bellevue core | 13 |
| Factoria | 6 |
| Southcenter / Tukwila | 18 |
| Tacoma Mall | 14 |
| Kitsap Mall / Silverdale | 6 |
| South Hill / Puyallup | 6 |

## Learning

The local statewide extract is enough to seed the next review pass. The bounded
target assignment produces 63 candidate rows across the six fields, which is a
manageable human-review set compared with the original 1,684 statewide name
matches.

The candidate layer also shows why review is required: the name filter captures
true complex signals, but it also captures nearby false positives such as park,
paint, boutique, salon, transit, and person-name rows containing mall, plaza,
marketplace, or village tokens.

This is still a candidate layer. It should not be consumed by Anchor Profile v0
until rows receive `review_status` and `review_reason`.
