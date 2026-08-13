# Los Angeles / Inland Empire Anchor-Field Auto-Parts Summary

Generated output:
`reports/ret-los-angeles-anchor-field-auto-parts-summary.csv`

Source fixture:
`fixtures/stores/overture-auto-parts-california-review-2026-07-22.csv`

Scope: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto Parts
rows from Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-los-angeles-anchor-field-auto-parts-summary.sql"
```

## Current Read

California has 1,308 packet-ready reviewed auto-parts rows in this first pass:

| Brand | Stores |
| --- | ---: |
| AutoZone | 670 |
| O'Reilly Auto Parts | 617 |
| NAPA Auto Parts | 21 |
| Advance Auto Parts | 0 |
| Total | 1,308 |

The review excludes 14 rows: 10 brand false positives and 4 duplicate
candidates.

## LA / Inland Empire Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Downtown LA / Koreatown / Mid-Wilshire | 7 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| Glendale / Burbank | 4 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| West LA / Century City / Culver City | 3 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| South Bay / Torrance | 5 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| Ontario Mills / Rancho Cucamonga | 7 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| Riverside / Tyler / Corona edge | 20 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |
| Long Beach / Lakewood | 19 | 2 | AutoZone; O'Reilly Auto Parts | `multi_brand_auto_service_corridor` |

## Learning

Auto parts is more selective than QSR. Every selected LA field has multi-brand
auto-service signal, but the row depth concentrates in Riverside / Tyler /
Corona and Long Beach / Lakewood.

That makes auto parts a good trade and car-service sidecar layer. It supports
the inland growth-edge and port/coastal grid reads more strongly than the
affluent West LA or valley media-retail fields.

The California source also behaves differently from Georgia and Washington:
AutoZone and O'Reilly dominate the reviewed California layer, NAPA is sparse,
and Advance Auto Parts has no packet-ready rows under the current exact-brand
filter. That should be treated as a source and market caveat before any
brand-territory claim.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
