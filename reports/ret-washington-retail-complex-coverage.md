# Washington Retail-Complex Coverage Audit

## Scope

This audit checks whether the current reviewed Washington retail-complex layer
can support a second Puget Sound anchor-profile test beyond North Seattle /
South Snohomish.

Generated output:

```text
reports/ret-washington-retail-complex-coverage.csv
```

## Result

The current layer is not statewide. It contains 15 packet-ready retail-complex
rows, all in the North Seattle / South Snohomish field:

| City | Complexes | Mall rows |
|---|---:|---:|
| Seattle | 1 | 1 |
| Lynnwood | 4 | 1 |
| Mountlake Terrace | 3 | 0 |
| Edmonds | 2 | 0 |
| Bothell | 1 | 0 |
| Everett | 4 | 1 |

## Learning

This means TURF should not yet use Washington to test a second metro or a wider
Puget Sound anchor profile. The category layers for home improvement, grocery,
mass retail, auto parts, drugstores, and QSR are broader, but the reviewed
retail-complex layer only covers the North Seattle / South Snohomish experiment.

That is the right failure mode. The anchor profile now has a validator,
generator, and summary command, so it can tell us when the source layer is not
wide enough for the next geography question.

## Next Acquisition

Before testing Bellevue, Southcenter/Tukwila, Tacoma Mall, Kitsap Mall, or
South Hill/Puyallup as additional Washington anchor fields, TURF needs a bounded
retail-complex extraction/review pass for those mall fields.
