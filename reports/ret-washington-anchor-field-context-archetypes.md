# Washington Anchor Field Context Archetypes

## Scope

This report summarizes the checked civic and everyday anchor dimensions for the
six Puget Sound anchor fields.

Generated output:

```text
reports/ret-washington-anchor-field-context-archetypes.csv
```

## Archetypes

| Field | Archetype | Checked read |
|---|---|---|
| Bellevue core | `full_civic_multi_errand_field` | Library, parks, post office, transit, bank/credit union, and pharmacy. |
| Factoria | `park_postal_finance_field` | Parks, postal evidence, and finance errands without library, transit, or pharmacy. |
| Southcenter / Tukwila | `full_civic_single_errand_field` | All checked civic anchors plus finance errands, but no checked pharmacy. |
| Tacoma Mall | `park_finance_field` | Parks and finance errands only among checked anchors. |
| Kitsap Mall / Silverdale | `full_civic_multi_errand_field` | Library, parks, post office, transit, bank/credit union, and pharmacy. |
| South Hill / Puyallup | `mobility_errand_public_space_field` | Transit, pharmacy, finance errands, and parks without library or civic post office. |

## Learning

The civic pass gives TURF a typed-context layer before scaling:

- Bellevue core and Kitsap / Silverdale are full civic-plus-multi-errand
  fields.
- Southcenter / Tukwila is civic and mobility rich with finance errands, but
  lacks the checked pharmacy signal.
- South Hill / Puyallup reads as mobility-plus-everyday with public space.
- Factoria reads as park/postal/finance rather than a broad civic-service
  field.
- Tacoma Mall is no longer park-only once finance is counted, but it remains
  thin across the selective checked anchors.

The next useful expansion is an everyday-service layer, not another civic
layer: gas/convenience, gyms, laundromats, dollar stores, and hardware are
still source-gated.
