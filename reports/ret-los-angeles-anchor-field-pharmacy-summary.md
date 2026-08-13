# Los Angeles / Inland Empire Anchor-Field Pharmacy Summary

Generated output:
`reports/ret-los-angeles-anchor-field-pharmacy-summary.csv`

Source fixture:
`fixtures/stores/overture-drugstore-california-review-2026-07-22.csv`

Scope: CVS Pharmacy, Walgreens, Rite Aid, and Good Neighbor Pharmacy exact-brand
rows from Overture Places, reviewed to exclude clinics, specialty services, and
brand/name mismatches before promotion.

## Current Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire field | 10 | 2 | CVS Pharmacy; Walgreens | multi_brand_health_errand_field |
| Glendale / Burbank field | 6 | 1 | CVS Pharmacy | observed |
| West LA / Century City / Culver City field | 5 | 2 | CVS Pharmacy; Walgreens | multi_brand_health_errand_field |
| South Bay / Torrance field | 3 | 1 | CVS Pharmacy | observed |
| Ontario Mills / Rancho Cucamonga field | 2 | 1 | CVS Pharmacy | observed |
| Riverside / Tyler / Corona edge field | 6 | 2 | CVS Pharmacy; Walgreens | multi_brand_health_errand_field |
| Long Beach / Lakewood field | 9 | 2 | CVS Pharmacy; Rite Aid | multi_brand_health_errand_field |

## Learning

Pharmacy adds a health-errand split on top of the grocery layer. All seven
fields have exact-brand pharmacy signal, but four fields carry multi-brand
health-errand texture: Downtown LA / Koreatown / Mid-Wilshire, West LA /
Century City / Culver City, Riverside / Tyler / Corona, and Long Beach /
Lakewood.

Glendale/Burbank, South Bay/Torrance, and Ontario/Rancho Cucamonga are
CVS-only in this exact-brand layer. That does not mean no pharmacy access; it
means the current exact-brand Overture slice does not show multi-brand drugstore
depth inside the selected boxes.

## Source Policy Note

The review layer excludes brand/name mismatches before promotion. During review,
Walgreens-branded rows named `Victory Community Pharmacy` and `Community` were
excluded from the promoted field counts.
