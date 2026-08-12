# RET Edge-City Mall Rule Audit

## Scope

This report tests a candidate `edge_city_mall_service_grid` modifier against the
existing Washington active regional mall anchors. The goal is to add an Atlanta
edge-city distinction without weakening the `active_regional_mall_anchor` rule.

Generated output:

```text
reports/ret-edge-city-mall-rule-audit.csv
```

## Candidate Rule

`edge_city_mall_service_grid` currently means:

- reviewed mall signal is present;
- at least two home-improvement brands are present;
- at least one auto-parts brand is present;
- at least three QSR brands are present;
- at least two grocery and two mass-retail brands are present.

`active_regional_mall_anchor` keeps the stronger requirement of at least two
auto-parts brands.

## Results

| Area | Candidate label | Boundary reason |
|---|---|---|
| Everett | `active_regional_mall_anchor` | Repeated auto-parts depth. |
| Lynnwood / Alderwood | `active_regional_mall_anchor` | Repeated auto-parts depth. |
| Perimeter widened | `edge_city_mall_service_grid` | Single auto-parts edge-city depth. |
| North Point widened | `edge_city_mall_service_grid` | Single auto-parts edge-city depth. |

## Learning

This preserves the most important distinction from the pressure audit. Perimeter
and North Point / Alpharetta are not thin once the surrounding retail field is
included. They are mall-centered service grids. But they still do not carry the
same repeated auto-parts depth as Alderwood and Everett.

That makes `edge_city_mall_service_grid` a useful candidate modifier. It lets
TURF describe Atlanta edge-city retail fields without forcing them into the
Washington suburban active-anchor bucket.
