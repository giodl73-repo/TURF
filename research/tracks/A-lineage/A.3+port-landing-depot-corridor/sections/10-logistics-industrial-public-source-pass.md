# Logistics / Industrial Public-Source Pass

## Scope

This pass follows the first logistics/industrial acquisition by using
non-Overpass public sources for the same five bounded targets.

Outputs:

- `tables/logistics-industrial-public-source-review-2026-08-16.csv`
- `tables/logistics-industrial-public-source-summary-2026-08-16.csv`

## Public Sources

Reviewed public sources:

- Holt Logistics Philaport Distribution Center:
  `https://www.holtlogistics.com/facilities/philaport-distribution-center/`
- Long Beach Container Terminal:
  `https://www.lbct.com/`
- Hartsfield-Jackson ATL Air Service Development:
  `https://www.atl.com/business-information/air-service-development/`
- Maersk Atlanta strategic air cargo hub:
  `https://www.maersk.com/news/articles/2023/07/19/maersk-expands-its-global-air-freight-services-with-new-atlanta-strategic-air-cargo-hub`
- Dart Grand Prairie distribution center:
  `https://corporate.dartcontainer.com/location/grand-prairie-tx/`
- Holman commercial vehicles:
  `https://www.holmanauto.com/commercial-vehicles/`

## Result

The pass records six public-source rows across the five target boxes:

- South Philadelphia Sports / Port: 1 packet-ready warehouse/distribution row.
- Long Beach / Lakewood: 1 packet-ready port-industrial terminal row.
- Camp Creek: 2 source-gated airport-cargo context rows because the public
  sources establish airport/Tradeport cargo support but do not yet resolve a
  clean target-box parcel match.
- Arlington / Grand Prairie: 1 packet-ready warehouse/distribution row.
- Cherry Hill / Moorestown: 1 packet-ready commercial truck-service /
  corridor-support row.

## Read

This pass materially improves A.3 logistics depth without broadening the target
frame.

South Philadelphia moves from fixture-level false positives to direct
near-dock distribution evidence through the Philaport Distribution Center.
Long Beach / Lakewood gains a named container-terminal row through Long Beach
Container Terminal. Arlington / Grand Prairie gains a direct distribution
center row through Dart. Cherry Hill / Moorestown now has both local fixture and
public-source support for the Holman truck-service corridor signal.

Camp Creek should not yet be promoted. ATL and Maersk provide strong
airport-cargo / Tradeport context, but the pass does not prove a direct parcel
inside the selected Camp Creek target box.

## Next Gate

The next useful depth pass is target-box reconciliation:

1. Geocode or otherwise parcel-check the ATL cargo complexes and Maersk Atlanta
   Tradeport facility against the Camp Creek box.
2. Add source-specific coordinates or bounded facility polygons when available.
3. Keep public-source rows separate from OSM rows until the role review decides
   whether A.3 should combine them into one logistics summary.

Do not broaden beyond the five logistics targets until Camp Creek is resolved
or explicitly left as airport-edge context only.

## Claim Boundary

This pass supports facility-footprint or named public-source context only. It
does not establish freight flow, truck counts, container volume, cargo tonnage,
employment, supply-chain importance, catchment, route choice, trip purpose,
demand, or service adequacy.
