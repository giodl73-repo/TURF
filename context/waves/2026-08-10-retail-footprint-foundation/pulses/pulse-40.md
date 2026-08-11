# Pulse 40: RET Capacity Synthesis

## Goal

Turn the comparable Seattle/Bremerton/Atlanta RET Profile v0 outputs into a
plain-language synthesis of capacity archetypes.

## Changes

- Added `reports/ret-seattle-atlanta-capacity-synthesis.md`.
- Recorded the current place archetypes from the capacity matrix.
- Clarified that capacity is the first neutral read and rivalry requires
  spacing, corridor, route, or time evidence.

## Output

The synthesis identifies five current place archetypes:

- `complete_daily_life_node`
- `partial_anchor_qsr_node`
- `service_without_big_box_anchor`
- `thin_direct_store_layer`
- `capacity_profile_mixed`

## Learning

Seattle and Atlanta both now have complete daily-life grids at metro scale, but
Seattle is barrier-split by Puget Sound and Atlanta is a continuous inland
field. The same store-type capacity can mean different things under different
movement geography.

## Validation

```powershell
git diff --check
```
