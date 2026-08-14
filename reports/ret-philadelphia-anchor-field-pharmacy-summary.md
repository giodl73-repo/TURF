# Philadelphia / South Jersey Anchor-Field Pharmacy Summary

Generated output:
`reports/ret-philadelphia-anchor-field-pharmacy-summary.csv`

Source fixture:
`fixtures/stores/overture-drugstore-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: CVS Pharmacy, Walgreens, Rite Aid, and Good Neighbor Pharmacy exact-brand
rows from Overture Places, reviewed to exclude clinics, specialty services, and
brand/name mismatches before promotion.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-pharmacy-summary.sql"
```

## Current Read

Pennsylvania / New Jersey has 498 packet-ready reviewed exact-brand drugstore
rows in this first pass:

| Brand | Stores |
| --- | ---: |
| CVS Pharmacy | 476 |
| Walgreens | 15 |
| Rite Aid | 7 |
| Total | 498 |

The review excludes 111 clinic, specialty, beauty, photo, hospital, provider,
and brand/name false-positive rows.

## Philadelphia / South Jersey Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Center City / Market East | 6 | 2 | CVS Pharmacy; Walgreens | `multi_brand_health_errand_field` |
| University City / 30th Street | 2 | 1 | CVS Pharmacy | `observed` |
| King of Prussia | 0 | 0 |  | `checked_absent` |
| Northeast Philadelphia / Roosevelt Boulevard | 3 | 1 | CVS Pharmacy | `observed` |
| Conshohocken / Plymouth Meeting | 2 | 1 | CVS Pharmacy | `observed` |
| South Philadelphia Sports / Port | 0 | 0 |  | `checked_absent` |
| Camden Waterfront / Cooper | 0 | 0 |  | `checked_absent` |
| Cherry Hill / Moorestown | 5 | 1 | CVS Pharmacy | `observed` |

## Learning

Pharmacy adds a different split than grocery or mass retail. Center City /
Market East is the only multi-brand health-errand field in the selected target
set, combining CVS and Walgreens.

University City / 30th Street, Northeast Roosevelt, Conshohocken / Plymouth
Meeting, and Cherry Hill / Moorestown all have CVS-only observed pharmacy
signal. That does not mean no pharmacy access; it means this exact-brand
Overture layer is CVS-dominant inside those bounded fields.

King of Prussia, South Philadelphia Sports / Port, and Camden Waterfront /
Cooper are checked absent for this exact-brand layer. King of Prussia now has
postal and Costco signal but lacks grocery and exact-brand pharmacy in the
current boxes, so retail-complex confirmation should carry the next structural
test.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory or health-access claims.
