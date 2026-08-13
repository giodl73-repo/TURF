# Los Angeles / Inland Empire Anchor-Field Grocery Summary

Generated output:
`reports/ret-los-angeles-anchor-field-grocery-summary.csv`

Source fixture:
`fixtures/stores/overture-grocery-california-review-2026-07-22.csv`

Scope: selected California grocery brands from Overture Places, reviewed to
exclude attached service rows and brand/name mismatches before promotion.

## Current Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire field | 13 | 5 | Food 4 Less; Ralphs; Smart & Final; Vons; Whole Foods Market | multi_brand_grocery_grid |
| Glendale / Burbank field | 24 | 10 | ALDI; Gelson's; Pavilions; Ralphs; Smart & Final; Sprouts Farmers Market; Super King Markets; Trader Joe's; Vons; Whole Foods Market | multi_brand_grocery_grid |
| West LA / Century City / Culver City field | 17 | 8 | Gelson's; Pavilions; Ralphs; Smart & Final; Sprouts Farmers Market; Trader Joe's; Vons; Whole Foods Market | multi_brand_grocery_grid |
| South Bay / Torrance field | 15 | 8 | ALDI; Albertsons; Ralphs; Smart & Final; Sprouts Farmers Market; Trader Joe's; Vons; Whole Foods Market | multi_brand_grocery_grid |
| Ontario Mills / Rancho Cucamonga field | 9 | 6 | ALDI; Albertsons; Food 4 Less; Smart & Final; Stater Bros. Markets; Vons | multi_brand_grocery_grid |
| Riverside / Tyler / Corona edge field | 18 | 7 | ALDI; Albertsons; Food 4 Less; Ralphs; Smart & Final; Stater Bros. Markets; Vons | multi_brand_grocery_grid |
| Long Beach / Lakewood field | 31 | 11 | ALDI; Albertsons; Food 4 Less; Pavilions; Ralphs; Smart & Final; Sprouts Farmers Market; Stater Bros. Markets; Trader Joe's; Vons; Whole Foods Market | multi_brand_grocery_grid |

## Learning

Every selected LA / Inland Empire field has multi-brand grocery-grid signal.
That changes the interpretation of the mass-retail layer: Downtown LA and West
LA are Target-only in mass retail, but they are not weak everyday fields. They
have dense grocery service structure.

The grocery layer also helps separate field texture. Glendale/Burbank, West LA,
South Bay, and Long Beach/Lakewood combine premium/specialty brands with
mainline supermarkets. Ontario/Rancho Cucamonga and Riverside/Corona show more
inland-service composition, with Stater Bros., Food 4 Less, Albertsons, ALDI,
Smart & Final, and Vons carrying the grid.

## Source Policy Note

The review layer excludes brand/name mismatches and attached service rows before
promotion. One example caught during review was a Vons-branded Overture row
whose store name was `Vermont`; it is excluded from the promoted grocery grid.
