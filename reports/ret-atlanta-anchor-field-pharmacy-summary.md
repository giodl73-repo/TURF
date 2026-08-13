# Atlanta Anchor-Field Pharmacy Summary

## Scope

This is the third Atlanta everyday-anchor layer after the civic summary. It uses
the reviewed Georgia drugstore layer as a pharmacy / health-errand proxy and
intersects packet-ready rows with the seven bounded Atlanta fields.

Generated output:

```text
reports/ret-atlanta-anchor-field-pharmacy-summary.csv
```

Source fixture:

```text
fixtures/stores/overture-drugstore-georgia-review-2026-07-22.csv
```

## First Signal

Pharmacy appears in five Atlanta fields:

- Buckhead / Lenox / Phipps has 1 row.
- Perimeter widened has 2 rows.
- Northlake has 1 row.
- North Point / Alpharetta widened has 1 row.
- Decatur / Emory has 1 row.

Cumberland / Vinings and Camp Creek are checked absent inside the current
bounded fields.

## Learning

Pharmacy adds health-errand texture without adding a new source gate. Decatur /
Emory strengthens further: it now stacks finance, gas/convenience, and pharmacy
on top of postal civic signal.

Buckhead gains health-errand signal on top of its postal/library/open-space
stack. Perimeter gains pharmacy on top of postal/transit evidence. Northlake
gets its first observed context dimension in the current Atlanta pass, and North
Point adds pharmacy to its postal/open-space edge-city signal.
