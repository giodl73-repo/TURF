# First Evidence Read

## Source Basis

This first read uses existing reviewed reports only:

- cross-metro professional-services sidecar comparison,
- cross-metro tax-prep sidecar,
- cross-metro insurance sidecar,
- Washington, Atlanta, and Philadelphia / South Jersey bank / credit-union
  summaries,
- Philadelphia / South Jersey tax-prep detail.

## Signal Distribution

The cross-metro professional-services comparison covers 43 fields:

- 12 confirmed professional-services grids,
- 21 insurance-broad / tax-prep-light fields,
- 8 light professional-services nodes,
- 1 insurance-without-tax-prep field,
- 1 tax-prep-without-insurance field.

The confirmed grids are listed in:

- `tables/confirmed-professional-services-grids.csv`

## Read

Professional services behave as a service-quarter sidecar, not as a core
enclave layer.

Tax prep is selective. It produces multi-brand grids in corridor, event/power,
and large multi-center fields such as Kitsap Mall, Midway / Ford City,
Arlington / Grand Prairie, Long Beach / Lakewood, Northeast Roosevelt, and
Cherry Hill / Moorestown.

Insurance is broad. It appears as local agency/service fabric across most
fields and is dense in many places where tax prep is light.

Bank / credit-union evidence bridges public civic presence and commercial
service terrain. Washington finance rows reach all six checked fields.
Philadelphia / South Jersey finance rows reach all eight checked fields and are
dense in Center City / Market East, Northeast Roosevelt, and Cherry Hill /
Moorestown. Atlanta finance rows resolve several civic-light fields as
everyday-service rich while preserving source-gated fields as source gates.

## Spine Placement

A.4 sits after A.3 because professional-service terrain is not primarily a
movement node. It usually attaches to already legible market, corridor, civic,
mall, and office-service fields.

The working lineage is:

```text
parish/addressability -> market/provisioning -> movement nodes -> service quarter
```

## Next Gate

Build a service-quarter sidecar target contract. It should separate:

- finance fabric,
- tax-prep selectivity,
- insurance breadth,
- confirmed professional-services grids,
- future local professional-service rows.

Do not add real-estate, legal, accounting, or generic professional offices
until the false-positive rules are explicit.

## Claim Boundary

This first read supports only public-facing service-footprint evidence. It does
not support demographic, income, wealth, credit, risk, customer, or professional
quality claims.
