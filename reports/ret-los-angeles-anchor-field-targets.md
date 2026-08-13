# Los Angeles / Inland Empire Anchor-Field Targets

## Scope

This report defines the fifth-metro target set after Washington, Atlanta,
Chicago, and Dallas/Fort Worth. Los Angeles / Inland Empire is a
type-discovery target, not a final atlas-ranking target.

Generated output:

```text
reports/ret-los-angeles-anchor-field-targets.csv
```

## Why Los Angeles / Inland Empire

Los Angeles / Inland Empire adds a settlement pattern the current four-metro
profile does not cover: a polycentric freeway mega-region with coastal, valley,
urban-core, port, and inland growth fields.

That matters because TURF is testing whether public retail and civic anchors
create typed enclaves. LA should stress-test whether the same field model can
separate freeway power centers, coastal-suburban mall grids, affluent
office-retail fields, valley retail edges, and port/coastal grids inside one
large region.

## Target Set

| Field | Expected Test | Why It Matters |
|---|---|---|
| Downtown LA / Koreatown / Mid-Wilshire | `dense_urban_mixed_service_field` | Tests a dense LA urban service field against Chicago Loop and Downtown / Uptown Dallas. |
| Glendale / Burbank | `valley_media_retail_edge_field` | Tests a valley media and retail edge without treating it as downtown LA. |
| West LA / Century City / Culver City | `affluent_office_retail_service_field` | Tests an affluent office and retail service field against Buckhead and NorthPark / Preston Hollow. |
| South Bay / Torrance | `coastal_suburban_mall_auto_service_field` | Tests a coastal-suburban mall and auto-service field. |
| Ontario Mills / Rancho Cucamonga | `inland_freeway_power_center_field` | Tests an Inland Empire freeway power-center field. |
| Riverside / Tyler / Corona edge | `inland_secondary_core_growth_field` | Tests an Inland Empire secondary-core and growth-edge field. |
| Long Beach / Lakewood | `port_coastal_grid_mall_service_field` | Tests a port/coastal grid and mall-service field. |

## Pre-Scale Goal

The first Los Angeles / Inland Empire stack should mirror Dallas/Fort Worth:

- post office,
- grocery,
- mass retail,
- pharmacy,
- retail complex.

That gives a five-layer type-discovery stack before expanding to full
11-dimension context.

## Readiness

All seven targets should validate to `ready_for_context_extraction`.

The acceptance gate stays the cross-metro validator:

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

Los Angeles / Inland Empire rows should enter the cross-metro profile only
after observed, checked-absent, and source-gated counts are preserved
separately.
