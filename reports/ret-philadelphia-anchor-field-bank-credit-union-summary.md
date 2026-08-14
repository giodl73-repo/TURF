# Philadelphia / South Jersey Anchor-Field Bank / Credit Union Summary

## Scope

This is the first Philadelphia / South Jersey everyday finance layer after the
sixth-metro pre-scale synthesis. It uses reviewed OSM/Overpass bank and
credit-union rows, excluding ATM-only candidates when review rules identify
them.

Generated output:

```text
reports/ret-philadelphia-anchor-field-bank-credit-union-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-bank-credit-union-philadelphia-anchor-fields-review-2026-08-13.csv
```

## Current Read

The Philadelphia / South Jersey bank / credit union fixture has 161
packet-ready rows across all eight fields. No field is checked absent or
source-gated in the final two-endpoint pass.

| Field | Rows | Operators | Signal |
|---|---:|---:|---|
| Center City / Market East | 64 | 25 | `observed_dense` |
| University City / 30th Street | 12 | 10 | `observed` |
| King of Prussia | 8 | 8 | `observed` |
| Northeast Philadelphia / Roosevelt Boulevard | 20 | 13 | `observed_dense` |
| Conshohocken / Plymouth Meeting | 16 | 13 | `observed` |
| South Philadelphia Sports / Port | 6 | 5 | `observed` |
| Camden Waterfront / Cooper | 6 | 6 | `observed` |
| Cherry Hill / Moorestown | 29 | 19 | `observed_dense` |

## Learning

Finance-service signal reaches every Philadelphia / South Jersey field, which
makes it different from pharmacy, mass retail, retail-complex, and auto-parts
layers. It is a strong everyday-service fabric rather than a mall-only or
auto-corridor-only signal.

The dense fields are also revealing:

- Center City / Market East is the clear finance-service core.
- Northeast Roosevelt combines finance density with QSR and auto-parts
  corridor evidence, strengthening its older auto-corridor service-grid read.
- Cherry Hill / Moorestown combines finance density with mall, big-box,
  grocery, pharmacy, QSR, and auto-service signal, making it the fullest South
  Jersey corridor in this stack.

King of Prussia remains specialized. It has observed finance rows, but not
dense finance signal, and still reads as mall-led rather than a full everyday
service corridor inside the bounded box.

Camden is no longer just a thin postal/grocery/QSR field after this layer. It
has observed bank / credit union rows, but the count is still light, so the
field should be interpreted as an older river civic/service field rather than
upgraded to a major retail corridor.
