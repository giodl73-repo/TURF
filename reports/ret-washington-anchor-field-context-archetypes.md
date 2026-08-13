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
| Bellevue core | `full_civic_everyday_field` | Library, parks, post office, transit, and pharmacy. |
| Factoria | `park_postal_field` | Parks plus postal evidence, without library, transit, or pharmacy. |
| Southcenter / Tukwila | `full_civic_no_checked_pharmacy` | All checked civic anchors, but no checked pharmacy. |
| Tacoma Mall | `park_only_checked_context_field` | Named parks/open space only among checked anchors. |
| Kitsap Mall / Silverdale | `full_civic_everyday_field` | Library, parks, post office, transit, and pharmacy. |
| South Hill / Puyallup | `mobility_pharmacy_public_space_field` | Transit, pharmacy, and parks without library or civic post office. |

## Learning

The civic pass gives TURF a typed-context layer before scaling:

- Bellevue core and Kitsap / Silverdale are full civic-plus-everyday fields.
- Southcenter / Tukwila is civic and mobility rich, but lacks the checked
  pharmacy signal.
- South Hill / Puyallup reads as mobility-plus-pharmacy with public space.
- Factoria reads as park/postal rather than a broad civic-service field.
- Tacoma Mall is no longer empty once parks are counted, but it remains thin
  across the selective checked anchors.

The next useful expansion is an everyday-service layer, not another civic
layer: banks or credit unions, gas/convenience, gyms, laundromats, dollar
stores, and hardware are still source-gated.
