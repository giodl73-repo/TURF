# Los Angeles / Inland Empire Anchor-Field Post Office Summary

Generated output:
`reports/ret-los-angeles-anchor-field-post-office-summary.csv`

Scope: first Los Angeles / Inland Empire pre-scale stack layer, using post
office as the civic anchor for the postal-terrain thesis.

## Current Read

| Field | Post-office rows | Private counters excluded | Signal | Gate reason |
| --- | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire field | 11 | 16 | observed |  |
| Glendale / Burbank field | 0 | 0 | source_gated | overpass_connection_timeout |
| West LA / Century City / Culver City field | 0 | 0 | source_gated | overpass_connection_timeout |
| South Bay / Torrance field | 5 | 14 | observed |  |
| Ontario Mills / Rancho Cucamonga field | 0 | 0 | source_gated | overpass_connection_timeout |
| Riverside / Tyler / Corona edge field | 0 | 0 | source_gated | overpass_connection_timeout |
| Long Beach / Lakewood field | 0 | 0 | source_gated | overpass_connection_timeout |

## Learning

The first LA layer shows strong postal civic texture in the dense urban core and
the South Bay service grid. It also shows that LA has a heavier private
shipping/mail-counter surface than Dallas or Chicago in the same post-office
query family, so review policy matters before promotion.

The five remaining fields are source-gated by Overpass connection timeouts.
They are not absence claims. Before LA enters the cross-metro type-discovery
profile, retry these gates or resolve them with an alternate open source.
