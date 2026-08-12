# RET Anchor Prediction Audit

## Scope

This report compares the current anchor predictions for North Seattle / South
Snohomish and selected Atlanta districts. It does not introduce new source
layers. It audits what the existing RET rules infer after the Washington mall
layer, the Atlanta grocery/mass/drugstore backfill, and the Cumberland retail
complex review fix.

Generated output:

```text
reports/ret-anchor-prediction-audit.csv
```

## Diagnostic Classes

| Class | Areas | Read |
|---|---:|---|
| `validated_active_anchor` | 2 | Lynnwood / Alderwood and Everett have mall signals plus broad active category stacks. |
| `legacy_or_redeveloping_anchor` | 2 | Northgate / Lake City and Northlake retain mall-shaped geography, but the current checked store stacks are service-weighted or thinner. |
| `urban_mall_service_grid` | 2 | Cumberland / Vinings and Buckhead / Lenox / Phipps behave like dense urban mall/service grids rather than simple suburban anchors. |
| `small_complex_or_service_modifier` | 3 | Edmonds, Mountlake Terrace, and Bothell show local complex evidence without regional-anchor depth. |
| `rule_pressure_case` | 2 | Perimeter and North Point / Alpharetta have mall signals, but the rules withhold a stronger label until category depth or geometry improves. |
| `non_complex_or_capacity_signal` | 6 | Aurora / North Seattle, Shoreline, Kenmore, Mill Creek, Camp Creek, and Decatur / Emory are read from direct store capacity rather than mall/complex anchors. |

## Learning

The useful result is not that every mall becomes an anchor. The useful result is
that the rules are cautious enough to separate active anchors, legacy mall
grids, dense urban mall/service grids, small complex modifiers, and pressure
cases.

Lynnwood / Alderwood and Everett are the clean Washington active-anchor
examples. Both combine reviewed mall evidence with home improvement, mass
retail, grocery, auto-parts, and QSR depth.

Northgate / Lake City is different. The mall signal is real, but the checked
store stack looks more like a legacy mall service grid than a current regional
anchor. Northlake shows the comparable Atlanta pattern after grocery and
drugstore backfill: the mall remains visible, while the active big-box/QSR stack
is thinner.

Buckhead / Lenox / Phipps and Cumberland / Vinings show why Atlanta cannot be
read with only city labels. Their mall districts are denser and more urban than
the Washington suburban anchors. After category backfill and the Cumberland
representative-point fix, they become mall/service grids instead of generic
capacity nodes.

Perimeter and North Point / Alpharetta are the most important falsification
cases. The model sees a mall in both places but refuses to call them active
regional mall anchors from the current evidence. That may mean the district box
is too tight, a category layer is missing nearby stores, or the rule needs a
different edge-city mall pattern. It is not being hidden by a blanket mall rule.

## Next Tests

The next useful test is not a new national category immediately. It is an
anchor audit loop:

- widen or split the Perimeter and North Point / Alpharetta district boxes;
- add store-name exemplars to the audit output for pressure cases;
- compare mall-district predictions against non-mall power centers like Camp
  Creek;
- then add another category only if it explains a specific unresolved pressure
  case.
