# Philadelphia / South Jersey Anchor-Field Targets

## Scope

This report defines the sixth-metro target set after Washington, Atlanta,
Chicago, Dallas/Fort Worth, and Los Angeles / Inland Empire. Philadelphia /
South Jersey is a type-discovery target, not a final atlas-ranking target.

Generated output:

```text
reports/ret-philadelphia-anchor-field-targets.csv
```

Source fixture:

```text
fixtures/geography/ret-philadelphia-anchor-field-targets.csv
```

## Why Philadelphia / South Jersey

Philadelphia / South Jersey adds a terrain shape the current five-metro profile
does not cover: dense Northeast rail and civic fabric, older industrial river
geography, cross-state retail fields, and mature suburban mall or edge-city
anchors.

That matters because TURF is testing whether public civic and retail anchors
create typed enclaves. Philadelphia should stress-test whether the same field
model can separate rail-oriented downtown districts, eds-and-meds service
fields, river office edges, older auto corridors, event/port edges, and South
Jersey mall corridors inside one metro system.

## Target Set

| Field | Expected Test | Why It Matters |
| --- | --- | --- |
| Center City / Market East | `dense_rail_civic_everyday_grid` | Tests Northeast downtown rail civic and retail density against Chicago Loop and Downtown LA. |
| University City / 30th Street | `eds_meds_rail_service_field` | Tests university hospital and rail anchored service geography. |
| King of Prussia | `superregional_mall_edge_city_field` | Tests a Northeast superregional mall and edge-city office field. |
| Northeast Philadelphia / Roosevelt Boulevard | `inner_suburban_auto_corridor_field` | Tests dense older auto corridor and neighborhood service retail. |
| Conshohocken / Plymouth Meeting | `river_office_edge_service_field` | Tests Schuylkill river office edge and suburban retail transition. |
| South Philadelphia Sports / Port | `event_port_auto_service_field` | Tests sports event port and auto-service terrain. |
| Camden Waterfront / Cooper | `industrial_river_civic_transit_field` | Tests cross-river older industrial civic transit field. |
| Cherry Hill / Moorestown | `south_jersey_mall_edge_field` | Tests South Jersey mall corridor and cross-state suburban retail field. |

## Pre-Scale Goal

The first Philadelphia / South Jersey stack should use the sixth-metro standard:

- post office or documented postal/civic source-gate status,
- grocery,
- mass retail,
- pharmacy,
- retail complex,
- QSR sidecar,
- auto-parts sidecar,
- QSR / auto-parts comparison readout.

QSR and auto parts remain sidecars for interpretation. They should not be
counted as core cross-metro profile dimensions yet.

## Readiness

All eight targets should validate to `ready_for_context_extraction`.

The acceptance gate stays the cross-metro validator:

```powershell
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
```

Philadelphia / South Jersey rows should enter the cross-metro profile only
after observed, checked-absent, and source-gated counts are preserved
separately.
