# RET Seattle / Atlanta Spacing Readout

## Scope

This report adds same-place spacing evidence to the RET Profile v0 capacity
matrix. It asks whether a place's co-present brands are merely available in the
same city row or whether they are close enough to support a stronger
same-place rivalry signal.

Generated output:

```text
reports/ret-profile-v0-place-spacing-summary.csv
```

## Read Method

The query computes nearest opposite-brand spacing within the same selected
place and category. It uses straight-line distance between public store points.

Spacing hints:

- `capacity_only_single_brand_or_absent`: fewer than two same-category brands
- `co_presence_spacing_observed`: opposite-brand spacing exists, but the close
  threshold is not met
- `same_place_rivalry_signal`: at least two nearest opposite-brand links under
  0.5 miles
- `strong_same_place_rivalry_signal`: at least two nearest opposite-brand links
  under 0.25 miles

## First Learning

This is the first layer that can upgrade some capacity reads into stronger
rivalry candidates. It still does not claim corporate territories; it only says
that same-category brands are near each other in the same selected place.

In the current profile, dense cities tend to show close QSR and auto-parts
spacing. Thin ferry-side places do not: Bainbridge Island and Kingston remain
capacity-thin reads because they do not have enough same-category brand
co-presence for spacing rivalry.

Bremerton remains important because it has no direct home-improvement anchor in
the selected city row, but it does have dense QSR and auto-parts capacity. That
is a different enclave shape from Silverdale, which has dual home-improvement
anchors plus QSR and auto-parts service.

Atlanta now has all three daily-life categories in the same selected city row.
The next refinement should compare these same-place straight-line distances
with corridor or road-network evidence, especially for Atlanta suburbs where
retail strips may matter more than city labels.

## Caveat

Straight-line spacing is a first-pass signal. It does not account for water,
ferries, road turns, limited-access highways, parcel access, or drive time.
