# Next Breadth Wave Manifest

## Reusable Output

Next breadth manifest:
`tables/a1b-next-breadth-wave-manifest-2026-08-16.csv`.

Frequency controls:
`tables/a1b-next-breadth-wave-frequency-controls-2026-08-16.csv`.

Updated readiness gates:
`tables/a1b-sampled-frequency-readiness-gates-2026-08-16.csv`.

## Purpose

The sampled-frequency design required three missing pieces before adding more
breadth: a manifest, a selection rule, and a source-gate threshold. This
section fills those design gates without treating planned rows as completed
evidence.

## Selected Manifest Rows

The next planned breadth wave has six 12-target manifest rows:

- Alaska / Arctic Remote,
- Northern California / California Interior,
- Southern California / California Interior,
- Texas / Borderlands Replication,
- Minnesota / Upper Midwest Lakes,
- Mississippi / Deep South Delta.

Current Geofabrik source availability was checked before selection. Alaska,
NorCal, SoCal, Texas, Minnesota, and Mississippi all have current GeoPackage
extract paths available through Geofabrik.

## Selection Rule

For each manifest row:

1. extract reviewed named public post-office seed rows,
2. validate seed rows,
3. join settlement-size proxy rows,
4. build target boxes,
5. sort eligible seed rows by deterministic SHA256 ordering with seed
   `a1b-wave2-2026-08-16`,
6. take the first 12 eligible target boxes.

This gives 72 planned target boxes for comparability with the completed
six-stratum denominator. It is still a planned breadth wave, not completed
evidence.

## Source-Gate Threshold

Frequency language remains blocked if either condition occurs:

- source-gated or excluded rows exceed 20 percent overall,
- source-gated or excluded rows exceed 4 of 12 within any manifest row.

Rows can still be reported descriptively with source gates visible.

## Readiness Update

The sampled-frequency readiness gates now pass for:

- denominator builder,
- denominator validator,
- exclusion ledger,
- completed truth dossiers,
- truth-dossier synthesis,
- next-wave selection rule,
- source-gate threshold,
- selected next breadth manifest.

They still fail for:

- executed next breadth artifacts.

## Boundary

This manifest selects the next planned breadth wave and source-control rules.
It does not create seed extracts, target boxes, sidecar outputs, denominator
rows, regional frequency, national frequency, complete service absence,
catchment isolation, service adequacy, trade areas, income, spending, or
customer behavior.
