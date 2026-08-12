# RET Atlanta District Anchor Profile

## Scope

This report tests Atlanta anchor districts below the city label. It uses simple
latitude/longitude slices around named retail districts and compares reviewed
retail-complex rows against existing Georgia home-improvement, auto-parts, and
QSR layers.

Generated output:

```text
reports/ret-atlanta-district-anchor-profile.csv
```

## District Rows

| District | Stores | Modifier | Evidence |
|---|---:|---|---|
| Cumberland / Vinings | 13 | `urban_mall_service_grid` | Cumberland Mall, Cumberland Marketplace, grocery, mass retail, one home-improvement row, and four QSR brands. |
| Buckhead / Lenox / Phipps | 12 | `urban_mall_grocery_grid` | Buckhead Village, Lenox, Phipps, drugstore, four grocery brands, and one mass-retail row appear without big-box service depth. |
| Perimeter | 11 | `mall_anchor_needs_category_depth` | Perimeter Mall appears with drugstore, grocery, mass retail, QSR, and one home-improvement brand, but no auto-parts or dual home-improvement depth. |
| Camp Creek | 7 | `capacity_profile_mixed` | Camp Creek Marketplace appears with grocery, mass retail, one home-improvement row, and three QSR brands. |
| Northlake | 8 | `legacy_mall_grocery_service_grid` | Northlake Mall appears with drugstore, four grocery brands, and one mass-retail row, but little QSR or big-box service evidence in this slice. |
| North Point / Alpharetta | 4 | `mall_anchor_needs_category_depth` | North Point Mall appears with mass retail and two QSR brands but no direct home-improvement, grocery, or auto-parts rows in this tight slice. |
| Decatur / Emory | 10 | `capacity_profile_mixed` | Emory Village appears with drugstore, four grocery brands, mass retail, and limited QSR evidence. |

## Learning

The Georgia grocery and mass-retail backfill changes the district read. The
first version found mall evidence without enough category depth. The updated
profile shows that several districts were underfilled because grocery and mass
retail had not yet been added.

Buckhead / Lenox / Phipps is now an `urban_mall_grocery_grid`: it has three
complex signals, four grocery brands, and mass retail, but lacks the
home-improvement and auto-parts stack of an active regional mall anchor.

Northlake is now a `legacy_mall_grocery_service_grid`: the mall remains visible
and grocery is strong, but QSR and big-box service depth are thin in the current
slice.

The Cumberland/Vinings correction shows why reviewed source quality matters
before changing geography. The district box already covered the real Cumberland
Mall point, but the reviewed layer had promoted an outlying duplicate. After the
review fix, Cumberland/Vinings carries both Cumberland Mall and Cumberland
Marketplace and upgrades to `urban_mall_service_grid`.

Perimeter remains a pressure case. It has Perimeter Mall, grocery, mass retail,
drugstore, QSR, and one home-improvement brand, but the rule still withholds an
active regional-anchor call because auto parts and dual home-improvement depth
are absent.

Drugstores improve service-completeness evidence without over-upgrading mall
districts. This is important: the model does not treat every added service
layer as proof of an active regional anchor.

This shows that RET predictions depend on:

- the selected geography, because city labels and district boxes produce
  different evidence;
- category coverage, because adding grocery and mass retail changes the
  prediction;
- edge geometry, because Cumberland Mall and Cumberland Marketplace split across
  locality labels and district edges.

The next Atlanta step should widen or refine district slices before treating a
district as active, legacy, or underfilled.
