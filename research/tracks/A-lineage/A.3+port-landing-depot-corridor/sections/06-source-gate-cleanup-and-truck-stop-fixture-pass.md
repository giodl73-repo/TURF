# Source-Gate Cleanup And Truck-Stop Fixture Pass

## Scope

This cleanup pass does two things after the first live A.3 movement-sidecar
pass:

1. Reuses the existing WSDOT-backed Puget Sound ferry context fixture for
   ferry route membership.
2. Scans existing Overture gas/convenience and retail-complex fixtures for
   bounded truck-stop / travel-center candidates in the three highway/corridor
   target boxes.

Outputs:

- `tables/movement-ferry-route-context-review-2026-08-16.csv`
- `tables/movement-truck-stop-existing-fixture-review-2026-08-16.csv`
- `tables/movement-truck-stop-existing-fixture-summary-2026-08-16.csv`

## Ferry Route Context

The route-context pass records three packet-ready ferry route hints:

- Kingston WA: Edmonds / Kingston.
- Bainbridge Island WA: Seattle / Bainbridge Island.
- Bremerton WA: Seattle / Bremerton.

This repairs part of the source-gate problem for Kingston and Bainbridge. It
does not replace the need for a terminal-row pass. The evidence is route
context only, not terminal proof.

## Truck-Stop / Travel-Center Fixture Scan

The bounded existing-fixture scan checked:

- Arlington / Grand Prairie,
- Northeast Roosevelt,
- Cherry Hill / Moorestown.

It found no packet-ready truck-stop / highway travel-center rows inside those
target boxes. It found one excluded false positive in Cherry Hill / Moorestown:
AAA Marlton Car Care Insurance Travel Center. That row is travel-services /
car-care evidence, not truck-stop or highway travel-center evidence.

This means the first A.3 highway branch should continue to rely on the
field-aligned QSR, auto-parts, gas/convenience, pizza, and lodging layers until
a better truck-stop source is available.

## Read

The cleanup pass sharpens, rather than weakens, the highway-node read:

- Arlington / Grand Prairie remains the strongest highway/corridor seed because
  it has dense QSR, dense auto-parts, dense gas/convenience, multi-brand pizza,
  and a large lodging layer.
- The truck-stop layer remains unresolved as a distinct layer; existing
  fixtures do not add packet-ready truck-stop rows inside the three selected
  highway boxes.
- Ferry route membership is now explicit for Kingston, Bainbridge, and
  Bremerton, but terminal rows are still direct proof only for Bremerton.

## Next Gate

Do not broaden logistics yet. The next useful step is a smaller terminal/station
retry:

1. Kingston ferry terminal micro-box.
2. Bainbridge ferry terminal micro-box.
3. Center City / Market East station micro-box.
4. University City / 30th Street station micro-box.
5. Loop / River North station micro-box.

Each retry should write source gates even when it fails.

## Claim Boundary

Ferry route context does not establish ferry catchments, terminal wait, sailing
time, route choice, demand, or service adequacy. The truck-stop fixture scan is
not a complete inventory and does not establish freight volume, trip purpose,
drive-time catchment, or service adequacy.
