# Washington Anchor-Field Profile

## Scope

This report tests the six Washington anchor fields against the newly reviewed
anchor-field retail-complex layer and the existing Washington chain layers.

Generated outputs:

```text
reports/ret-washington-anchor-field-profile.csv
```

## Anchor Modifiers

| Field | Reviewed complexes | Total stores | Modifier | Evidence |
|---|---:|---:|---|---|
| Bellevue core | 3 | 8 | `small_complex_service_edge` | `capacity_first` |
| Factoria | 1 | 7 | `complex_service_modifier` | `capacity_first` |
| Southcenter / Tukwila | 4 | 11 | `urban_mall_service_grid` | `strong_rivalry_supported` |
| Tacoma Mall | 3 | 10 | `urban_mall_service_grid` | `rivalry_supported` |
| Kitsap Mall / Silverdale | 3 | 18 | `active_regional_mall_anchor` | `strong_rivalry_supported` |
| South Hill / Puyallup | 2 | 17 | `active_regional_mall_anchor` | `strong_rivalry_supported` |

## Learning

The reviewed complex layer materially changes the Puget Sound read. Kitsap Mall
/ Silverdale and South Hill / Puyallup both meet the active regional-anchor
test because they combine reviewed mall signal with home improvement,
auto-parts, grocery, mass-retail, drugstore, and QSR depth. Southcenter and
Tacoma Mall have reviewed mall signal plus dense service evidence, but they do
not reach the active rule because each is missing one of the direct-store depth
conditions in the bounded field.

Bellevue core is the main acquisition gap. The field has Bellevue Plaza,
Ashwood Plaza, and Plaza East, but the reviewed source does not surface
Bellevue Square or Lincoln Square as packet-ready complex rows. The model
therefore reads Bellevue as a small complex/service edge, which is likely a data
coverage result rather than a true market-type conclusion.

Factoria lands as a complex service modifier. It has The Marketplace at Factoria
plus QSR and some big-box/service evidence, but the bounded field does not yet
show enough reviewed mall or cross-category depth to behave like an active
regional anchor.

## Profile Impact

Compared with Anchor Profile v0's prior Washington scope, the new layer extends
reviewed anchor evidence beyond North Seattle / South Snohomish into South
King, South Sound, Kitsap, and Pierce County fields. It also shows why TURF
should keep acquisition quality separate from model judgment: Bellevue's low
modifier is a source-coverage warning, while Kitsap and South Hill are genuine
multi-category anchor fields in the checked data.
