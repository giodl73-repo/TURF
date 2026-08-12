# Washington Anchor-Field Targets

## Scope

This report defines the next bounded Washington retail-complex acquisition
targets. These are extraction/review boxes, not final retail geographies.

Generated output:

```text
reports/ret-washington-anchor-field-targets.csv
```

Input fixture:

```text
fixtures/geography/ret-washington-anchor-field-targets.csv
```

## Targets

| Target | Test |
|---|---|
| Bellevue core | Urban or edge-city mall/service grid. |
| Factoria | Power-center and mall-edge service grid. |
| Southcenter / Tukwila | Regional mall versus edge-city service grid. |
| Tacoma Mall | South Sound active regional mall anchor. |
| Kitsap Mall / Silverdale | Ferry-side regional anchor. |
| South Hill / Puyallup | Suburban mall service grid. |

## Learning

Pulse 60 showed that the checked Washington retail-complex layer only covers the
North Seattle / South Snohomish experiment. This fixture gives the next
extraction pass a bounded scope rather than asking for a vague statewide mall
layer.

The key constraint is that these boxes should seed candidate extraction and
human review. Anchor Profile v0 should only consume reviewed complex rows after
the candidate layer is checked.
