# Philadelphia / South Jersey Anchor-Field Mass-Retail Summary

Generated output:
`reports/ret-philadelphia-anchor-field-mass-retail-summary.csv`

Source fixture:
`fixtures/stores/overture-mass-retail-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: Target, Walmart, Costco, and Sam's Club rows from Overture Places,
reviewed to exclude attached service rows and brand/name mismatches before
promotion.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-mass-retail-summary.sql"
```

## Current Read

Pennsylvania / New Jersey has 324 packet-ready reviewed mass-retail rows in
this first pass:

| Brand | Stores |
| --- | ---: |
| Walmart | 160 |
| Target | 113 |
| Costco | 31 |
| Sam's Club | 20 |
| Total | 324 |

The review excludes 34 service false positives, including gas, bakery, mobile,
optical, grocery-format, repair, and distribution-center rows.

## Philadelphia / South Jersey Field Read

| Field | Rows | Brands | Brand list | Signal |
| --- | ---: | ---: | --- | --- |
| Center City / Market East | 2 | 1 | Target | `single_brand_big_box_anchor` |
| University City / 30th Street | 0 | 0 |  | `checked_absent` |
| King of Prussia | 1 | 1 | Costco | `single_brand_big_box_anchor` |
| Northeast Philadelphia / Roosevelt Boulevard | 1 | 1 | Walmart | `single_brand_big_box_anchor` |
| Conshohocken / Plymouth Meeting | 0 | 0 |  | `checked_absent` |
| South Philadelphia Sports / Port | 1 | 1 | Target | `single_brand_big_box_anchor` |
| Camden Waterfront / Cooper | 0 | 0 |  | `checked_absent` |
| Cherry Hill / Moorestown | 2 | 2 | Target; Walmart | `multi_brand_big_box_anchor` |

## Learning

Mass retail is much sparser than grocery in the Philadelphia / South Jersey
field set. Cherry Hill / Moorestown is the only multi-brand big-box anchor,
which strengthens its South Jersey mall-corridor interpretation.

Center City / Market East, King of Prussia, Northeast Roosevelt, and South
Philadelphia Sports / Port each have a single-brand big-box anchor. King of
Prussia remains grocery checked-absent in the current box but now has Costco
signal, suggesting the field needs retail-complex confirmation before its
superregional mall/edge-city type is judged.

University City / 30th Street, Conshohocken / Plymouth Meeting, and Camden
Waterfront / Cooper are checked absent for this mass-retail layer. That keeps
them closer to institutional/rail, river-office, and older industrial
civic/service fields rather than household big-box anchors.

## Source Policy Note

Rows are Overture-derived candidates, not official chain store lists. TURF uses
them as public footprint evidence after conservative review, not as franchise
territory claims.
