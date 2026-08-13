# Los Angeles / Inland Empire Anchor-Field Retail-Complex Summary

Generated output:
`reports/ret-los-angeles-anchor-field-retail-complex-summary.csv`

Source fixture:
`fixtures/stores/overture-retail-complex-california-review-2026-07-22.csv`

Scope: target-limited California Overture retail-complex candidates, reviewed
to promote only high-confidence named complexes inside the seven LA / Inland
Empire fields.

## Current Read

| Field | Rows | Types | Mall | Signal | Names |
| --- | ---: | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire field | 2 | 2 | 1 | confirmed_mall_complex_field | Koreatown Plaza; Little Tokyo Mall |
| Glendale / Burbank field | 2 | 2 | 1 | confirmed_mall_complex_field | Burbank Town Center; Mall |
| West LA / Century City / Culver City field | 4 | 4 | 1 | confirmed_mall_complex_field | CENTURY CITY MALL; Century City Center Shopping Center; Culver Center; Helms Design District |
| South Bay / Torrance field | 1 | 1 | 0 | confirmed_retail_complex_field | Del Amo Fashion Center |
| Ontario Mills / Rancho Cucamonga field | 2 | 2 | 1 | confirmed_mall_complex_field | Ontario Gateway Center; Ontario Mills Mall |
| Riverside / Tyler / Corona edge field | 2 | 1 | 0 | confirmed_retail_complex_field | Corona Hills Plaza; Regal Riverside Plaza |
| Long Beach / Lakewood field | 3 | 2 | 1 | confirmed_mall_complex_field | LAKEWOOD MALL; Lakewood Center; Long Beach Towne Center |

## Learning

Retail-complex confirmation validates the selected LA fields as anchor-aware
boxes rather than arbitrary store clusters. All seven fields have named complex
structure, but the structure differs: dense urban plazas, mall/town-center
edges, affluent mixed districts, coastal mall centers, inland freeway malls,
secondary inland plazas, and port/coastal mall plus towne-center texture.

## Source Policy Note

The raw California complex extract is intentionally noisy because generic names
containing `center`, `mall`, `plaza`, or `district` catch medical centers,
schools, tenants, offices, hotels, and services. This layer is therefore
target-limited like the Texas retail-complex review: it promotes selected named
complexes and keeps duplicate/tenant candidates visible as excluded evidence.
