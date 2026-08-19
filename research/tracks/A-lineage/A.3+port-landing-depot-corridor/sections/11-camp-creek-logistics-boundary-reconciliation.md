# Camp Creek Logistics Boundary Reconciliation

## Scope

This pass tests whether the Camp Creek airport-cargo / Atlanta Tradeport public
context can be promoted into packet-ready logistics/industrial evidence inside
the selected Camp Creek target box.

Output:

- `tables/camp-creek-logistics-boundary-reconciliation-2026-08-16.csv`

## Target Box

The selected Camp Creek logistics target box is:

- latitude: 33.6350 to 33.6750,
- longitude: -84.5350 to -84.4900.

That box captures the Camp Creek airport-edge power-center field west of the
airport. It does not automatically include the airport cargo complexes or the
Atlanta Tradeport industrial district east of the airport.

## Reconciliation

The pass checked four address-level candidates:

- ATL North Cargo Building, 3400 Inner Loop Road, Hapeville GA.
- Atlanta Tradeport Building 200, 200 Tradeport Blvd, Atlanta GA.
- Atlanta Tradeport Building 300, 300 Tradeport Dr, Atlanta GA.
- International Parkway industrial space, 4345 International Pkwy, Hapeville
  GA.

The Census geocoder returned coordinates for the Tradeport / International
Parkway addresses around longitude -84.39. Those coordinates are east of the
selected Camp Creek target box, whose eastern edge is -84.4900. The ATL North
Cargo Building address did not geocode cleanly in the Census geocoder during
this pass.

## Decision

Camp Creek remains airport-cargo context only for A.3 logistics/industrial
evidence. It should not be promoted to a packet-ready logistics-footprint row
inside the current target box.

This does not weaken Camp Creek as an airport-edge retail / power-center field.
It only says the selected Camp Creek box is not the right geometry for direct
ATL cargo or Tradeport logistics evidence.

## Next Gate

Create a separate ATL cargo / Atlanta Tradeport target if the research needs an
airport-cargo logistics example. That target should be bounded around the
cargo/Tradeport addresses, not around the Camp Creek retail field.

Do not broaden the current five-target logistics pass until the target geometry
distinguishes:

- Camp Creek retail / power-center terrain,
- ATL cargo complex terrain,
- Atlanta Tradeport industrial terrain.

## Claim Boundary

This reconciliation is a target-box decision only. It does not establish cargo
volume, freight flow, employment, airport catchment, route choice, service
adequacy, or the absence of logistics facilities elsewhere in the Camp Creek /
ATL airport-edge area.
