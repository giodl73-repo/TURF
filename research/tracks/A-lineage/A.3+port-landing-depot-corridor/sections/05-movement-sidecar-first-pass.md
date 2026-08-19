# Movement Sidecar First Pass

## Scope

This pass starts the A.3 movement-sidecar acquisition against the bounded
target set. It deliberately avoids the broad logistics/industrial layer until a
stricter false-positive review contract exists.

Review tables:

- `tables/osm-movement-ferry-terminal-review-2026-08-16.csv`
- `tables/osm-movement-transit-center-review-2026-08-16.csv`
- `tables/osm-movement-highway-support-review-2026-08-16.csv`
- `tables/osm-movement-sidecar-first-pass-review-2026-08-16.csv`

Source gates and summary:

- `tables/osm-movement-sidecar-first-pass-source-gates-2026-08-16.csv`
- `tables/movement-sidecar-first-pass-summary-2026-08-16.csv`

## Result

The first pass attempted 15 target-layer checks:

- 3 observed,
- 2 checked absent,
- 10 source-gated by live Overpass errors or timeouts.

Observed rows:

- Bremerton ferry terminal layer: 16 raw ferry-related OSM rows, with 8
  terminal/dock/station rows packet-ready and 8 ferry-route geometry rows
  excluded from terminal counts.
- Perimeter widened transit layer: 4 packet-ready MARTA station rows reused
  from the existing reviewed Atlanta transit-center fixture.
- Arlington / Grand Prairie lodging layer: 40 packet-ready motel/hotel rows.

Checked-absent rows:

- Camp Creek transit center returned zero rows in the live target box.
- Midway / Ford City transit center returned zero rows in the live target box.

Source-gated rows:

- Kingston ferry terminal,
- Bainbridge Island ferry terminal,
- Center City / Market East transit center,
- University City / 30th Street transit center,
- Loop / River North transit center,
- Arlington / Grand Prairie truck stop,
- Northeast Roosevelt truck stop,
- Northeast Roosevelt lodging,
- Cherry Hill / Moorestown truck stop,
- Cherry Hill / Moorestown lodging.

Source-gated rows are not absences.

## Read

Bremerton now has the first direct A.3 ferry-side movement evidence: terminal,
dock, and station rows appear inside the target box. The excluded route rows are
still useful context, but they are not terminal proof.

Perimeter remains the cleanest depot/intermodal-style seed because the repo
already has four reviewed MARTA station rows inside the widened edge-city field:
Dunwoody, Medical Center, North Springs, and Sandy Springs.

Arlington / Grand Prairie gains a lodging layer on top of its existing QSR,
auto-parts, gas/convenience, and pizza evidence. That strengthens it as the
highway/corridor seed, while the truck-stop layer remains source-gated.

The first pass also shows why A.3 needs source-gate discipline. Live Overpass
queries are uneven across target boxes; timeout-heavy layers must be recorded
explicitly rather than converted into absence claims.

## Next Gate

The next useful pass should be narrower:

1. Retry ferry terminal checks for Kingston and Bainbridge only.
2. Retry transit/station checks for Center City / Market East, University City
   / 30th Street, and Loop / River North with smaller station-specific boxes.
3. Build a truck-stop / travel-center query that can use existing gas station
   data before live Overpass.
4. Defer logistics/industrial until a stricter sidecar review contract exists.

## Claim Boundary

This pass reports public movement-facility and lodging presence inside bounded
target boxes. It does not establish ferry catchments, commuter catchments,
station areas, port authority boundaries, freight flow, route choice, trip
purpose, travel demand, lodging demand, or service adequacy.
