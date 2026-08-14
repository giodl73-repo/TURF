# Modern TURF Evidence

TURF already has three kinds of evidence for the postal-parish module.

## Postal and ZCTA Foundation

The early roadmap and executable commands separate source postal codes from
Census ZCTA approximations:

- `summarize-postal-review` groups reviewed store rows by source postal code
  and derived `zcta_candidate`.
- `summarize-county-review` joins packet-ready postal rows to public Census
  ZCTA-to-county context.
- `fixtures/geography/zip-zcta-business-use-hypotheses.csv` records business
  use hypotheses for ZIP/ZCTA-derived layers.

This establishes the core rule for the module: ZIP, ZCTA, postal city,
municipality, county, CBSA, and retail field are different layers.

## Post-Office Civic Layer

Post-office readouts exist for six metro programs:

- Washington: `reports/ret-washington-anchor-field-post-office-summary.md`
- Atlanta: `reports/ret-atlanta-anchor-field-post-office-summary.md`
- Chicago: `reports/ret-chicago-anchor-field-post-office-summary.md`
- Dallas/Fort Worth:
  `reports/ret-dallas-anchor-field-post-office-summary.md`
- Los Angeles / Inland Empire:
  `reports/ret-los-angeles-anchor-field-post-office-summary.md`
- Philadelphia / South Jersey:
  `reports/ret-philadelphia-anchor-field-post-office-summary.md`

These reports treat USPS-like rows, checked absences, private counter excludes,
and source gates as distinct outcomes.

## Type-Discovery and Family Evidence

The cross-metro type-discovery profile converts core and sidecar layers into
comparable typed fields:

- `reports/ret-cross-metro-type-discovery-profile.md`
- `reports/ret-cross-metro-type-discovery-profile.csv`

The enclave family consolidation then groups 42 detailed labels into 10
families:

- `reports/ret-enclave-family-consolidation.md`
- `reports/ret-enclave-family-consolidation.csv`

For this module, postal evidence is a lineage and civic-addressability layer.
The family label remains the terrain summary, and sidecars remain modifiers.
