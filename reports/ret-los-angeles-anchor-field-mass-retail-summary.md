# Los Angeles / Inland Empire Anchor-Field Mass-Retail Summary

Generated output:
`reports/ret-los-angeles-anchor-field-mass-retail-summary.csv`

Source fixture:
`fixtures/stores/overture-mass-retail-california-review-2026-07-22.csv`

Scope: Target, Walmart, Costco, and Sam's Club exact-brand rows from Overture
Places, reviewed to exclude attached departments, fuel, mobile, food court,
grocery-format, and other specialty service rows.

## Current Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire field | 2 | 1 | Target | single_brand_big_box_anchor |
| Glendale / Burbank field | 4 | 3 | Costco; Target; Walmart | multi_brand_big_box_anchor |
| West LA / Century City / Culver City field | 1 | 1 | Target | single_brand_big_box_anchor |
| South Bay / Torrance field | 3 | 2 | Target; Walmart | multi_brand_big_box_anchor |
| Ontario Mills / Rancho Cucamonga field | 7 | 3 | Costco; Target; Walmart | multi_brand_big_box_anchor |
| Riverside / Tyler / Corona edge field | 3 | 2 | Costco; Walmart | multi_brand_big_box_anchor |
| Long Beach / Lakewood field | 8 | 3 | Costco; Target; Walmart | multi_brand_big_box_anchor |

## Learning

Mass retail splits LA differently than the first post-office layer. Downtown LA
and West LA are Target-only fields, matching dense urban and affluent office /
retail service terrain more than freeway big-box terrain.

Glendale/Burbank, South Bay, Ontario/Rancho Cucamonga, Riverside/Corona, and
Long Beach/Lakewood carry multi-brand big-box signal. This gives LA an early
two-layer contrast: post office lights up the dense core and South Bay, while
mass retail strongly lights up the valley, coastal/suburban, inland freeway,
and port/coastal grid fields.

## Source Policy Note

The California review excludes service-format rows that appeared inside the raw
Overture extract, including Target Mobile, Costco Food Court, Sam's Club
Connection Center, Target Grocery, Walmart Market, and Walmart Neighborhood
Market. Those rows may be useful in later grocery or service-format layers, but
they should not inflate this mass-retail anchor layer.
