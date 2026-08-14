# Cross-Metro National Tax-Prep Sidecar

Generated output:
`reports/ret-cross-metro-tax-prep-sidecar.csv`

Source fixtures:

```text
fixtures/stores/overture-tax-prep-profile-states-review-2026-07-22.csv
fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.csv
```

Scope: H&R Block, Jackson Hewitt, and Liberty Tax exact-brand rows from
Overture Places, reviewed for primary store candidates.

## Source Policy Note

Rows are public Overture-derived footprint candidates, not official store
lists or claims about tax customers, income, credit, business quality, or
individual behavior.

## Current Read

The missing-profile-state review fixture validates with 4,176 packet-ready
rows after excluding 375 brand false positives and eight duplicate candidates.
Combined with the Pennsylvania / New Jersey review fixture, the sidecar covers
all 43 current type-discovery fields.

Missing-profile-state packet-ready brand counts:

| State | H&R Block | Jackson Hewitt | Liberty Tax |
| --- | ---: | ---: | ---: |
| California | 777 | 251 | 180 |
| Georgia | 279 | 199 | 44 |
| Illinois | 341 | 217 | 63 |
| Texas | 701 | 605 | 179 |
| Washington | 202 | 97 | 41 |

## Cross-Metro Field Read

| Signal | Fields |
| --- | ---: |
| `multi_brand_tax_prep_service_grid` | 12 |
| `tax_prep_service_node` | 15 |
| `single_tax_prep_anchor` | 15 |
| `checked_absent` | 1 |

Regional totals:

| Region | Fields | Tax-prep rows | Multi-brand grids |
| --- | ---: | ---: | ---: |
| Washington | 6 | 12 | 1 |
| Atlanta | 7 | 11 | 0 |
| Chicago | 7 | 20 | 2 |
| Dallas/Fort Worth | 8 | 25 | 1 |
| Los Angeles / Inland Empire | 7 | 70 | 6 |
| Philadelphia / South Jersey | 8 | 23 | 2 |

Multi-brand tax-prep service grids:

| Region | Field | Rows | Brands |
| --- | --- | ---: | ---: |
| Washington | Kitsap Mall | 4 | 3 |
| Chicago | Loop / River North | 4 | 2 |
| Chicago | Midway / Ford City | 7 | 3 |
| Dallas/Fort Worth | Arlington / Grand Prairie | 12 | 3 |
| Los Angeles / Inland Empire | Downtown LA / Koreatown / Mid-Wilshire | 12 | 2 |
| Los Angeles / Inland Empire | West LA / Century City / Culver City | 7 | 2 |
| Los Angeles / Inland Empire | South Bay / Torrance | 8 | 2 |
| Los Angeles / Inland Empire | Ontario Mills / Rancho Cucamonga | 5 | 2 |
| Los Angeles / Inland Empire | Riverside / Tyler / Corona edge | 12 | 3 |
| Los Angeles / Inland Empire | Long Beach / Lakewood | 20 | 3 |
| Philadelphia / South Jersey | Northeast Philadelphia / Roosevelt Boulevard | 8 | 2 |
| Philadelphia / South Jersey | Cherry Hill / Moorestown | 4 | 2 |

The only checked-absent field is Old Orchard / Skokie.

## Learning

National tax prep is a strong professional-services sidecar, but it is not a
simple finance clone. It reaches 42 of 43 fields, yet multi-brand depth clusters
in specific service corridors, event/power fields, and LA's broader
multi-center urban fabric.

Los Angeles / Inland Empire is the outlier: six of seven fields are multi-brand
tax-prep grids. That suggests branded tax prep may be especially useful for
detecting broad consumer professional-service fabric in mega-region fields.

Atlanta is the opposite case. All seven fields have some tax-prep signal, but
none become multi-brand grids inside the current boxes. That keeps Atlanta's
professional-service sidecar light until a future layer such as insurance, real
estate, or generic accounting offices is tested.

The convergence fields are especially interesting:

- Arlington / Grand Prairie combines QSR, auto parts, and tax-prep depth.
- Northeast Roosevelt combines QSR, auto parts, finance, and tax-prep depth.
- Cherry Hill / Moorestown combines mall, big-box, finance, auto parts, QSR,
  and tax-prep signal.

That makes national tax prep a candidate standard sidecar for
consumer-professional service texture, but it should stay outside the core
profile until another professional-services layer confirms the pattern.
