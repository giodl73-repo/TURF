# Movement Sidecar Target Set

## Purpose

The first A.3 build needs a bounded target set before it needs another broad
search. The target set keeps the module focused on movement-enclave evidence
and prevents port, depot, ferry, airport, and highway language from drifting
into unsupported claims.

Machine-readable target set:
`tables/movement-sidecar-targets.csv`.

## Selection

The first set has 14 targets:

- 3 ferry-side landing targets: Kingston, Bainbridge Island, Bremerton.
- 4 port/event/airport-edge targets: South Philadelphia Sports / Port, Long
  Beach / Lakewood, Camp Creek, Midway / Ford City.
- 3 highway/corridor targets: Arlington / Grand Prairie, Northeast Roosevelt,
  Cherry Hill / Moorestown.
- 4 depot/intermodal targets: Center City / Market East, University City / 30th
  Street, Loop / River North, Perimeter widened.

Most target boxes are reused from existing anchor-field target CSVs. The
ferry-side boxes are reused from A.2's selected-node pizza target set, which was
derived from reviewed Washington service coordinates with explicit state
filtering.

## First Acquisition Priority

The first movement-sidecar pass should run the layers in this order:

1. Ferry terminal or route-membership evidence for ferry-side nodes.
2. Transit center / rail station evidence for depot and edge-city nodes.
3. Truck stop / travel center evidence for highway nodes.
4. Motel/lodging evidence for highway, port/event, and airport-edge nodes.
5. Logistics/industrial and port/event anchors for port/event fields.

Existing QSR, pizza, gas/convenience, and auto-parts sidecars should be reused
where they are already aligned to the same target boxes. Where they are older
metro/place scopes, mark them as partial context rather than field-aligned
proof.

## Guardrail

Every row is a selection box. It is not a ferry catchment, port boundary,
airport catchment, station area, route-choice model, drive-time catchment,
trade area, or service-adequacy claim.
