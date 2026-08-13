# Atlanta Anchor-Field Gym Summary

## Scope

This report tests wellness-service texture across the seven Atlanta anchor
fields using OSM/Overpass `leisure=fitness_centre` rows.

Generated output:

```text
reports/ret-atlanta-anchor-field-gym-summary.csv
```

## Current Read

| Field | Gym Rows | Signal | Names / Gate |
|---|---:|---|---|
| Cumberland / Vinings | 6 | `observed_dense` | LA Fitness; Orangetheory Fitness; Pepper Boxing; Planet Fitness; Pure Barre; Windy Hill Athletic Club |
| Buckhead / Lenox / Phipps | 1 | `observed` | Life Time |
| Perimeter widened | 0 | `source_gated` | `overpass_target_timeout` |
| Camp Creek | 1 | `observed` | LA Fitness |
| Northlake | 0 | `source_gated` | `overpass_target_timeout` |
| North Point / Alpharetta widened | 17 | `observed_dense` | Alloy; Bodybar Pilates; Club Pilates; Club Pilates; Fit 4...; Harris Health and Fitness; Hotworx; Life Time; Omni Fight Club; Omni Fight Club; One Fellowship Fitness; Planet Fitness; Pure Barre; Solidcore; Sport Performance; Workout Anytime; YouFit |
| Decatur / Emory | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Gym is the strongest Atlanta everyday-service layer so far. Cumberland /
Vinings and North Point / Alpharetta widened are dense wellness-service fields,
while Buckhead and Camp Creek each gain a checked fitness anchor.

This changes the Atlanta pre-scale read. Cumberland is now finance,
household-service, and wellness dense. North Point is open-space, health, and
wellness dense. Camp Creek receives its first observed non-pharmacy context
signal after many earlier source gates.
