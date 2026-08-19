# Texas Current Anchor and Depth Review

## Reusable Output

Current-anchor review:
`tables/texas-borderlands-current-postal-anchor-review-2026-08-16.csv`.

Depth source review:
`tables/texas-borderlands-depth-review-open-sources-2026-08-16.csv`.

Depth decisions:
`tables/texas-borderlands-depth-review-decision-2026-08-16.csv`.

## Current Anchor Gate

All three Texas sidecar candidates passed the current-anchor gate:

- Aquilla,
- Tennessee Colony,
- Mountain Home.

The validator reports three `current_anchor_confirmed_inside_box` rows and
three `inside_target_box=yes` rows.

## Depth Result

Depth review rejects Tennessee Colony because Colony General Store is listed as
grocery, gas, convenience, and restaurant evidence at 1814 FM 645, and Census
places that address inside the sampled target box.

Two Texas rows survive with nearby-service constraints:

- Aquilla has nearby West, Abbott, Whitney, and Hillsboro service context, but
  reviewed open sources did not establish an inside-box everyday-service point.
- Mountain Home has nearby Mountain Home-addressed Garven Store / The Divide
  context, but Census places that address outside the sampled target box.

## Boundary

Texas adds two target-box survivors only: Aquilla and Mountain Home, both with
nearby-service constraints. This does not prove complete local service absence
or catchment isolation.
