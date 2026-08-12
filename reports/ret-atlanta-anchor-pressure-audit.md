# RET Atlanta Anchor Pressure Audit

## Scope

This report tests the two Atlanta anchor pressure cases from the cross-region
audit: Perimeter and North Point / Alpharetta. It compares each original core
district box with a wider box, then keeps Camp Creek as a non-mall power-center
comparison.

Generated output:

```text
reports/ret-atlanta-anchor-pressure-audit.csv
```

## Results

| Area | Scope | Stores | Prediction | Diagnosis |
|---|---|---:|---|---|
| Perimeter | core | 11 | `mall_anchor_needs_category_depth` | Mall is detected, but the tight box lacks dual home-improvement and auto-parts depth. |
| Perimeter | wide | 25 | `urban_mall_service_grid` | Widening adds Lowe's, Advance Auto Parts, more grocery, drugstore, and QSR evidence. |
| North Point / Alpharetta | core | 4 | `mall_anchor_needs_category_depth` | The core box captures North Point Mall, Target, and two QSR brands but misses the surrounding service grid. |
| North Point / Alpharetta | wide | 21 | `urban_mall_service_grid` | Widening adds Home Depot, Lowe's, AutoZone, grocery, drugstore, mass retail, and QSR depth. |
| Camp Creek | comparison | 7 | `capacity_profile_mixed` | Camp Creek Marketplace reads as a power-center capacity node, not a mall-anchor pressure case. |

## Learning

The pressure cases are real, but they are not failures of mall detection.
Perimeter Mall and North Point Mall appear in the core boxes. The weak labels
come from drawing the box tightly around the mall instead of the surrounding
retail field.

When widened, both Perimeter and North Point / Alpharetta become
`urban_mall_service_grid` rows. They still do not become
`active_regional_mall_anchor` rows because the current rule requires stronger
auto-parts depth. That is a useful constraint: the model can say "this is a
large mall/service district" without claiming the exact same pattern as
Alderwood or Everett.

Camp Creek stays different. It has a marketplace, home improvement, mass
retail, grocery, and QSR evidence, but no reviewed mall signal. That makes it a
capacity node rather than a mall-anchor peer.

## Next Rule Question

Atlanta edge-city malls may need a separate rule from Washington suburban
regional anchors. A candidate label is `edge_city_mall_service_grid`: mall
present, broad grocery/mass/QSR/home-improvement evidence, and at least one
auto-parts brand, without requiring dual auto-parts rivalry inside the same
box.
