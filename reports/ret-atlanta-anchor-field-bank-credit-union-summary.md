# Atlanta Anchor-Field Bank / Credit Union Summary

## Scope

This is the first Atlanta everyday-anchor layer after the civic summary. It uses
reviewed OSM/Overpass bank and credit-union rows, excluding ATM-only candidates
when review rules identify them.

Generated output:

```text
reports/ret-atlanta-anchor-field-bank-credit-union-summary.csv
```

Reviewed fixture:

```text
fixtures/civic/osm-bank-credit-union-atlanta-anchor-fields-review-2026-08-13.csv
```

Source gates:

```text
fixtures/civic/osm-bank-credit-union-atlanta-anchor-fields-source-gates-2026-08-13.csv
```

## First Signal

Finance returned dense signal in two fields:

- Cumberland / Vinings has 14 checked bank / credit-union rows.
- Decatur / Emory has 12 checked bank / credit-union rows.

Buckhead / Lenox / Phipps, Perimeter widened, Camp Creek, Northlake, and North
Point / Alpharetta widened remain source-gated because target-only Overpass
attempts timed out. They should not be interpreted as finance absences.

## Learning

The first everyday layer changes the Atlanta read immediately. Cumberland /
Vinings and Decatur / Emory looked like postal-only civic fields because their
library, park, and transit layers were source-gated. Finance shows both also
carry strong routine-service density.

This is important for the enclave theory: a field can be civic-light in the
checked layers but still be everyday-service rich. TURF should avoid treating
civic incompleteness as weak territory until everyday anchors are checked too.
