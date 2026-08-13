# Atlanta Source-Resolution Pass

## Scope

This report records the first Atlanta source-resolution pass after the
four-metro next-scale decision.

Evidence touched:

```text
fixtures/civic/osm-post-office-atlanta-anchor-fields-review-2026-08-13.csv
fixtures/civic/osm-post-office-atlanta-anchor-fields-source-gates-2026-08-13.csv
reports/ret-atlanta-anchor-field-post-office-summary.csv
reports/ret-atlanta-anchor-field-civic-context-summary.csv
reports/ret-atlanta-anchor-field-context-summary.csv
reports/ret-atlanta-pre-scale-readiness.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Work

The pass retried Northlake post-office extraction through the alternate
Overpass endpoint `https://overpass.kumi.systems/api/interpreter`.

Result:

- Northlake returned three reviewed post-office-tagged rows.
- Zero rows are packet-ready USPS post offices.
- Three rows are excluded private shipping counters.
- Northlake was removed from the post-office source-gate fixture.

## Result

Northlake moved from:

```text
source_gated_dimensions=10, checked_absent_dimensions=0
post_office_signal=source_gated
```

to:

```text
source_gated_dimensions=9, checked_absent_dimensions=1
post_office_signal=checked_absent
```

This does not make Northlake stronger. It makes the evidence cleaner: the
post-office layer is no longer unknown for Northlake, but it still does not
produce a packet-ready USPS anchor inside the selected field.

## Learning

Northlake shows why source resolution is not always promotion. A resolved query
can produce checked absence, and that is better than preserving a timeout as if
it were unknowable.

The field remains source-limited overall because library, park/open-space,
transit, bank/credit-union, gas/convenience, dollar-store, hardware,
laundromat, and gym layers are still source-gated. The next Atlanta pass should
target either Camp Creek post office or a civic/service layer that can reduce
multiple Atlanta fields.
