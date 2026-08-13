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
| Bellevue core | `full_civic_multi_errand_field` | Library, parks, post office, transit, bank/credit union, gas/convenience, and pharmacy; no checked hardware, dollar store, or laundromat. |
| Factoria | `park_postal_finance_field` | Parks, postal evidence, finance errands, and gas/convenience without library, transit, pharmacy, hardware, dollar store, or laundromat. |
| Southcenter / Tukwila | `full_civic_single_errand_field` | All checked civic anchors plus finance, dollar store, gas/convenience, and hardware errands, but no checked pharmacy or laundromat. |
| Tacoma Mall | `park_finance_field` | Parks, finance errands, dollar store, gas/convenience, hardware, and laundromat without checked postal, library, transit, or pharmacy. |
| Kitsap Mall / Silverdale | `full_civic_multi_errand_field` | Library, parks, post office, transit, bank/credit union, dollar store, gas/convenience, hardware, and pharmacy; no checked laundromat. |
| South Hill / Puyallup | `mobility_errand_public_space_field` | Transit, pharmacy, finance errands, dollar store, gas/convenience, hardware, laundromat, and parks without library or civic post office. |

## Learning

The civic pass gives TURF a typed-context layer before scaling:

- Bellevue core and Kitsap / Silverdale are full civic-plus-multi-errand
  fields, but Bellevue is finance-dense while Kitsap has stronger car-trip
  texture.
- Southcenter / Tukwila is civic and mobility rich with finance errands, but
  lacks the checked pharmacy signal.
- South Hill / Puyallup reads as mobility-plus-everyday with public space and
  the strongest gas/convenience count.
- Factoria reads as park/postal/finance rather than a broad civic-service
  field, with moderate car-trip support but no checked hardware or dollar
  store.
- Tacoma Mall is no longer park-only once finance and gas/convenience are
  counted, and hardware plus laundromat add small-trade and household-service
  edges, but it remains thin across selective civic anchors.

The next useful expansion is an everyday-service layer, not another civic
layer: gym is still source-gated.
