# Anchor Field Context Dimensions

## Scope

Anchor Field Context v0 defines the civic and everyday-anchor dimensions TURF
should measure before scaling anchor profiles to more urban areas.

Generated output:

```text
reports/ret-anchor-field-context-dimensions.csv
```

## Dimension Groups

| Group | Source status | Dimensions |
|---|---|---|
| Civic anchors | `active_reviewed_civic_layer` | post office |
| Civic anchors | `source_gate_pending` | library; park; transit center |
| Everyday anchors | `active_reviewed_store_layer` | pharmacy |
| Everyday anchors | `source_gate_pending` | bank / credit union; dollar store; gas / convenience; gym; hardware; laundromat |

## Learning

The contract keeps USPS/postal infrastructure separate from civic amenities and
routine errand stores. That matters for scaling: a mall field, a postal
identity field, and a daily-life service field may overlap, but they should not
be collapsed into one signal.

Post office now has an active checked civic proxy through the reviewed
OSM/Overpass layer. Pharmacy has an active checked everyday proxy through the
reviewed Washington drugstore layer. Other civic and everyday dimensions remain
source-gated until TURF adds reviewed public-source rows.
