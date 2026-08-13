# Washington Anchor Field Bank / Credit Union Summary

## Scope

This report summarizes reviewed OSM/Overpass bank and credit-union rows inside
the six Washington anchor fields.

Generated output:

```text
reports/ret-washington-anchor-field-bank-credit-union-summary.csv
```

## Summary

| Field | Bank / credit union rows | Operator/name groups | Address-incomplete rows |
|---|---:|---:|---:|
| Bellevue core | 32 | 22 | 25 |
| Factoria | 7 | 7 | 5 |
| Southcenter / Tukwila | 11 | 11 | 3 |
| Tacoma Mall | 4 | 4 | 0 |
| Kitsap Mall / Silverdale | 13 | 12 | 3 |
| South Hill / Puyallup | 14 | 13 | 0 |

## Learning

Bank and credit-union rows are a high-coverage everyday-service layer: every
checked field has at least one reviewed row. The signal is still useful because
the density varies sharply. Bellevue core reads like a dense downtown finance
and errand field, Tacoma Mall remains thin, and Kitsap Mall / Silverdale plus
South Hill / Puyallup show stronger everyday-service depth than their civic
anchor rows alone would imply.

Address completeness varies by OSM row. Rows with incomplete address tags are
counted as packet-ready branch candidates, while ATM-only candidates are
excluded in the acquisition fixture.
