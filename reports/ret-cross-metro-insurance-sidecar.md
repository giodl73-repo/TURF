# Cross-Metro National Insurance Sidecar

Generated output:
`reports/ret-cross-metro-insurance-sidecar.csv`

Source fixture:

```text
fixtures/stores/overture-insurance-profile-states-review-2026-07-22.csv
```

Scope: State Farm, Allstate, Farmers Insurance, GEICO, Nationwide Insurance,
and American Family Insurance exact-brand rows from Overture Places, reviewed
for public-facing local service candidates.

## Source Policy Note

Rows are public Overture-derived footprint candidates, not official agency
lists or claims about insurance customers, income, risk, credit, assets,
coverage, or individual behavior.

## Current Read

The review fixture validates with 21,163 packet-ready rows after excluding 24
brand false positives and 1,810 duplicate candidates.

Packet-ready brand counts by state:

| State | State Farm | Allstate | Farmers | GEICO | Nationwide | American Family |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| California | 1,810 | 1,136 | 3,487 | 39 | 95 | 0 |
| Georgia | 848 | 610 | 281 | 28 | 92 | 173 |
| Illinois | 998 | 582 | 644 | 11 | 27 | 386 |
| New Jersey | 251 | 337 | 230 | 16 | 0 | 0 |
| Pennsylvania | 736 | 535 | 243 | 19 | 309 | 0 |
| Texas | 1,691 | 1,583 | 2,380 | 61 | 189 | 0 |
| Washington | 356 | 295 | 506 | 12 | 10 | 157 |

## Cross-Metro Field Read

| Signal | Fields |
| --- | ---: |
| `dense_multi_brand_insurance_service_grid` | 33 |
| `multi_brand_insurance_service_grid` | 4 |
| `insurance_service_node` | 5 |
| `checked_absent` | 1 |

Regional totals:

| Region | Fields | Insurance rows | Dense grids |
| --- | ---: | ---: | ---: |
| Washington | 6 | 43 | 2 |
| Atlanta | 7 | 147 | 6 |
| Chicago | 7 | 85 | 5 |
| Dallas/Fort Worth | 8 | 173 | 8 |
| Los Angeles / Inland Empire | 7 | 479 | 7 |
| Philadelphia / South Jersey | 8 | 113 | 5 |

Dense insurance grids are broad rather than rare. Dallas/Fort Worth and Los
Angeles / Inland Empire are dense in every selected field. Atlanta is dense in
six of seven fields. Philadelphia / South Jersey is dense in five fields, with
Camden Waterfront / Cooper the only checked-absent field in the 43-field
profile.

## Learning

Insurance behaves differently from tax prep. National tax prep was selective:
12 multi-brand grids, 15 service nodes, 15 single anchors, and one checked
absence. Insurance is much broader: 33 dense multi-brand grids and only one
checked absence.

That makes insurance a general local-agency fabric rather than a sharp
consumer-professional discriminator. It is still useful, but it should answer a
different question:

- Tax prep: where are branded consumer professional-service corridors?
- Insurance: where is local agency/service fabric broadly present or missing?

The absence is therefore important. Camden has bank / credit-union and tax-prep
signal, but no checked national insurance agency rows in this layer. That keeps
it distinct from Northeast Roosevelt and Cherry Hill / Moorestown, which both
combine finance, tax prep, insurance, QSR, auto-service, and retail-corridor
signal.

The strongest convergence fields remain:

- Arlington / Grand Prairie.
- Northeast Roosevelt.
- Cherry Hill / Moorestown.
- Long Beach / Lakewood.
- Riverside / Tyler / Corona.

Insurance should be kept as a professional-services sidecar, not promoted into
the core profile. Its density is useful context, but it is too broad to replace
postal, grocery, mass retail, pharmacy, and retail-complex evidence.
