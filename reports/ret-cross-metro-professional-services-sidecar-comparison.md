# Cross-Metro Professional-Services Sidecar Comparison

Generated output:
`reports/ret-cross-metro-professional-services-sidecar-comparison.csv`

Inputs:

```text
reports/ret-cross-metro-tax-prep-sidecar.csv
reports/ret-cross-metro-insurance-sidecar.csv
```

## Scope

This report compares two national professional-services sidecars across the
current 43 type-discovery fields:

- tax prep: H&R Block, Jackson Hewitt, Liberty Tax,
- insurance: State Farm, Allstate, Farmers Insurance, GEICO, Nationwide
  Insurance, American Family Insurance.

Both layers are public footprint evidence. They are not claims about customers,
income, credit, risk, assets, business quality, or individual behavior.

## Current Read

The comparison covers all 43 current type-discovery fields.

| Professional-services signal | Fields |
| --- | ---: |
| `confirmed_professional_services_grid` | 12 |
| `insurance_broad_tax_prep_light` | 21 |
| `light_professional_services_node` | 8 |
| `insurance_without_tax_prep` | 1 |
| `tax_prep_without_insurance` | 1 |

Regional totals:

| Region | Fields | Tax-prep rows | Insurance rows | Confirmed grids |
| --- | ---: | ---: | ---: | ---: |
| Washington | 6 | 12 | 43 | 1 |
| Atlanta | 7 | 11 | 147 | 0 |
| Chicago | 7 | 20 | 85 | 2 |
| Dallas/Fort Worth | 8 | 25 | 173 | 1 |
| Los Angeles / Inland Empire | 7 | 70 | 479 | 6 |
| Philadelphia / South Jersey | 8 | 23 | 113 | 2 |

Confirmed professional-services grids:

| Region | Field | Tax-prep rows | Insurance rows |
| --- | --- | ---: | ---: |
| Washington | Kitsap Mall | 4 | 17 |
| Chicago | Loop / River North | 4 | 19 |
| Chicago | Midway / Ford City | 7 | 17 |
| Dallas/Fort Worth | Arlington / Grand Prairie | 12 | 38 |
| Los Angeles / Inland Empire | Downtown LA / Koreatown / Mid-Wilshire | 12 | 62 |
| Los Angeles / Inland Empire | West LA / Century City / Culver City | 7 | 33 |
| Los Angeles / Inland Empire | South Bay / Torrance | 8 | 79 |
| Los Angeles / Inland Empire | Ontario Mills / Rancho Cucamonga | 5 | 51 |
| Los Angeles / Inland Empire | Riverside / Tyler / Corona edge | 12 | 81 |
| Los Angeles / Inland Empire | Long Beach / Lakewood | 20 | 93 |
| Philadelphia / South Jersey | Northeast Philadelphia / Roosevelt Boulevard | 8 | 45 |
| Philadelphia / South Jersey | Cherry Hill / Moorestown | 4 | 18 |

Asymmetric fields:

| Region | Field | Signal |
| --- | --- | --- |
| Chicago | Old Orchard / Skokie | `insurance_without_tax_prep` |
| Philadelphia / South Jersey | Camden Waterfront / Cooper | `tax_prep_without_insurance` |

## Decision

Do not add real estate brokerage yet.

Tax prep and insurance are enough to establish the first professional-services
sidecar pattern:

- tax prep is selective consumer professional-service signal,
- insurance is broad local agency/service fabric,
- confirmed professional-services grids appear where both are strong.

Another professional-services layer would likely add detail, but it would not
answer the next missing contrast. The next gap should be:

```text
Cross-metro gas / convenience car-trip sidecar
```

Reason:

- QSR and auto parts already show daily-trip and trade/car-service texture.
- Professional services now show consumer and local-agency service fabric.
- Gas / convenience will test whether fields are auto-trip corridors, highway
  edges, port/industrial service fields, or transit/civic fields with limited
  car-trip support.

## Guardrail

Keep professional-services sidecars outside the core profile. They provide
context about public commercial service fabric, not customer demographics,
professional quality, income, credit, risk, assets, or individual behavior.
