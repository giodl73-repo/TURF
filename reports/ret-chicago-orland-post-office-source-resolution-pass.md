# Chicago Orland Post-Office Source Resolution Pass

## Scope

This pass retries Chicago post-office gates for the two source-limited mall
fields:

- Old Orchard / Skokie
- Orland Square

Generated and refreshed outputs:

```text
reports/ret-chicago-anchor-field-post-office-summary.csv
reports/ret-chicago-pre-scale-field-stack.csv
reports/ret-cross-metro-type-discovery-profile.csv
```

## Result

Orland Square now has two packet-ready USPS rows:

- Orland Park Post Office
- Orland Park Retail Post Office

Shipping Pros is retained as an excluded private shipping counter. It is useful
audit evidence but not postal civic signal.

Old Orchard / Skokie still timed out against the alternate endpoint and remains
source-gated.

## Profile Impact

Orland Square moves from two observed layers and two source-gated layers to
three observed layers and one source-gated layer. Its readiness tier moves from
`source_limited_retry_or_alternate_source` to `usable_for_type_discovery`.

Chicago now has six type-discovery-comparable fields and one partial field in
the cross-metro profile. Old Orchard / Skokie is the remaining Chicago partial
field.

## Next Step

The next Chicago cleanup target is Old Orchard post office or gym. If that gate
does not resolve, the fifth-metro decision can proceed with Old Orchard and
Camp Creek preserved as explicit source-limited rows rather than hidden
absences.
