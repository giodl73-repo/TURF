# Atlanta Anchor-Field Civic Context Summary

## Scope

This report combines the four Atlanta civic dimensions started so far:

- post offices
- libraries
- parks / open space
- transit centers

The summary keeps observed dimensions and source-gated dimensions side by side.
That is necessary because Atlanta OSM/Overpass acquisition has been much less
stable than the completed Washington civic pass.

Generated output:

```text
reports/ret-atlanta-anchor-field-civic-context-summary.csv
```

## Current Read

| Field | Observed Civic Dimensions | Source-Gated Civic Dimensions | Civic Archetype |
|---|---:|---:|---|
| Cumberland / Vinings | 1 | 3 | `postal_only_civic_field` |
| Buckhead / Lenox / Phipps | 3 | 1 | `postal_library_open_space_civic_stack` |
| Perimeter widened | 2 | 2 | `postal_transit_edge_city_field` |
| Camp Creek | 0 | 2 | `partial_civic_source_gate` |
| Northlake | 1 | 2 | `partial_civic_source_gate` |
| North Point / Alpharetta widened | 2 | 2 | `postal_open_space_edge_field` |
| Decatur / Emory | 1 | 3 | `postal_only_civic_field` |

## Learning

Buckhead is the strongest observed civic stack: postal rows, Buckhead Library,
and dense open-space rows all sit inside the same urban luxury mall field.

Perimeter is the mobility civic field: postal rows plus four MARTA station rows
inside the widened edge-city geography.

North Point is the open-space edge-city field: postal rows plus dense park/open
space rows, but still source-gated on library and transit.

Cumberland / Vinings and Decatur / Emory currently read as postal-only civic
fields, but each has three unresolved civic source gates.

Camp Creek is now resolved for the post-office and library layers but still
unresolved for park/open-space and transit. Its alternate post-office retry
returned two private shipping counters and zero packet-ready USPS rows, and its
library retry returned no packet-ready rows. That makes it a checked-absent
civic gap rather than a hidden acquisition failure.

Northlake is now resolved for post office and library: post-office is checked
absent after the private-counter retry, while Northlake-Barbara Loar Branch is
observed as a public library row. Park/open-space and transit remain unresolved
source gates, so the field is still partial but no longer civic-blank.

## Next Step

Move into everyday anchors only with this caveat visible: Atlanta civic
comparability is partial. Everyday anchors can still add signal, but source
gates must remain explicit until the civic acquisition gaps are resolved.
