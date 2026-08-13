# Atlanta Anchor-Field Post-Office Summary

## Scope

This is the first Atlanta civic-context layer for the seven field targets. It
uses reviewed OSM/Overpass `amenity=post_office` rows and keeps private shipping
counters in the audit fixture while excluding them from the civic count.

Generated output:

```text
reports/ret-atlanta-anchor-field-post-office-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-post-office-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-post-office-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Post offices appear as a strong civic layer in five fetched Atlanta fields:

- Cumberland / Vinings has Akers Mill, Cumberland Mall, and Windy Hill post
  office rows after excluding Mail Boxes Etc. and UPS Store counters.
- Buckhead / Lenox / Phipps has Buckhead, Lenox Square, and Pharr Road post
  office rows.
- Perimeter widened has Chamblee, Dunwoody, Perimeter Center, and a Glenridge
  post office row.
- Northlake has three reviewed post-office-tagged rows, but all are excluded
  private shipping counters, so the field is now checked absent for
  packet-ready USPS rows rather than source-gated.
- North Point / Alpharetta widened has Alpharetta Post Office after excluding
  UPS counters.
- Decatur / Emory has Decatur and Druid Hills post office rows after excluding
  PostalAnnex and UPS counters.

Camp Creek remains source-gated because both full-fixture and target-only
Overpass attempts timed out. It should not be interpreted as a post-office
absence.

## Learning

The USPS layer is already doing useful work. Atlanta mall and edge-city fields
often carry multiple postal civic points inside the retail field, while private
shipping counters appear in the same commercial fabric and need explicit review
exclusion.

Northlake is the important source-resolution update: the alternate endpoint
returned rows, but no packet-ready USPS rows. That shifts Northlake from source
gate to checked absence for the post-office layer while preserving the private
counter audit rows.

This supports the TURF theory that postal geography is foundational, but it also
shows that OSM post-office tagging is not the same thing as an official USPS
facility list. TURF should keep the civic-anchor signal separate from delivery
areas, ZIP Codes, and private shipping storefronts.
