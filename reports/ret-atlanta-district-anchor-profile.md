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
| Cumberland / Vinings | 8 | `capacity_profile_mixed` | Cumberland Marketplace, one home-improvement row, and four QSR brands; Cumberland Mall itself falls outside this first box/locality cut. |
| Buckhead / Lenox / Phipps | 4 | `mall_anchor_needs_category_depth` | Buckhead Village, Lenox, and Phipps appear, but the current checked store stack is mostly complex evidence plus one QSR row. |
| Perimeter | 5 | `mall_anchor_needs_category_depth` | Perimeter Mall appears with one home-improvement row and two QSR brands, but not enough category depth for an active regional-anchor call. |
| Camp Creek | 5 | `thin_direct_store_layer` | Camp Creek Marketplace appears with one home-improvement row and three QSR brands. |
| Northlake | 1 | `mall_anchor_needs_category_depth` | Northlake Mall appears without nearby checked category depth in this first slice. |
| North Point / Alpharetta | 3 | `mall_anchor_needs_category_depth` | North Point Mall appears with two QSR brands but no direct home-improvement or auto-parts rows in this tight slice. |
| Decatur / Emory | 3 | `thin_direct_store_layer` | Emory Village appears with limited QSR evidence. |

## Learning

The Atlanta city-level read predicted an urban multi-mall service grid, but the
district-slice read is more cautious. Malls appear where expected, yet the
current checked Georgia layers do not always stack inside the first bounding
boxes.

That is a productive failure mode. It shows that RET predictions depend on:

- the selected geography, because city labels and district boxes produce
  different evidence;
- category coverage, because Georgia does not yet have the Washington grocery,
  mass-retail, and drugstore layers;
- edge geometry, because Cumberland Mall and Cumberland Marketplace split across
  locality labels and district edges.

The next Atlanta step should widen or refine district slices and backfill
Georgia grocery, mass retail, and drugstore layers before treating a district as
active, legacy, or underfilled.
