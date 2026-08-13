# Philadelphia / South Jersey Anchor-Field Grocery Summary

Generated output:
`reports/ret-philadelphia-anchor-field-grocery-summary.csv`

Source fixture:
`fixtures/stores/overture-grocery-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: selected Pennsylvania and New Jersey grocery brands from Overture Places,
reviewed to exclude attached service rows and brand/name mismatches before
promotion.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-grocery-summary.sql"
```

## Current Read

Pennsylvania / New Jersey has 799 packet-ready reviewed grocery rows in this
first pass:

| Brand | Stores |
| --- | ---: |
| ALDI | 278 |
| ShopRite | 171 |
| GIANT | 120 |
| ACME | 117 |
| Whole Foods Market | 33 |
| Trader Joe's | 33 |
| Lidl | 30 |
| Sprouts Farmers Market | 11 |
| Wegmans | 5 |
| The Fresh Market | 1 |
| Total | 799 |

The review excludes 33 service or office false positives, mostly pharmacy, gas,
and regional office rows.

## Philadelphia / South Jersey Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Center City / Market East | 7 | 4 | ACME; GIANT; Trader Joe's; Whole Foods Market | `multi_brand_grocery_grid` |
| University City / 30th Street | 4 | 3 | ACME; ALDI; GIANT | `multi_brand_grocery_grid` |
| King of Prussia | 0 | 0 |  | `checked_absent` |
| Northeast Philadelphia / Roosevelt Boulevard | 13 | 6 | ACME; ALDI; GIANT; Lidl; ShopRite; Sprouts Farmers Market | `multi_brand_grocery_grid` |
| Conshohocken / Plymouth Meeting | 3 | 2 | ALDI; GIANT | `grocery_service_field` |
| South Philadelphia Sports / Port | 6 | 4 | ACME; ALDI; ShopRite; Sprouts Farmers Market | `multi_brand_grocery_grid` |
| Camden Waterfront / Cooper | 1 | 1 | ALDI | `single_grocery_anchor` |
| Cherry Hill / Moorestown | 5 | 4 | ACME; ALDI; Wegmans; Whole Foods Market | `multi_brand_grocery_grid` |

## Learning

The grocery layer immediately separates Philadelphia / South Jersey into more
specific field textures than the postal layer alone. All eight fields had
observed post-office signal, but grocery depth is uneven.

Center City / Market East, University City / 30th Street, Northeast Roosevelt,
South Philadelphia Sports / Port, and Cherry Hill / Moorestown all show
multi-brand grocery-grid signal. Northeast Roosevelt is the strongest grocery
field in this target set, with 13 rows across six brands.

King of Prussia is checked absent inside the current grocery chain set and
bounded field. That does not mean the broader edge city lacks food retail; it
means the superregional mall/office box is not functioning as a grocery grid
under this exact reviewed brand layer.

Camden Waterfront / Cooper has one ALDI row, which gives a grocery anchor but
not a full grocery grid. That keeps the field closer to an older industrial
river civic/service field until later layers add more structure.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
