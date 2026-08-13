# Chicago Anchor-Field Targets

## Scope

This report defines the third-metro type-discovery target set after Washington
and Atlanta.

Generated output:

```text
reports/ret-chicago-anchor-field-targets.csv
```

## Target Set

| Field | Expected Test | Why It Matters |
|---|---|---|
| Loop / River North | `urban_core_civic_service_grid` | Tests a dense downtown field against Bellevue core and Buckhead. |
| Lincoln Park / Lakeview | `inner_neighborhood_service_village` | Tests a dense neighborhood service field without a dominant mall anchor. |
| Old Orchard / Skokie | `active_regional_mall_anchor` | Tests a mature north suburban regional mall field. |
| Oakbrook widened | `edge_city_mall_service_grid` | Tests a west suburban mall plus office/service edge-city field. |
| Woodfield / Schaumburg | `active_edge_city_regional_anchor` | Tests a large regional mall and edge-city service grid. |
| Midway / Ford City | `airport_edge_power_center` | Tests an airport-edge retail field against Atlanta Camp Creek. |
| Orland Square | `south_suburban_mall_service_grid` | Tests a south suburban regional mall/service field. |

## Readiness

All seven targets are `ready_for_context_extraction`.

Chicago is intentionally chosen for type discovery rather than final ranking.
Atlanta proved that the 11-dimension contract can travel, but also that source
quality varies by metro and category. Chicago should test whether the same
field types recur in a larger, older Midwestern metro before TURF invests in a
full atlas ranking pass.
