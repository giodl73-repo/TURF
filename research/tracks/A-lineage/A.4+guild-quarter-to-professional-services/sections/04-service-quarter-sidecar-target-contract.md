# Service-Quarter Sidecar Target Contract

## Scope

This contract defines the first A.4 target set and the sidecar layers that can
count as service-quarter evidence.

Outputs:

- `tables/service-quarter-sidecar-contract.csv`
- `tables/service-quarter-sidecar-targets.csv`

## Sidecar Layers

A.4 separates six roles:

- finance fabric,
- tax-prep selectivity,
- insurance breadth,
- confirmed service grid,
- asymmetry review,
- future local professional services.

Finance, tax prep, and insurance are active reviewed layers. Confirmed service
grid and asymmetry review are derived classifications from the cross-metro
professional-services comparison. Local professional services are explicitly
future work until the module has stricter false-positive rules.

## Target Set

The first target set has 16 fields:

- 12 confirmed professional-services grids,
- 2 asymmetry controls,
- 2 finance-core controls.

The confirmed grids test where tax prep and insurance jointly mark
public-facing service depth. The asymmetry controls keep the module honest
about uneven service layers. The finance-core controls test whether dense bank
/ credit-union fields should be treated differently from fields where tax prep
and insurance are the main observed service-quarter signal.

## Read

The target set keeps A.4 close to existing evidence. It does not open a broad
search for every possible professional office. That matters because legal,
accounting, real-estate, notary, and business-service categories are noisy:
they can include headquarters, back offices, online-only firms, mailing
addresses, directories, and non-public offices.

The first service-quarter pass should therefore classify existing signals
before adding new ones.

## Next Gate

Build a first A.4 service-quarter classification from:

- `tables/service-quarter-sidecar-targets.csv`,
- `reports/ret-cross-metro-professional-services-sidecar-comparison.csv`,
- available bank / credit-union summaries.

Do not add new local professional-service categories until the first
classification is reviewed.

## Claim Boundary

The contract supports public service-footprint evidence only. It does not
establish customer identity, income, wealth, credit quality, insurance risk,
tax status, business quality, professional competence, demand, catchment, trade
area, or individual behavior.
