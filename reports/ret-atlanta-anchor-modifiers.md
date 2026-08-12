# RET Atlanta Anchor Modifiers

## Scope

This report compares reviewed Georgia retail-complex evidence against the
existing selected-place Atlanta capacity matrix.

Generated output:

```text
reports/ret-atlanta-anchor-modifiers.csv
```

## Modifier Rows

| Place | Modifier | Reason |
|---|---|---|
| Atlanta | `urban_multi_mall_service_grid` | Multiple mall signals appear inside a broad city service grid. |
| Marietta | `active_regional_mall_anchor` | Cumberland Mall appears with dual home-improvement and broad service capacity. |
| Alpharetta | `active_regional_mall_anchor` | North Point Mall appears with dual home-improvement and broad service capacity. |
| Sandy Springs | `no_complex_signal` | No reviewed mall or complex row in the selected city row. |
| Roswell | `no_complex_signal` | No reviewed mall or complex row in the selected city row. |
| Decatur | `no_complex_signal` | No reviewed mall or complex row in the selected city row. |

## Learning

Atlanta differs from North Seattle because the city row contains multiple mall
and village signals at once: Lenox, Phipps, Perimeter, Greenbriar, Northlake,
Ansley, Buckhead Village, East Atlanta Village, and Emory Village. That makes
the city-level read a multi-mall service grid rather than a single anchor.

Marietta and Alpharetta look more like classic suburban mall anchors in this
city-level frame: Cumberland Mall and North Point Mall each appear with dual
home-improvement capacity, QSR depth, and auto-parts service.

The Cumberland district is split across locality labels in Overture: Cumberland
Mall appears under Marietta, while Cumberland Marketplace appears under Smyrna.
A later district-slice query should model Cumberland/Vinings directly instead
of relying only on city labels.
