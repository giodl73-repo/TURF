# QSR: Atlanta Comparison

## Scope

This report backfills Georgia QSR so TURF can compare Atlanta against the
existing Washington/Puget Sound QSR read. It uses Overture Places
`2026-07-22.0`, Census 2020 ZCTA-county relationships, and Census July 2023
CBSA delineations.

This is public footprint evidence, not an official chain, franchise, Census, or
corporate territory map.

## Georgia Read

Georgia has 1259 packet-ready QSR rows in this first reviewed fixture:

| Brand | Stores |
|---|---:|
| Burger King | 266 |
| McDonald's | 449 |
| Taco Bell | 255 |
| Wendy's | 289 |
| Total | 1259 |

The layer reaches 321 ZIP-derived ZCTA candidates and 127 Georgia counties.

## Atlanta CBSA

Atlanta-Sandy Springs-Roswell CBSA (`12060`) has 639 packet-ready QSR rows:

| Brand | Stores |
|---|---:|
| Burger King | 119 |
| McDonald's | 229 |
| Taco Bell | 135 |
| Wendy's | 156 |
| Total | 639 |

Major county read:

| County | Leader | Stores | Total | Status |
|---|---|---:|---:|---|
| Fulton County | McDonald's | 38 | 96 | contested |
| Gwinnett County | McDonald's | 34 | 98 | contested |
| Cobb County | McDonald's | 29 | 84 | contested |
| DeKalb County | McDonald's | 30 | 73 | contested |
| Henry County | McDonald's | 12 | 34 | contested |

## Ring Read

Atlanta QSR is contested in every distance ring from the downtown core:

| Ring | Leader | Leader stores | Total stores | Status |
|---|---|---:|---:|---|
| urban_core | McDonald's | 33 | 88 | contested |
| inner_suburb | McDonald's | 106 | 294 | contested |
| outer_suburb | McDonald's | 83 | 234 | contested |
| exurb | McDonald's | 7 | 23 | contested |

## Seattle Comparison

| Measure | Seattle CBSA | Atlanta CBSA | Read |
|---|---:|---:|---|
| QSR rows | 274 | 639 | Atlanta has 2.3x the observed QSR rows. |
| McDonald's rows | 126 | 229 | McDonald's is the default layer in both metros. |
| Burger King rows | 49 | 119 | Burger King is much larger in Atlanta. |
| Taco Bell rows | 60 | 135 | Taco Bell scales strongly in Atlanta. |
| Wendy's rows | 39 | 156 | Wendy's is the biggest relative difference. |

Seattle/Puget Sound taught us ferry-side selectivity: Bainbridge Island and
Kingston are single-brand QSR nodes, while Bremerton, Poulsbo, Silverdale, and
Port Orchard are four-brand contested grids.

Atlanta teaches a different pattern. Without the ferry barrier, the QSR layer
is massive and continuously contested across the urban core, inner suburbs,
outer suburbs, and exurbs. McDonald's is still the default grid, but Wendy's,
Taco Bell, and Burger King fill in enough that the whole metro behaves like a
large contested daily-food field rather than a few isolated restaurant nodes.

## What We Are Learning

QSR is not just "more stores." It exposes the ordinary commercial fabric. Home
improvement shows regional destination anchors. Auto parts shows local service
meshes. QSR shows daily-life strips, commute corridors, suburban nodes, and
small-city defaults.

The Atlanta backfill makes the comparison sharper:

- Puget Sound has geographic barriers that create single-brand ferry-side QSR
  nodes.
- Atlanta has ring continuity: QSR remains contested from core to exurb.
- Wendy's appears much stronger in Georgia than in Washington.
- McDonald's remains the broad default in both places, but it is not alone
  enough to make the metros uncontested.

## Caveats

- Rows are Overture-derived candidates, not official store censuses.
- Ten Georgia rows remain `needs_review` because their ZIP-derived candidates
  do not join to the Census 2020 ZCTA relationship file.
- Ring classification is straight-line distance from downtown Atlanta, not a
  Census urban/suburban definition or a drive-time catchment.
