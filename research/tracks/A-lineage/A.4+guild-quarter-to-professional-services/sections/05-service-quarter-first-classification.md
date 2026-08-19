# Service-Quarter First Classification

## Scope

This pass classifies the 16 A.4 target fields using the service-quarter target
contract, the cross-metro professional-services comparison, and the available
bank / credit-union summaries.

Output:

- `tables/service-quarter-first-classification-2026-08-16.csv`

## Result

The classification has 16 rows:

- 3 depth-ready fields,
- 9 confirmed service grids that need finance standardization,
- 2 finance-core controls,
- 2 asymmetry controls.

Depth-ready fields:

- Kitsap Mall / Silverdale,
- Cherry Hill / Moorestown,
- Northeast Philadelphia / Roosevelt Boulevard.

Finance-core controls:

- Bellevue core,
- Center City / Market East.

Asymmetry controls:

- Old Orchard / Skokie: insurance without tax prep in the checked sidecar.
- Camden Waterfront / Cooper: tax prep without insurance, but with observed
  finance rows.

## Read

The first A.4 classification shows that service-quarter evidence has two
different shapes:

- confirmed service grids where tax prep and insurance both carry depth,
- finance cores where bank / credit-union density and insurance breadth are
  strong but tax prep remains light.

The strongest fully supported service-quarter candidates in the currently
available finance sources are Northeast Roosevelt and Cherry Hill / Moorestown.
Both already tie back to the A.2/A.3 corridor spine and now add public-facing
service depth.

Kitsap Mall / Silverdale is also depth-ready, but reads more like a regional
mall / civic-service field than an older urban service quarter.

Most confirmed service grids are not weak; they are finance-unstandardized in
current A.4 sources. Chicago, Dallas, and Los Angeles already have tax-prep and
insurance evidence, but their bank / credit-union rows are not standardized in
the A.4 source set yet.

## Next Gate

Standardize finance fabric for Chicago, Dallas, and Los Angeles before adding
new local professional-service categories. That should come before legal,
accounting, real-estate, notary, or generic business-service rows.

## Claim Boundary

This classification uses public service-footprint rows only. It does not
establish income, wealth, credit, risk, customer identity, demand, catchment,
trade area, professional quality, protected traits, or individual behavior.
