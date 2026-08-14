# Philadelphia / South Jersey Anchor-Field National Tax-Prep Summary

Generated output:
`reports/ret-philadelphia-anchor-field-tax-prep-summary.csv`

Source fixture:
`fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.csv`

Scope: H&R Block, Jackson Hewitt, and Liberty Tax exact-brand rows from
Overture Places, reviewed for primary store candidates.

## Rebuild Command

```powershell
duckdb -c ".read queries/ret-philadelphia-anchor-field-tax-prep-summary.sql"
```

## Source Policy Note

Rows are Overture-derived public footprint candidates, not official store lists
or claims about tax customers, income, credit, business quality, or individual
behavior.

## Current Read

The Pennsylvania / New Jersey tax-prep review fixture validates with 873
packet-ready rows after excluding 12 brand false positives and three duplicate
candidates. The packet-ready statewide brand counts are:

| Brand | Packet-ready rows |
| --- | ---: |
| H&R Block | 543 |
| Jackson Hewitt | 240 |
| Liberty Tax | 90 |
| Total | 873 |

## Philadelphia / South Jersey Field Read

| Field | Rows | Brands | Signal |
| --- | ---: | ---: | --- |
| Center City / Market East | 3 | 1 | tax-prep service node |
| University City / 30th Street | 1 | 1 | single tax-prep anchor |
| King of Prussia | 1 | 1 | single tax-prep anchor |
| Northeast Philadelphia / Roosevelt Boulevard | 8 | 2 | multi-brand tax-prep service grid |
| Conshohocken / Plymouth Meeting | 1 | 1 | single tax-prep anchor |
| South Philadelphia Sports / Port | 4 | 1 | tax-prep service node |
| Camden Waterfront / Cooper | 1 | 1 | single tax-prep anchor |
| Cherry Hill / Moorestown | 4 | 2 | multi-brand tax-prep service grid |

## Learning

National tax prep behaves differently from bank / credit-union signal. Finance
rows reached every field and were densest in Center City, Northeast Roosevelt,
and Cherry Hill / Moorestown. Tax prep is much more corridor-facing: Northeast
Roosevelt and Cherry Hill / Moorestown are the only multi-brand tax-prep
service grids.

That suggests a useful distinction:

- Finance-service density can mark civic/commercial cores and service
  corridors.
- National tax-prep chains mark consumer professional-service access, especially
  older neighborhood and suburban retail corridors.

Center City is dense in finance but only a tax-prep service node in this
branded national layer. King of Prussia again stays specialized: one tax-prep
anchor does not change the mall-led interpretation.
